--[[------------------------------------------------------------------
  AMMUNITION ICONS
  Default Half-Life 2 icons
]]--------------------------------------------------------------------

if CLIENT then

  local HL2_FONT = "hl2pickup_ammo";

  -- Default Half-Life 2 ammunition types
  HL2PICKUP:AddAmmoIcon("Pistol", "p", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("357", "q", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("SMG1", "r", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("SMG1_Grenade", "t", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("AR2", "u", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("AR2AltFire", "z", HL2_FONT, nil, 2);
  HL2PICKUP:AddAmmoIcon("Buckshot", "s", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("XBowBolt", "w", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("Grenade", "v", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("RPG_Round", "x", HL2_FONT);
  HL2PICKUP:AddAmmoIcon("slam", "*", HL2_FONT, nil, 12);

end

if SERVER then

  -- Half-Life 2 ammunition entities
  HL2PICKUP:AddAmmoEntity("item_ammo_pistol", "Pistol");
  HL2PICKUP:AddAmmoEntity("item_ammo_pistol_large", "Pistol");
  HL2PICKUP:AddAmmoEntity("item_ammo_357", "357");
  HL2PICKUP:AddAmmoEntity("item_ammo_357_large", "357");
  HL2PICKUP:AddAmmoEntity("item_ammo_smg1", "SMG1");
  HL2PICKUP:AddAmmoEntity("item_ammo_smg1_large", "SMG1");
  HL2PICKUP:AddAmmoEntity("item_ammo_smg1_grenade", "SMG1_Grenade");
  HL2PICKUP:AddAmmoEntity("item_ammo_ar2", "AR2");
  HL2PICKUP:AddAmmoEntity("item_ammo_ar2_large", "AR2");
  HL2PICKUP:AddAmmoEntity("item_ammo_ar2_altfire", "AR2AltFire");
  HL2PICKUP:AddAmmoEntity("item_ammo_crossbow", "XBowBolt");
  HL2PICKUP:AddAmmoEntity("item_ammo_box_buckshot", "Buckshot");
  HL2PICKUP:AddAmmoEntity("item_ammo_rpg_round", "RPG_Round");

end
