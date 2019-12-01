--[[------------------------------------------------------------------
  CONFIGURATION MENU
  Edit addon configuration
]]--------------------------------------------------------------------

if CLIENT then

  --[[
    Compose the options menu
  ]]
  local function menuComposition( panel )
  	panel:ClearControls();

    panel:AddControl( "CheckBox", {
      Label = "Enabled",
      Command = "hl2pickup_enabled",
      }
    );

    panel:AddControl( "CheckBox", {
      Label = "EP2 mode enabled",
      Command = "hl2pickup_ep2_enabled",
      }
    );

    local combobox, label = panel:ComboBox("Ammunition icon style", "hl2pickup_ammo_mode");
    combobox:AddChoice("Default", 0);
    combobox:AddChoice("Icons only", 1);
    combobox:AddChoice("Short names for missing types", 2);

    local combobox, label = panel:ComboBox("Item icon style", "hl2pickup_item_mode");
    combobox:AddChoice("Default", 0);
    combobox:AddChoice("Icons only", 1);
    combobox:AddChoice("Short names for missing items", 2);

    panel:AddControl( "TextBox", {
      Label = "Display time (in seconds)",
      Command = "hl2pickup_time"
    });

    panel:AddControl( "CheckBox", {
      Label = "Weapon pickup sound",
      Command = "hl2pickup_weapon_sound",
      }
    );

    panel:AddControl( "Color", {
      Label = "Colour",
      Red = "hl2pickup_colour_r",
      Green = "hl2pickup_colour_g",
      Blue = "hl2pickup_colour_b"
      }
    );

    panel:AddControl( "Color", {
      Label = "Weapon missing/ammo full colour",
      Red = "hl2pickup_colour_crit_r",
      Green = "hl2pickup_colour_crit_g",
      Blue = "hl2pickup_colour_crit_b"
      }
    );

    panel:AddControl( "Button", {
  		Label = "Reset settings to default",
  		Command = "hl2pickup_reset",
  		}
    );
  end

  hook.Add( "PopulateToolMenu", "hl2pickup_menu_cl", function()
    spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "cl_hl2pickup", "HL2 Pickup History", "", "", menuComposition );
  end);

end
