data:extend(
{

  {
    type = "bool-setting",
    name = "NE_Battle_Marker",
    setting_type = "startup",
    default_value = true,
	order = "a[modifier]-a[Battle_Marker]",
    per_user = false,
  },

   {
    type = "int-setting",
    name = "NE_Conversion_Search_Distance",
    setting_type = "startup",
    default_value = 35,
    maximum_value = 60,
    minimum_value = 20,
	order = "b[modifier]-b[Conversion_Search_Distance]",
    per_user = false,
  },
  
  
  {
    type = "int-setting",
    name = "NE_Conversion_Difficulty",
    setting_type = "startup",
    default_value = 3,
    maximum_value = 3,
    minimum_value = 1,
	order = "c[modifier]-c[Conversion_Search_Distance]",
    per_user = false,
  },
  
  
  
  {
    type = "int-setting",
    name = "NE_Bio_Ammo_Damage",
    setting_type = "startup",
    default_value = 15,
    maximum_value = 50,
    minimum_value = 5,
	order = "d[modifier]-d[Bio_Ammo_Damage]",
    per_user = false,
  },

  {
    type = "int-setting",
    name = "NE_Artifact_Collector_Radius",
    setting_type = "startup",
    default_value = 40,
    maximum_value = 100,
    minimum_value = 15,
	order = "e[modifier]-e[Artifact_Collector_Radius]",
    per_user = false,
  },
  
}
)



--[[
Types of settings:
	• startup - game must be restarted if changed (such a setting may affect prototypes' changes)
	• runtime-global - per-world setting
	• runtime-per-user - per-user setting

Types of values:
	• bool-setting
	• double-setting
	• int-setting
	• string-setting

Files being processed by the game:
	• settings.lua
	• settings-updates.lua
	• settings-final-fixes.lua
	
Using in DATA.lua:
data:extend({
   {
      type = "int-setting",
      name = "setting-name1",
      setting_type = "runtime-per-user",
      default_value = 25,
      minimum_value = -20,
      maximum_value = 100,
      per_user = true,
   },
   {
      type = "bool-setting",
      name = "setting-name2",
      setting_type = "runtime-per-user",
      default_value = true,
      per_user = true,
   },
   {
      type = "double-setting",
      name = "setting-name3",
      setting_type = "runtime-per-user",
      default_value = -23,
      per_user = true,
   },
   {
      type = "string-setting",
      name = "setting-name4",
      setting_type = "runtime-per-user",
      default_value = "Hello",
      allowed_values = {"Hello", "foo", "bar"},
      per_user = true,
   },
})

Using in LOCALE.cfg:
	[mod-setting-name]
	setting-name1=Seting name
	[mod-setting-description]
	setting-name1=Seting description

Using in CONTROL.lua and in other code for reading:
	EVENT: on_runtime_mod_setting_changed - called when a player changed its setting
		event.player_index
		event.setting
	GET: settings.startup["setting-name"].value - current value of startup setting; can be used in DATA.lua
	GET: settings.global["setting-name"].value - current value of per-world setting
	GET: set = settings.get_player_settings(LuaPlayer) - current values for per-player settings; then use set["setting-name"].value
	GET: settings.player - default values
]]