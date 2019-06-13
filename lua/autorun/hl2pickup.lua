--[[----------------
HL2 Pickup History
  Version 1.1.0
     11/06/19
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
