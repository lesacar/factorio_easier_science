local util = require("util")

-- Copy assembling-machine-3 prototype
local am3 = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
if not am3 then
    error("Required prototype 'assembling-machine-3' not found.")
end

-- Create science-crafter
local science_crafter = table.deepcopy(am3)
science_crafter.name = "science-crafter"
science_crafter.minable.result = "science-crafter"
science_crafter.crafting_speed = am3.crafting_speed
-- remove default assembler recipes and only allow our modded recipes
science_crafter.crafting_categories = {"science-crafter"}

-- Add the entity to data
data:extend({science_crafter})

-- Add item prototype
data:extend({
    {
        type = "item",
        name = "science-crafter",
        icon = "__space-age__/graphics/icons/foundry.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "z[science-crafter]",
        place_result = "science-crafter",
        stack_size = 50
    }
})

-- Define custom category
data:extend({
    {
        type = "recipe-category",
        name = "science-crafter"
    }
})

data:extend({
    {
        type = "recipe",
        name = "sc_science-crafter",
        category = "crafting",
        ingredients = {
            {type = "item", name = "iron-plate", amount = 50},
            {type = "item", name = "electronic-circuit", amount = 20},
            {type = "item", name = "advanced-circuit", amount = 5}
        },
        results = {
            {type = "item", name = "science-crafter", amount = 1}
        },
        enabled = false,
        icon = "__base__/graphics/icons/lab.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
})

-- Define custom recipes for the category
data:extend({
    -- Red Science (Automation)
    {
        type = "recipe",
        name = "sc_red_science",
        category = "science-crafter",
        ingredients = {
            {type = "item", name = "iron-plate", amount = 1}
        },
        results = {
            {type = "item", name = "automation-science-pack", amount = 2}
        },
        enabled = false,
        icon = "__base__/graphics/icons/automation-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
    -- Green Science (Logistic)
    {
        type = "recipe",
        name = "sc_green_science",
        category = "science-crafter",
        ingredients = {
            {type = "item", name = "copper-plate", amount = 1}
        },
        results = {
            {type = "item", name = "logistic-science-pack", amount = 2}
        },
        enabled = false,
        icon = "__base__/graphics/icons/logistic-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
    -- Blue Science (Chemical)
    {
        type = "recipe",
        name = "sc_blue_science",
        category = "science-crafter",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "sulfur", amount = 1}
        },
        results = {
            {type = "item", name = "chemical-science-pack", amount = 3}  -- Fixed result name
        },
        enabled = false,
        icon = "__base__/graphics/icons/chemical-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
    -- Military Science (Black)
    {
        type = "recipe",
        name = "sc_black_science",
        category = "science-crafter",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone-wall", amount = 1}
        },
        results = {
            {type = "item", name = "military-science-pack", amount = 2}  -- Yields 2 per cycle :cite[1]
        },
        enabled = false,
        icon = "__base__/graphics/icons/military-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
    -- Production Science (Purple)
    {
        type = "recipe",
        name = "sc_purple_science",
        category = "science-crafter",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "rail", amount = 4},  -- Rails are a key ingredient :cite[4]
        },
        results = {
            {type = "item", name = "production-science-pack", amount = 4}  -- Yields 3 per cycle :cite[1]
        },
        enabled = false,
        icon = "__base__/graphics/icons/production-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
    -- Utility Science (Yellow)
    {
        type = "recipe",
        name = "sc_yellow_science",
        category = "science-crafter",
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 1},  -- High demand for circuits :cite[2]:cite[5]
            {type = "item", name = "copper-plate", amount = 1}
        },
        results = {
            {type = "item", name = "utility-science-pack", amount = 3}  -- Yields 3 per cycle :cite[1]
        },
        enabled = false,
        icon = "__base__/graphics/icons/utility-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    },
        {
        type = "recipe",
        name = "sc_space_science",
        category = "science-crafter",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "iron-plate", amount = 1},
            {type = "item", name = "copper-plate", amount = 1}
        },
        results = {
            {type = "item", name = "space-science-pack", amount = 2}
        },
        enabled = false,
        icon = "__base__/graphics/icons/utility-science-pack.png",
        icon_size = 64,
        subgroup = "intermediate-product"
    }
})

-- Unlock recipes when appropriate technologies are researched
table.insert(data.raw["technology"]["automation"].effects, {
    type = "unlock-recipe",
    recipe = "sc_red_science"
})
table.insert(data.raw["technology"]["logistic-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_green_science"
})
table.insert(data.raw["technology"]["chemical-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_blue_science"
})
table.insert(data.raw["technology"]["military-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_black_science"
})
table.insert(data.raw["technology"]["production-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_purple_science"
})
table.insert(data.raw["technology"]["utility-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_yellow_science"
})
table.insert(data.raw["technology"]["space-science-pack"].effects, {
    type = "unlock-recipe",
    recipe = "sc_space_science"
})

-- and also don't forget to add science-crafter itself to technologies
-- automation-2 is assembling machine 2 tech node
table.insert(data.raw["technology"]["automation-2"].effects, {
    type = "unlock-recipe",
    recipe = "sc_science-crafter"
})