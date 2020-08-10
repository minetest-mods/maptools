--[[
Map Tools: unbreakable default nodes

Copyright © 2012-2020 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

local S = maptools.S

local function shallowCopy(original)
	local copy = {}
	for key, value in pairs(original) do
		copy[key] = value
	end
	return copy
end

maptools.creative = maptools.config["hide_from_creative_inventory"]

function maptools.register_unbreakable_node(name)
	local src_def = minetest.registered_nodes[name]
	if not(src_def) then
		minetest.log("[maptools] Can't register unbreakable node "..name.."_u : source is nil!")
		return false
	end
	local dst_def = shallowCopy(src_def)
	dst_def.description = "Unbreakable "..src_def.description
	dst_def.range = 12
	dst_def.stack_max = 10000
	dst_def.drop = ""
	dst_def.groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative}
	dst_def.on_drop = maptools.drop_msg
	minetest.register_node(":"..name.."_u", dst_def)
	return true
end

maptools.register_unbreakable_node("default:stone")
maptools.register_unbreakable_node("default:stonebrick")
maptools.register_unbreakable_node("default:tree")
maptools.register_unbreakable_node("default:jungletree")
maptools.register_unbreakable_node("default:cactus")
maptools.register_unbreakable_node("default:papyrus")
maptools.register_unbreakable_node("default:dirt")
maptools.register_unbreakable_node("default:wood")
maptools.register_unbreakable_node("default:junglewood")
maptools.register_unbreakable_node("default:glass")
maptools.register_unbreakable_node("default:leaves")
maptools.register_unbreakable_node("default:sand")
maptools.register_unbreakable_node("default:clay")
maptools.register_unbreakable_node("default:desert_sand")
maptools.register_unbreakable_node("default:sandstone")
maptools.register_unbreakable_node("default:sandstonebrick")
maptools.register_unbreakable_node("default:desert_stone")
maptools.register_unbreakable_node("default:desert_cobble")
maptools.register_unbreakable_node("default:desert_stonebrick")
maptools.register_unbreakable_node("default:grass")
maptools.register_unbreakable_node("default:cobble")
maptools.register_unbreakable_node("default:mossycobble")
maptools.register_unbreakable_node("default:brick")
maptools.register_unbreakable_node("default:coalblock")
maptools.register_unbreakable_node("default:steelblock")
maptools.register_unbreakable_node("default:goldblock")
maptools.register_unbreakable_node("default:copperblock")
maptools.register_unbreakable_node("default:bronzeblock")
maptools.register_unbreakable_node("default:diamondblock")
maptools.register_unbreakable_node("default:ladder_steel")
maptools.register_unbreakable_node("default:ladder_wood")


-- Farming:

maptools.register_unbreakable_node("farming:soil_wet")
maptools.register_unbreakable_node("farming:desert_sand_soil_wet")
dirt_new = shallowCopy(minetest.registered_nodes["default:dirt_u"])
dirt_new.soil = nil
minetest.register_node(":default:dirt_u",dirt_new)
soil_new = shallowCopy(minetest.registered_nodes["farming:soil_wet_u"])
soil_new.soil = nil
minetest.register_node(":farming:soil_wet_u",soil_new)
dirt_sand_new = shallowCopy(minetest.registered_nodes["farming:desert_sand_soil_wet_u"])
dirt_sand_new.soil = nil
minetest.register_node(":farming:desert_sand_soil_wet_u",dirt_sand_new)



minetest.register_node("maptools:fullgrass", {
	description = S("Unbreakable Full Grass"),
	range = 12,
	stack_max = 10000,
	tiles = {"default_grass.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
	on_drop = maptools.drop_msg
})

for slab_num = 1,3,1 do
	minetest.register_node("maptools:slab_grass_" .. slab_num * 4, {
		description = S("Grass Slab"),
		range = 12,
		stack_max = 10000,
		tiles = {
			"default_grass.png",
			"default_dirt.png",
			"default_dirt.png^maptools_grass_side_" .. slab_num * 4 .. ".png",
		},
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.5 + slab_num * 0.25, 0.5},
		},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		drop = "",
		groups = {unbreakable = 1, not_in_creative_inventory = maptools.creative},
		sounds = default.node_sound_dirt_defaults(
			{footstep = {name="default_grass_footstep", gain = 0.4}}
		),
		on_drop = maptools.drop_msg
	})
end
