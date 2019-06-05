--[[------------------------------------------------------------------
  CORE
  Build up icon containers and load data to draw HUD
]]--------------------------------------------------------------------

if CLIENT then
  --[[
    Returns the HUD scale
    @return {number} scale
  ]]
  function HL2PICKUP:GetScale()
    return ScrH() / 768;
  end
end

-- Include configuration
HL2PICKUP:IncludeFile("config/config.lua");

-- Include containers
HL2PICKUP:IncludeFile("icons/ammo.lua");
HL2PICKUP:IncludeFile("icons/items.lua");
HL2PICKUP:IncludeFile("icons/weapons.lua");

-- Include drawing functions
HL2PICKUP:IncludeFile("core/pickup.lua");
HL2PICKUP:IncludeFile("core/draw.lua");

-- Include data
HL2PICKUP:IncludeFile("data/ammo.lua");
HL2PICKUP:IncludeFile("data/items.lua");

-- Load add-ons
local files, directories = file.Find("autorun/hl2pickup/add-ons/*.lua", "LUA");
for _, file in pairs(files) do
  HL2PICKUP:IncludeFile("add-ons/"..file);
end
