--[[------------------------------------------------------------------
  PICKUP TRAY
  Display picked up items/ammunition/weapons
]]--------------------------------------------------------------------

if CLIENT then

  -- Variable
  local tick = 0;

  --[[
    Properly draws a pickup
    @param {number} x
    @param {number} y
    @param {number} table position
  ]]
  function HL2PICKUP:DrawPickup(x, y, i)
    local item = HL2PICKUP.PickupTray[i];
    if (item.type == HL2PICKUP.ItemType.PICKUP_WEAPON) then
      HL2PICKUP:DrawWeaponIcon(x - 76 * HL2PICKUP:GetScale(), y, item.weapon, item.alpha);
    elseif (item.type == HL2PICKUP.ItemType.PICKUP_AMMO) then
      HL2PICKUP:DrawAmmoPickup(x - 76 * HL2PICKUP:GetScale(), y - HL2PICKUP:GetAmmoIconHeight(item.ammo), item.ammo, item.amount, item.alpha, item.full);
    elseif (item.type == HL2PICKUP.ItemType.PICKUP_ITEM) then
      HL2PICKUP:DrawItemIcon(x - 76 * HL2PICKUP:GetScale(), y, item.item, item.alpha);
    end
  end

  --[[
    Draws the current pickup history
    @param {number} x
    @param {number} y
  ]]
  function HL2PICKUP:DrawPickupTray(x, y)
    for i, pickup in pairs(HL2PICKUP.PickupTray) do
      HL2PICKUP:DrawPickup(x, y - (89 * HL2PICKUP:GetScale() * (pickup.y - 1)), i);
    end
  end

  --[[
    Animates the tray
    @void
  ]]
  local function Animate()
    if (tick < CurTime()) then
      for i, pickup in pairs(HL2PICKUP.PickupTray) do
        if (pickup.time < CurTime()) then
          if (pickup.alpha > 0) then
            HL2PICKUP.PickupTray[i].alpha = math.max(pickup.alpha - 0.01, 0);
          else
            table.remove(HL2PICKUP.PickupTray, i);

            -- Reset height if there are no more pickups showing
            if (table.Count(HL2PICKUP.PickupTray) <= 0) then
              HL2PICKUP:ResetHeight();
            end
          end
        end
      end
      tick = CurTime() + 0.01;
    end
  end

  --[[
    Animate and draw the tray
  ]]
  hook.Add("HUDPaint", "hl2pickup_draw", function()
    if (not HL2PICKUP:IsEnabled()) then return; end
    Animate();
    if (not LocalPlayer():IsSuitEquipped()) then return; end
    HL2PICKUP:DrawPickupTray(ScrW(), ScrH() - (171 * HL2PICKUP:GetScale()));
  end);

  --[[
    Hide Health and Battery item pickups
  ]]
  hook.Add("HUDShouldDraw", "hl2pickup_hide", function(element)
    if (element == "CHudHistoryResource") then return false; end
  end);

end
