local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

mobs:register_mob("mobs_plus:zombie", {
	--nametag = "Zombie",
	type = "monster", -- animal / monster / npc
	hp_min = 12,
	hp_max = 35,
	armor = 100,
	passive = false,
	walk_velocity = 1,
	run_velocity = 1.5,
	walk_chance = 100,
	--jump = false,
	jump_height = 0,
	stepheight = 1.1,
	--fly = false,
	--fly_in = "default:water_source",
	--runaway = true,
	view_range = 7,
	reach = 2,
	damage = 3,
	knock_back = 1,
	fear_height = 0,
	fall_speed = -10,
	fall_damage = true,
	water_damage = 0,
	lava_damage = 1,
	light_damage = 1,
	suffocation = false,
	floats = 0,
	--follow = "farming:wheat",
	docile_by_day = false,
	attacks_monsters = true,
	attack_animals = true,
	--owner_loyal = true,
	--group_attack = true,
	attack_type = "dogfight", -- dogfight / shoot / dogshoot / explode
	--explosion_radius = 1,
	--explosion_timer = 2,
	--arrow = {},
	pathfinding = true, -- true or 1 pathfinding ok / 2 also build-break
	--immune_to = {"default:sword_wood",0},
	makes_footstep_sound = true,
	sounds = {
		distance = 10,
		random = "mobs_plus_zombie",
		--war_cry = "", -- starts to attack
		attack = "mobs_plus_zombie", -- when player attacked
		--shoot_attack = "", -- when mob shoots
		damage = "mobs_plus_zombie_hit", -- when mob is hurt
		death = "mobs_plus_zombie_death",
		--jump = "", -- when mob jumps
		--explode = "", when mob explodes
	},
	drops = {
		{name = "mobs_plus:rotten_flesh", chance = 2, min = 3, max = 5,},
	},
	visual = "mesh", -- cube / sprite / upright_sprite / wielditem / mesh
	visual_size = {x=1, y=1},
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.85, 0.4},
	--selectionbox = {},
	textures = {
		{"mobs_plus_zombie.png"},
	},
	--child_texture = {}, -- textures for baby mobs
	--gotten_texture = {}, -- textures when gotten is true (ex : miling cows or shearing sheep)
	mesh = "mobs_plus_zombie.b3d",
	--gotten_mesh = "", -- when gottin is true
	rotate = 0,
	double_melee_attack = false,
	animation = { -- add *_loop = false to stop looping animation
		speed_normal = 12,		speed_run = 12,
		stand_start = 81,		stand_end = 150,		stand_speed = 69,
		walk_start = 1,		walk_end = 80,		walk_speed = 79,
		run_start = 102,		run_end = 122,		run_speed = 15,
		--fly_start = 0,		fly_end = 0,		fly_speed = 15,
		punch_start = 102,		punch_end = 122,	punch_speed = 15,
		--punch2_start = 0,		punch2_end = 0,		punch2_speed = 15,
		--shoot_start = 0,		shoot_end = 0,		shoot_speed = 15,
		die_start = 151,			die_end = 175,		die_speed = 24,		die_loop = false,
	},
	do_punch = mobs_plus.blink
})

mobs:spawn({
	name = "mobs_plus:zombie",
	nodes = {"default:stone", "default:dirt_with_grass"},
	max_light = 7,
	chance = 10000,
})

mobs:register_egg("mobs_plus:zombie", S("Zombie"), "mobs_plus_egg_zombie.png", 0)

minetest.register_craftitem("mobs_plus:rotten_flesh", {
	description = S("Rotten Flesh"),
	inventory_image = "mobs_plus_rotten_flesh.png",
	on_use = minetest.item_eat(1),
})
