--[[------------------------------------------------------------------
  WEAPON ICONS
  Default Half-Life 2 weapons + MMOD
]]--------------------------------------------------------------------

if CLIENT then

  local HL2_FONT = "hl2pickup_weapon";
  local RB_FONT = "holohud_weapon_icon_rb";

  -- Half-Life 2 weapons
  HL2PICKUP:AddWeaponIcon("weapon_physgun", "h", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_physcannon", "m", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_crowbar", "c", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_stunstick", "n", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_pistol", "d", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_357", "e", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_smg1", "a", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_ar2", "l", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_shotgun", "b", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_crossbow", "g", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_frag", "k", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_rpg", "i", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_slam", "o", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_bugbait", "j", HL2_FONT);

  HL2PICKUP:AddWeaponIcon("weapon_annabelle", "b", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_alyxgun", "c", RB_FONT);

  -- Half-Life 2 items
  HL2PICKUP:AddItemIcon("item_healthkit", "+", HL2_FONT, nil, -17);
  HL2PICKUP:AddItemIcon("item_battery", "*", HL2_FONT, nil, -17);
  HL2PICKUP:AddItemOverride("item_healthvial");

  -- HL2 REDUX TFA weapons
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_crowbar", "c", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_pistol", "d", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_smg", "a", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_ar2", "l", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_shotgun", "b", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2r_frag", "k", HL2_FONT);

  --MMOD TFA Weapons
  HL2PICKUP:AddWeaponIcon("tfa_mmod_crowbar", "c", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_pistol", "d", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_smg", "a", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_ar2", "l", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_shotgun", "b", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_shotgun_auto", "b", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_357", "e", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_stunstick", "n", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_grenade", "k", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_rpg", "i", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_crossbow", "f", RB_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_ar3", "i", RB_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_mmod_bugbait", "j", HL2_FONT);

  --MISC Weapons
  HL2PICKUP:AddWeaponIcon("weapon_portalgun", "m", RB_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2b_sniperrifle", "o", RB_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2b_ar2", "f", HL2_FONT);
  HL2PICKUP:AddWeaponIcon("tfa_hl2b_smg1", "p", RB_FONT);
  HL2PICKUP:AddWeaponIcon("weapon_medkit", "e", RB_FONT);

end
