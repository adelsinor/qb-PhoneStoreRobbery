Config = Config or {}

Config.requiredItem = "weapon_bat" -- required item to start stealing, set it to false if you don't want it
Config.DebugPoly = false -- for debug purpose
Config.policeCall = true -- set to false if you don't want to notify police 
Config.boxDistance = 1.5 -- distance from box
Config.requiredCopsCount = 0 -- required cops count to start stealing
Config.searchTime = 5000 -- searchTime before getting items
Config.cooldownTimer = 1000 * 60 * 60 -- 1000 = 1s // box cooldown

Config.phoneVitrines = { -- vitrines conf every stealable vitrine is an object
    vitrine1 = { -- preferable to set vitrinekey as name
        coords = vector3(1135.31, -472.23, 66.72), -- vitrine coords
        name = "vitrine1",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label", -- label is translatble.. you can change it in locales/en.lua
        heading = 250, -- vitrine heading
        length = 1.5, -- box length
        width = 1, -- box width
        items = { -- items that can be found in vitine
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 5,
                maxQuantity = 7,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 4,
                maxQuantity = 5,
                item = "laptop",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 6,
                item = "samsungphone", 
            },
        }
    },
    vitrine2 = {
        coords = vector3(1135.69, -469.59, 66.72),
        name = "vitrine2",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label",
        heading = 70,
        length = 1.5,
        width = 1,
        items = {
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 5,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 3,
                maxQuantity = 6,
                item = "samsungphone", 
            },
        }
    },
    vitrine3 = {
        coords = vector3(1133.18, -469.9, 66.72),
        name = "vitrine3",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        items = {
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 3,
                maxQuantity = 4,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 3,
                item = "samsungphone",
            },
        }
    },
    vitrine4 = {
        coords = vector3(1132.53, -471.97, 66.72),
        name = "vitrine4",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label",
        heading = 25,
        length = 1.5,
        width = 1,
        items = {
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 4,
                maxQuantity = 6,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 3,
                maxQuantity = 6,
                item = "samsungphone", 
            },
        }
    },
    vitrine5 = {
        coords = vector3(1133.12, -473.1, 66.76),
        name = "vitrine5",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        items = {
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 4,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 100,
                minQuantity = 1,
                maxQuantity = 7,
                item = "samsungphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 4,
                item = "laptop", 
            },
        }
    },
    vitrine6 = {
        coords = vector3(1134.72, -475.6, 66.72),
        name = "vitrine6",
        target_icon = "fas fa-sack-dollar",
        target_label = "phonerobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        items = {
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 2,
                maxQuantity = 3,
                item = "iphone",
            },
            {
                minChance = 90,
                maxChance = 99,
                minQuantity = 3,
                maxQuantity = 5,
                item = "samsungphone",
            },
        }
    }
}
