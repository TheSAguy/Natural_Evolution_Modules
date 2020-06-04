-- create worm attack variants with spash damage
local NEBuildings = require('common')('Natural_Evolution_Buildings')
local ICONPATH = NEBuildings.modRoot .. "/graphics/icons/"

--[[
-- http://stackoverflow.com/questions/640642/how-do-you-copy-a-lua-table-by-value
local function deepcopy(o, seen)
  seen = seen or {}
  if o == nil then return nil end
  if seen[o] then return seen[o] end

  local no
  if type(o) == 'table' then
    no = {}
    seen[o] = no

    for k, v in next, o, nil do
      no[deepcopy(k, seen)] = deepcopy(v, seen)
    end
    setmetatable(no, deepcopy(getmetatable(o), seen))
  else -- number, string, boolean, etc
    no = o
  end
  return no
end

local SpashDmg =
{
  type = "nested-result",
  action =
  {
    type = "area",
    radius = 2.5,
    force = "enemy",
    action_delivery =
    {
      type = "instant",
      target_effects =
	  {
          {
            type = "damage",
            damage = { amount = 10 , type = "acid"}
          },
          {
            type = "damage",
            damage = { amount = 10 , type = "explosion"}
          }
      }
    }
  }
}


local AcidProjectileSmallSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileSmallSpash.name = "acid-projectile-purple-smallSplash"
local SmallSplash = deepcopy(SpashDmg)
SmallSplash.action.radius = 2
table.insert(AcidProjectileSmallSpash.action.action_delivery.target_effects, SmallSplash)
data:extend{AcidProjectileSmallSpash}


local AcidProjectileMediumSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileMediumSpash.name = "acid-projectile-purple-mediumSplash"
local MediumSpash = deepcopy(SpashDmg)
MediumSpash.action.radius = 3
table.insert(AcidProjectileMediumSpash.action.action_delivery.target_effects, MediumSpash)
data:extend{AcidProjectileMediumSpash}

local AcidProjectileBigSpash = deepcopy(data.raw["projectile"]["acid-stream-spitter-small"])
AcidProjectileBigSpash.name = "acid-projectile-purple-bigSplash"
local BigSplash = deepcopy(SpashDmg)
BigSplash.action.radius = 3.5
table.insert(AcidProjectileBigSpash.action.action_delivery.target_effects, BigSplash)
data:extend{AcidProjectileBigSpash}
--]]

data:extend(
{

  {
    type = "item",
    name = "small-worm-hatching-exhausted",
    icon = ICONPATH .. "small-worm-corpse.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "small-worm-corpse.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "a[small-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "small-worm-hatching",
    icon = ICONPATH .. "small-worm.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "small-worm.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "a[small-worm]",
    place_result = "small-worm-turret-player",
    stack_size = 50
  },
  
  {
    type = "item",
    name = "medium-worm-hatching-exhausted",
    icon = ICONPATH .. "medium-worm-corpse.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "medium-worm-corpse.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "b[medium-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "medium-worm-hatching",
    icon = ICONPATH .. "medium-worm.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "medium-worm.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "b[medium-worm]",
    place_result = "medium-worm-turret-player",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching-exhausted",
    icon = ICONPATH .. "big-worm-corpse.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "big-worm-corpse.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "c[big-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "big-worm-hatching",
    icon = ICONPATH .. "big-worm.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "big-worm.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "c[big-worm]",
    place_result = "big-worm-turret-player",
    stack_size = 50
  },


  {
    type = "item",
    name = "behemoth-worm-hatching-exhausted",
    icon = ICONPATH .. "behemoth-worm-corpse.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "behemoth-worm-corpse.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "d[behemoth-worm]",
    stack_size = 50
  },

  {
    type = "item",
    name = "behemoth-worm-hatching",
    icon = ICONPATH .. "behemoth-worm.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "behemoth-worm.png",
        icon_size = 64,
      }
    }, 
    subgroup = "worms",
    order = "d[behemoth-worm]",
    place_result = "behemoth-worm-turret-player",
    stack_size = 50
  },

})


----- Worm Entities

 
local small_player_worm = util.table.deepcopy(data.raw["turret"]["small-worm-turret"])
small_player_worm.name = "small-worm-turret-player"
small_player_worm.flag = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"}
small_player_worm.minable = {hardness = 0.5, mining_time = 1.6, result = "small-worm-hatching-exhausted"}
small_player_worm.autoplace = nil
--small_player_worm.autoplace.peaks = {}
data:extend({small_player_worm})


 
local medium_player_worm = util.table.deepcopy(data.raw["turret"]["medium-worm-turret"])
medium_player_worm.name = "medium-worm-turret-player"
medium_player_worm.flag = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"}
medium_player_worm.minable = {hardness = 1, mining_time = 1.6, result = "medium-worm-hatching-exhausted"}
medium_player_worm.autoplace = nil
--medium_player_worm.autoplace.peaks = {}
data:extend({medium_player_worm})


 
local big_player_worm = util.table.deepcopy(data.raw["turret"]["big-worm-turret"])
big_player_worm.name = "big-worm-turret-player"
big_player_worm.flag = {"placeable-player", "not-repairable", "player-creation", "breaths-air"}
big_player_worm.minable = {hardness = 1.5, mining_time = 1.6, result = "big-worm-hatching-exhausted"}
big_player_worm.autoplace = nil
--big_player_worm.autoplace.peaks = {}
data:extend({big_player_worm})

 
local behemoth_player_worm = util.table.deepcopy(data.raw["turret"]["behemoth-worm-turret"])
behemoth_player_worm.name = "behemoth-worm-turret-player"
behemoth_player_worm.flag = {"placeable-neutral","placeable-player", "not-repairable", "player-creation", "breaths-air"}
behemoth_player_worm.minable = {hardness = 2, mining_time = 1.6, result = "behemoth-worm-hatching-exhausted"}
behemoth_player_worm.autoplace = nil
--behemoth_player_worm.autoplace.peaks = {}
data:extend({behemoth_player_worm})

