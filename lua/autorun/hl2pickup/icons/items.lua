--[[------------------------------------------------------------------
  ITEM ICONS
  Draw item pickups
]]--------------------------------------------------------------------

if CLIENT then

  -- Parameters
  local DEFAULT_FONT = "hl2pickup_weapon";
  local NAME_FONT = "hl2pickup_name";
  local INVALID_CHAR = "�";

  -- Item icons list
  HL2PICKUP.ItemIcons = {};

  --[[
    Avoids the system to add an item to the tray
    @param {string} item class
  ]]
  function HL2PICKUP:AddItemOverride(itemClass)
    HL2PICKUP.ItemIcons[itemClass] = -1;
  end

  --[[
    Adds a font based item icon
    @param {string} item class
    @param {string} character
    @param {string} font
    @param {number|nil} x
    @param {number|nil} y
  ]]
  function HL2PICKUP:AddItemIcon(itemClass, char, font, x, y)
    HL2PICKUP.ItemIcons[itemClass] = {char = char, font = font, x = x or 0, y = y or 0};
  end

  --[[
    Adds either a .png or a .vtf image as an icon
    @param {string} item class
    @param {IMaterial|number} texture
    @param {number} w
    @param {number} h
    @param {boolean|nil} coloured
  ]]
  function HL2PICKUP:AddItemImage(itemClass, texture, w, h, coloured)
    HL2PICKUP.ItemIcons[itemClass] = {texture = texture, w = w, h = h, coloured = coloured or false};
  end

  --[[
    Adds either a .png or a .vtf image as an icon
    @param {string} item class
    @param {IMaterial|number} texture
    @param {number} w
    @param {number} h
    @param {number|nil} u1
    @param {number|nil} v1
    @param {number|nil} u2
    @param {number|nil} v2
    @param {number|nil} file width
    @param {number|nil} file height
    @param {boolean|nil} coloured
  ]]
  function HL2PICKUP:AddItemImageUV(itemClass, texture, w, h, u1, v1, u2, v2, fileW, fileH, coloured)
    HL2PICKUP.ItemIcons[itemClass] = {texture = texture, w = w, h = h, u1 = u1 or 0, v1 = v1 or 0, u2 = u2 or 1, v2 = v2 or 1, fileW = fileW or w, fileH = fileH or h, coloured = coloured or false};
  end

  --[[
    Returns whether the given item class has an icon
    @param {string} item class
    @return {boolean} exists
  ]]
  function HL2PICKUP:HasItemIcon(itemClass)
    return HL2PICKUP.ItemIcons[itemClass] ~= nil;
  end

  --[[
    Gets an item icon's data
    @param {string} ammunition type
    @return {table} icon data
  ]]
  function HL2PICKUP:GetItemIcon(itemClass)
    if (not HL2PICKUP:HasItemIcon(itemClass)) then return {char = INVALID_CHAR, font = DEFAULT_FONT, x = 0, y = 0}; end
    return HL2PICKUP.ItemIcons[itemClass];
  end

  --[[
    Returns the height of an item icon
    @param {string} ammunition type
    @return {number} height
  ]]
  function HL2PICKUP:GetItemIconHeight(ammoType)
    local data = HL2PICKUP:GetItemIcon(ammoType);

    if (data.texture ~= nil) then
      return data.h * HL2PICKUP:GetScale();
    else
      surface.SetFont(data.font);
      local w, h = surface.GetTextSize(data.char);
      return h;
    end
  end

  --[[
    Draws an item icon
    @param {number} x
    @param {number} y
    @param {string} item type
    @param {number|nil} alpha
    @param {number|nil} horizontal alignment
    @param {number|nil} vertical alignment
  ]]
  function HL2PICKUP:DrawItemIcon(x, y, itemClass, alpha, horAlign, verAlign)
    alpha = alpha or 1;
    horAlign = horAlign or TEXT_ALIGN_RIGHT;
    verAlign = verAlign or TEXT_ALIGN_CENTER;

    local colour = HL2PICKUP:GetColour();

    if (HL2PICKUP:HasItemIcon(itemClass) or (not HL2PICKUP:HasItemIcon(itemClass) and HL2PICKUP:GetItemDisplayMode() == 1)) then
      local data = HL2PICKUP:GetItemIcon(itemClass);
      if (data.texture ~= nil) then

        local w, h = data.w * HL2PICKUP:GetScale(), data.h * HL2PICKUP:GetScale();

        -- Choose texture colour
        if (not data.coloured) then
          colour = Color(255, 255, 255);
        end

        -- Setup alignment
        if (horAlign == TEXT_ALIGN_CENTER) then
          x = x + w * 0.5;
        elseif (horAlign == TEXT_ALIGN_RIGHT) then
          x = x - w;
        end

        if (verAlign == TEXT_ALIGN_CENTER) then
          y = y + h * 0.5;
        elseif (verAlign == TEXT_ALIGN_BOTTOM) then
          y = y - h;
        end

        -- Setup and render texture
        if (type(data.texture) == "number") then
          surface.SetTexture(data.texture);
        else
          surface.SetMaterial(data.texture);
        end
        surface.SetDrawColor(Color(colour.r, colour.g, colour.b, colour.a * alpha));

        if (data.u1 ~= nil) then
          surface.DrawTexturedRectUV(x, y, w, h, data.u1/data.fileW, data.v1/data.fileH, data.u2/data.fileW, data.v2/data.fileH);
        else
          surface.DrawTexturedRect(x, y, w, h);
        end
      else
        draw.SimpleText(data.char, data.font, x + data.x * HL2PICKUP:GetScale(), y + data.y * HL2PICKUP:GetScale(), Color(colour.r, colour.g, colour.b, colour.a * alpha), horAlign, verAlign);
      end
    else
      -- Sanitize the name
      local itemName = string.lower(itemClass);
      string.Replace(itemName, "_", " ");

      surface.SetFont(NAME_FONT);
      local w, h = surface.GetTextSize(itemName);

      -- Add 'item icon' like in 'gauss ammo icon'
      local rows = 1;
      if (HL2PICKUP:GetItemDisplayMode() < 2) then
        rows = 3;
        itemName = itemName .. "\nitem\nicon";
      end

      -- Draw ammo name
      draw.DrawText(itemName, NAME_FONT, x - w * 0.66, y - (h * rows) * 0.5, Color(colour.r, colour.g, colour.b, colour.a * alpha), TEXT_ALIGN_CENTER);
    end
  end
end
