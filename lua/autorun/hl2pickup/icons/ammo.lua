--[[------------------------------------------------------------------
  AMMUNITION ICONS
  Draw ammunition pickups
]]--------------------------------------------------------------------

if CLIENT then

  -- Parameters
  local DEFAULT_FONT = "hl2pickup_ammo";
  local DEFAULT_SECONDARY_FONT = "hl2pickup_ammo2";
  local NUMBER_FONT = "hl2pickup_amount";
  local FULL_FONT = "hl2pickup_full";
  local NAME_FONT = "hl2pickup_name";
  local INVALID_CHAR = "�";

  -- Default fonts
  surface.CreateFont(NUMBER_FONT, {
    font = "HalfLife2",
    size = 28 * HL2PICKUP:GetScale(),
    weight = 1000,
    antialias = true,
    additive = true
  });

  surface.CreateFont(DEFAULT_FONT, {
    font = "HalfLife2",
    size = 52 * HL2PICKUP:GetScale(),
    weight = 0,
    antialias = true,
    additive = true
  });

  surface.CreateFont(DEFAULT_SECONDARY_FONT, {
    font = "HL2MP",
    size = 52 * HL2PICKUP:GetScale(),
    weight = 0,
    antialias = true,
    additive = true
  });

  surface.CreateFont(NAME_FONT, {
    font = "Arial Black",
    size = 20 * HL2PICKUP:GetScale(),
    weight = 0,
    antialias = true,
    additive = true
  });

  -- Ammo icons list
  HL2PICKUP.AmmoIcons = {};

  --[[
    Adds a font based ammo icon
    @param {string} ammunition type
    @param {string} character
    @param {string} font
    @param {number|nil} x
    @param {number|nil} y
  ]]
  function HL2PICKUP:AddAmmoIcon(ammoType, char, font, x, y)
    HL2PICKUP.AmmoIcons[ammoType] = {char = char, font = font, x = x or 0, y = y or 0};
  end

  --[[
    Adds either a .png or a .vtf image as an icon
    @param {string} ammunition type
    @param {IMaterial|number} texture
    @param {number} w
    @param {number} h
    @param {boolean|nil} coloured
  ]]
  function HL2PICKUP:AddAmmoImage(ammoType, texture, w, h, coloured)
    HL2PICKUP.AmmoIcons[ammoType] = {texture = texture, w = w, h = h, coloured = coloured or false};
  end

  --[[
    Adds either a .png or a .vtf image as an icon
    @param {string} ammunition type
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
  function HL2PICKUP:AddAmmoImageUV(ammoType, texture, w, h, u1, v1, u2, v2, fileW, fileH, coloured)
    HL2PICKUP.AmmoIcons[ammoType] = {texture = texture, w = w, h = h, u1 = u1 or 0, v1 = v1 or 0, u2 = u2 or 1, v2 = v2 or 1, fileW = fileW or w, fileH = fileH or h, coloured = coloured or false};
  end

  --[[
    Returns whether the given ammunition type has an icon
    @param {string} ammunition type
    @return {boolean} exists
  ]]
  function HL2PICKUP:HasAmmoIcon(ammoType)
    return HL2PICKUP.AmmoIcons[ammoType] ~= nil;
  end

  --[[
    Gets an ammo icon's data
    @param {string} ammunition type
    @return {table} icon data
  ]]
  function HL2PICKUP:GetAmmoIcon(ammoType)
    if (not HL2PICKUP:HasAmmoIcon(ammoType)) then return {char = INVALID_CHAR, font = DEFAULT_FONT, x = 0, y = 0}; end
    return HL2PICKUP.AmmoIcons[ammoType];
  end

  --[[
    Returns the height of an ammunition type icon
    @param {string} ammunition type
    @return {number} height
  ]]
  function HL2PICKUP:GetAmmoIconHeight(ammoType)
    local data = HL2PICKUP:GetAmmoIcon(ammoType);
    if (data.texture ~= nil) then
      return data.h * HL2PICKUP:GetScale();
    else
      surface.SetFont(data.font);
      local w, h = surface.GetTextSize(data.char);
      return h;
    end
    return 0;
  end

  --[[
    Draws an ammunition icon
    @param {number} x
    @param {number} y
    @param {string} ammunition type
    @param {number|nil} alpha
    @param {number|nil} colour
    @param {number|nil} horizontal alignment
    @param {number|nil} vertical alignment
  ]]
  function HL2PICKUP:DrawAmmoIcon(x, y, ammoType, alpha, colour, horAlign, verAlign)
    alpha = alpha or 1;
    horAlign = horAlign or TEXT_ALIGN_RIGHT;
    verAlign = verAlign or TEXT_ALIGN_CENTER;
    colour = colour or HL2PICKUP:GetColour();

    if (HL2PICKUP:HasAmmoIcon(ammoType) or (not HL2PICKUP:HasAmmoIcon(ammoType) and HL2PICKUP:GetAmmoDisplayMode() == 1)) then
      local data = HL2PICKUP:GetAmmoIcon(ammoType);
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
      local ammoName = string.lower(ammoType);
      string.Replace(ammoName, "_", " ");
      string.Replace(ammoName, "ammo", "");

      surface.SetFont(NAME_FONT);
      local w, h = surface.GetTextSize(ammoName);

      -- Add 'ammo icon' like in 'gauss ammo icon'
      local rows = 1;
      if (HL2PICKUP:GetAmmoDisplayMode() < 2) then
        rows = 3;
        ammoName = ammoName .. "\nammo\nicon";
      end

      -- Draw ammo name
      draw.DrawText(ammoName, NAME_FONT, x - w * 0.66, y - ((h * rows) * 0.5), Color(colour.r, colour.g, colour.b, colour.a * alpha), TEXT_ALIGN_CENTER);
    end
  end

  --[[
    Draws an ammo pickup
    @param {number} x
    @param {number} y
    @param {string} ammunition type
    @param {number} amount
    @param {number|nil} alpha
    @param {boolean|nil} is ammo reserve full
  ]]
  function HL2PICKUP:DrawAmmoPickup(x, y, ammoType, amount, alpha, isFull)
    alpha = alpha or 1;
    local h = HL2PICKUP:GetAmmoIconHeight(ammoType);

    if (isFull) then
      local colour = HL2PICKUP:GetCritColour();
      HL2PICKUP:DrawAmmoIcon(x, y, ammoType, alpha, colour);
      draw.SimpleText("FULL", "HudHintTextLarge", x + 8, y - HL2PICKUP:GetScale(), Color(colour.r, colour.g, colour.b, colour.a * alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER);
    else
      local colour = HL2PICKUP:GetColour();
      HL2PICKUP:DrawAmmoIcon(x, y, ammoType, alpha);
      draw.SimpleText(amount, NUMBER_FONT, x + 8, y - HL2PICKUP:GetScale(), Color(colour.r, colour.g, colour.b, colour.a * alpha), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER);
    end
  end

end
