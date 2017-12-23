--- Combat Inserter
Combat_Inserter_tint = {r=0, g=0, b=0, a=1}

data:extend({

  {
    type = "inserter",
    name = "combat-inserter",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/combat_inserter.png",
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable =
    {
      hardness = 0.2,
      mining_time = 0.8,
      result = "combat-inserter"
    },
    max_health = 1500,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 95
      },
	  {
        type = "acid",
        percent = 95
      },
	  {
        type = "poison",
        percent = 95
      },
	  	  {
        type = "explosion",
        percent = 95
      },
	  	  {
        type = "physical",
        percent = 50
      },
	  
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = 7000,
    energy_per_rotation = 7000,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    extension_speed = 0.14,
    rotation_speed = 0.08,
    fast_replaceable_group = "inserter",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      match_progress_to_activity = true,
      sound =
      {
        {
          filename = "__base__/sound/inserter-fast-1.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-2.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-3.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-4.ogg",
          volume = 0.75
        },
        {
          filename = "__base__/sound/inserter-fast-5.ogg",
          volume = 0.75
        }
      }
    },
    hand_base_picture =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/combat-inserter/inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 34,
	  --tint = Combat_Inserter_tint
    },
    hand_closed_picture =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/combat-inserter/inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  --tint = Combat_Inserter_tint
    },
    hand_open_picture =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entities/combat-inserter/inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
	  --tint = Combat_Inserter_tint
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 34
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__Natural_Evolution_Buildings__/graphics/entities/combat-inserter/inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
		--tint = Combat_Inserter_tint,
        shift = {0.09375, 0}
      }
    },
    circuit_wire_connection_point = inserter_circuit_wire_connection_point,
    circuit_connector_sprites = inserter_circuit_connector_sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance
  },
})