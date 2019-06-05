# Half-Life 2 Pickup History
This addon for Garry's Mod attempts to replicate the Pickup History feature from Valve's 2004 game 'Half-Life 2'. 

## Features
+   Iconic pickup history
+   Customization

## Customization includes
+   Recolouring
+   Switch between 3 display modes for ammunition and item icons

## Utilizing the API
You can add custom icons for your items, ammunition types and/or weapons.

`HL2PICKUP:AddAmmoIcon(ammoType, char, font, x, y)`
> Adds a font based ammo icon
>
> **@param** {*string*} ammunition type
>
> **@param** {*string*} character
>
> **@param** {*string*} font
>
> **@param** {*number|nil*} x
>
> **@param** {*number|nil*} y

`HL2PICKUP:AddAmmoImage(ammoType, texture, w, h, coloured)`
> Adds either a .png or a .vtf image as an icon
> 
> **@param** {*string*} ammunition type
> 
> **@param** {*IMaterial|number*} texture
> 
> **@param** {number} w
> 
> **@param** {number} h
> 
> **@param** {boolean|nil} coloured

`HL2PICKUP:AddAmmoImageUV(ammoType, texture, w, h, u1, v1, u2, v2, fileW, fileH, coloured)`
> Adds either a .png or a .vtf image as an icon
>
> **@param** {*string*} ammunition type
>
> **@param** {*IMaterial|number*} texture
>
> **@param** {*number*} w
>
> **@param** {*number*} h
>
> **@param** {*number|nil*} u1
>
> **@param** {*number|nil*} v1
>
> **@param** {*number|nil*} u2
>
> **@param** {*number|nil*} v2
>
> **@param** {*number|nil*} file width
>
> **@param** {*number|nil*} file height
>
> **@param** {*boolean|nil*} coloured

`HL2PICKUP:AddItemIcon(itemClass, char, font, x, y)`
> Adds a font based item icon
>
> **@param** {*string*} item class
>
> **@param** {*string*} character
>
> **@param** {*string*} font
>
> **@param** {*number|nil*} x
>
> **@param** {*number|nil*} y

`HL2PICKUP:AddItemImage(itemClass, texture, w, h, coloured)`
> Adds either a .png or a .vtf image as an icon
>
> **@param** {*string*} item class
>
> **@param** {*IMaterial|number*} texture
>
> **@param** {*number*} w
>
> **@param** {*number*} h
>
> **@param** {*boolean|nil*} coloured

`HL2PICKUP:AddItemImageUV(itemClass, texture, w, h, u1, v1, u2, v2, fileW, fileH, coloured)`
> Adds either a .png or a .vtf image as an icon
>
> **@param** {*string*} item class
>
> **@param** {*IMaterial|number*} texture
>
> **@param** {*number*} w
>
> **@param** {*number*} h
>
> **@param** {*number|nil*} u1
>
> **@param** {*number|nil*} v1
>
> **@param** {*number|nil*} u2
>
> **@param** {*number|nil*} v2
>
> **@param** {*number|nil*} file width
>
> **@param** {*number|nil*} file height
>
> **@param** {*boolean|nil*} coloured

`HL2PICKUP:AddItemOverride(itemClass)`
> Avoids the system to add an item to the tray
>
> **@param** {*string*} item class

`HL2PICKUP:AddWeaponIcon(weaponClass, char, font, x, y)`
> Adds a font based weapon icon
>
> **@param** {*string*} weapon class
>
> **@param** {*string*} character
>
> **@param** {*string*} font
>
> **@param** {*number|nil*} x
>
> **@param** {*number|nil*} y

`HL2PICKUP:AddWeaponImage(weaponClass, texture, w, h, coloured)`
> Adds either a .png or a .vtf image as an icon
>
> **@param** {*string*} weapon class
>
> **@param** {*IMaterial|number*} texture
>
> **@param** {*number*} w
>
> **@param** {*number*} h
>
> **@param** {*boolean|nil*} coloured

`HL2PICKUP:AddWeaponImageUV(weaponClass, texture, w, h, u1, v1, u2, v2, fileW, fileH, coloured)`
> Adds either a .png or a .vtf image as an icon
>
> **@param** {*string*} weapon class
>
> **@param** {*IMaterial|number*} texture
>
> **@param** {*number*} w
>
> **@param** {*number*} h
>
> **@param** {*number|nil*} u1
>
> **@param** {*number|nil*} v1
>
> **@param** {*number|nil*} u2
>
> **@param** {*number|nil*} v2
>
> **@param** {*number|nil*} file width
>
> **@param** {*number|nil*} file height
>
> **@param** {*boolean|nil*} coloured

