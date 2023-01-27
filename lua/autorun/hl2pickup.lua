--[[----------------
HL2 Pickup History
  Version 1.2.3
     27/01/23
By DyaMetR
]]------------------

-- Main framework table
HL2PICKUP = {};

--[[
  METHODS
]]

--[[
  Correctly includes a file
  @param {string} file
  @void
]]--
function HL2PICKUP:IncludeFile(file)
  if SERVER then
    include(file);
    AddCSLuaFile(file);
  end
  if CLIENT then
    include(file);
  end
end

--[[
  INCLUDES
]]
HL2PICKUP:IncludeFile("hl2pickup/core.lua");
