--[[------------------------------------------------------------------
  CONFIGURATION
  Manages serverside and clientside configuration
]]--------------------------------------------------------------------

-- Include menu
HL2PICKUP:IncludeFile("menu.lua");

if CLIENT then

  -- Default configuration
  local DEFAULT_CONFIG = {
    ["hl2pickup_enabled"] = 1,
    ["hl2pickup_weapon_sound"] = 1,
    ["hl2pickup_ep2_enabled"] = 0,
    ["hl2pickup_ammo_mode"] = 0,
    ["hl2pickup_item_mode"] = 0,
    ["hl2pickup_time"] = 5,
    ["hl2pickup_colour_r"] = 236,
    ["hl2pickup_colour_g"] = 193,
    ["hl2pickup_colour_b"] = 56,
    ["hl2pickup_colour_crit_r"] = 200,
    ["hl2pickup_colour_crit_g"] = 30,
    ["hl2pickup_colour_crit_b"] = 10
  };

  -- Initialize ConVars
  for convar, config in pairs(DEFAULT_CONFIG) do
    CreateClientConVar(convar, config);
  end

  --[[
    Returns whether the addon is enabled
    @return {boolean} enabled
  ]]
  function HL2PICKUP:IsEnabled()
    return GetConVar("hl2pickup_enabled"):GetInt() > 0;
  end

  --[[
    Returns whether the episode 2 mode is enabled
    @return {boolean} enabled
  ]]
  function HL2PICKUP:IsEP2ModeEnabled()
    return GetConVar("hl2pickup_ep2_enabled"):GetInt() > 0;
  end

  --[[
    Returns whether the weapon pickup sound is enabled
    @return {boolean} enabled
  ]]
  function HL2PICKUP:IsWeaponPickupSoundEnabled()
    return GetConVar("hl2pickup_weapon_sound"):GetInt() > 0;
  end

  --[[
    Returns whether it should display the name of ammo types that have no icons
    @return {boolean} should show name
  ]]
  function HL2PICKUP:GetAmmoDisplayMode()
    return GetConVar("hl2pickup_ammo_mode"):GetInt();
  end

  --[[
    Returns whether it should display the name of items that have no icons
    @return {boolean} should show name
  ]]
  function HL2PICKUP:GetItemDisplayMode()
    return GetConVar("hl2pickup_item_mode"):GetInt();
  end

  --[[
    Returns how many seconds should each pickup display
    @return {number} time
  ]]
  function HL2PICKUP:GetDisplayTime()
    return GetConVar("hl2pickup_time"):GetFloat();
  end

  --[[
    Returns the main colour
    @return {Color} colour
  ]]
  function HL2PICKUP:GetColour()
    return Color(GetConVar("hl2pickup_colour_r"):GetInt(), GetConVar("hl2pickup_colour_g"):GetInt(), GetConVar("hl2pickup_colour_b"):GetInt());
  end

  --[[
    Returns the critical colour
    @return {Color} colour
  ]]
  function HL2PICKUP:GetCritColour()
    return Color(GetConVar("hl2pickup_colour_crit_r"):GetInt(), GetConVar("hl2pickup_colour_crit_g"):GetInt(), GetConVar("hl2pickup_colour_crit_b"):GetInt());
  end

  --[[
    Reset
  ]]
  concommand.Add("hl2pickup_reset", function(ply, com, args)
    for convar, config in pairs(DEFAULT_CONFIG) do
      RunConsoleCommand(convar, config);
    end
  end);

end
