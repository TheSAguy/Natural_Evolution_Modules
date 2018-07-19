

---- Biter Attack Function - Normal Biter
function Biter_Melee_Attack_Healthy(damagevalue)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue , type = "physical"}
        },
      }
    }
  }
end


---- Biter Attack Function - Infected Biter (Poison / Physical)
function Biter_Melee_Attack_Infected(damagevalue, damagevalue2)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue2 , type = "physical"}
        },
		{
          type = "damage",
          damage = { amount = damagevalue , type = "poison"}
        },
      }
    }
  }
end


---- Biter Attack Function - Mutated Biter (Acid / Physical)
function Biter_Melee_Attack_Mutated(damagevalue, damagevalue2)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue2 , type = "physical"}
        },
		{
          type = "damage",
          damage = { amount = damagevalue , type = "acid"}
        },
      }
    }
  }
end


---- Spitter Attack Functions - Infected Spitter
function Spitter_Attack_Infected(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Infected-Projectile",
          starting_speed = 1
        }
      }
    },
    sound = make_spitter_roars(0.75),
    animation = spitterattackanimation(data.scale, data.tint),
  }
end

---- Spitter Attack Functions - Mutated Spitter
function Spitter_Attack_Mutated(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Mutated-Projectile",
          starting_speed = 1.5
        }
      }
    },
    sound = make_spitter_roars(0.75),
    animation = spitterattackanimation(data.scale, data.tint),
  }
end

