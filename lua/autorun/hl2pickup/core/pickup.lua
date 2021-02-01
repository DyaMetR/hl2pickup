--[[------------------------------------------------------------------
  PICKUP
  Catch picked up items/ammunition/weapons
]]--------------------------------------------------------------------

local NET = "hl2pickup";

if SERVER then

  local MAX_AMMO_CONVAR = GetConVar("gmod_maxammo");
  local FULL_WAIT = 5;

  util.AddNetworkString(NET);

  -- Item list
  HL2PICKUP.AMMO_BOXES = {};

  --[[
    Adds an ammo container to check whether a player can pick it up or not because of ammo amount
    @param {string} entity class
    @param {string} ammunition type
  ]]
  function HL2PICKUP:AddAmmoEntity(entityClass, ammoType)
    HL2PICKUP.AMMO_BOXES[entityClass] = ammoType;
  end

  --[[
    Gets an ammo container's ammo type
    @param {string} item class
    @return {string} ammunition type
  ]]
  function HL2PICKUP:GetAmmoEntity(entityClass)
    return HL2PICKUP.AMMO_BOXES[entityClass];
  end

  --[[
    Is the given entity registered?
    @param {string} entity class
    @return {boolean} is registered
  ]]
  function HL2PICKUP:HasAmmoEntity(entityClass)
    return HL2PICKUP.AMMO_BOXES[entityClass] ~= nil;
  end

  --[[
    Sends a message to a player's HUD to indicate an ammunition reserve is full
    @param {Player} player
    @param {string} ammunition type
  ]]
  function HL2PICKUP:SendFullAmmoNotice(player, ammoType)
    if player.HL2PICKUP_FULL[ammoType] and player.HL2PICKUP_FULL[ammoType] > CurTime() then return end
    net.Start(NET);
    net.WriteString(ammoType);
    net.Send(player);
    player.HL2PICKUP_FULL[ammoType] = CurTime() + FULL_WAIT;
  end

  --[[
    Initialize table for FULL ammo timers
  ]]
  hook.Add("PlayerInitialSpawn", "hl2pickup_spawn", function(player)
    player.HL2PICKUP_FULL = {};
  end)

  --[[
    Check whether a player can pickup an ammo entity
  ]]
  hook.Add("PlayerCanPickupItem", "hl2pickup_full", function( player, item )
    if (not player:Alive() or not IsValid(item)) then return; end
    local ammoType = HL2PICKUP:GetAmmoEntity(item:GetClass());
    if not HL2PICKUP:HasAmmoEntity(item:GetClass()) then return; end
    local maxAmmo = MAX_AMMO_CONVAR:GetInt();
    local ammo = player:GetAmmoCount(ammoType);
    if (maxAmmo == 0 and ammo >= game.GetAmmoMax(game.GetAmmoID(ammoType))) or (maxAmmo > 0 and ammo >= maxAmmo) then
      HL2PICKUP:SendFullAmmoNotice(player, ammoType);
    end
  end);

end

if CLIENT then

  -- Parameters
  HL2PICKUP.ItemType = {
    PICKUP_WEAPON = 1,
    PICKUP_AMMO = 2,
    PICKUP_ITEM = 3
  };

  -- Variables
  HL2PICKUP.PickupTray = {};
  local time = 0;
  local height = 0;

  --[[
    Resets the tray's height
    @void
  ]]
  function HL2PICKUP:ResetHeight()
    height = 0;
  end

  --[[
    Adds a pickup to the tray
    @param {string|Entity} item
    @param {1|2|3} identifier
    @param {varargs} additional arguments
  ]]
  function HL2PICKUP:AddPickup(item, type, ...)
    local args = {...};
    -- Add pickup
    if (type == HL2PICKUP.ItemType.PICKUP_WEAPON) then
      height = height + 1;
      HL2PICKUP.PickupTray[height] = {type = HL2PICKUP.ItemType.PICKUP_WEAPON, weapon = item, y = height, time = CurTime() + HL2PICKUP:GetDisplayTime(), alpha = 1};
    elseif (type == HL2PICKUP.ItemType.PICKUP_AMMO) then
      local time = HL2PICKUP:GetDisplayTime();
      if (args[2]) then time = 1; end
      height = height + 1;
      HL2PICKUP.PickupTray[height] = {type = HL2PICKUP.ItemType.PICKUP_AMMO, ammo = item, y = height, amount = args[1], time = CurTime() + time, alpha = 1, full = args[2]};
    elseif (type == HL2PICKUP.ItemType.PICKUP_ITEM and HL2PICKUP:GetItemIcon(item) ~= -1) then
      height = height + 1;
      HL2PICKUP.PickupTray[height] = {type = HL2PICKUP.ItemType.PICKUP_ITEM, item = item, y = height, time = CurTime() + HL2PICKUP:GetDisplayTime(), alpha = 1};
    end

    -- Reset if out of bounds
    if (height >= 5) then
      height = 0;
    end
  end

  --[[
    Weapon pickup
  ]]
  hook.Add("HUDWeaponPickedUp", "hl2pickup_weapon", function(weapon)
    if (not HL2PICKUP:IsEnabled()) then return; end
    if (HL2PICKUP:IsWeaponPickupSoundEnabled()) then surface.PlaySound("items/ammo_pickup.wav"); end
    HL2PICKUP:AddPickup(weapon, HL2PICKUP.ItemType.PICKUP_WEAPON);
    return true;
  end);

  --[[
    Ammunition pickup
  ]]
  hook.Add("HUDAmmoPickedUp", "hl2pickup_weapon", function(ammoType, amount)
    if (not HL2PICKUP:IsEnabled()) then return; end
    HL2PICKUP:AddPickup(ammoType, HL2PICKUP.ItemType.PICKUP_AMMO, amount);
    return true;
  end);

  --[[
    Item pickup
  ]]
  hook.Add("HUDItemPickedUp", "hl2pickup_item", function(item)
    if (not HL2PICKUP:IsEnabled()) then return; end
    HL2PICKUP:AddPickup(item, HL2PICKUP.ItemType.PICKUP_ITEM);
    return true;
  end);

  --[[
    Receive FULL ammo
  ]]
  net.Receive(NET, function(len)
    local ammoType = net.ReadString();
    HL2PICKUP:AddPickup(ammoType, HL2PICKUP.ItemType.PICKUP_AMMO, -1, true);
  end);

end
