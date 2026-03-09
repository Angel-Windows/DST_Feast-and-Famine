local terriblytastythings = { -- "bubbletea",
    "flour", "syrup", "feast_cookpot", "honeys", "stick_pretzels", "cheese_goat", "eggs_faf", "meats_faf",
    "mushrooms_faf",
    "mealingstone", "hungerregenbuff", "sanityregenbuff", "breadbox" }

for k, v in pairs(terriblytastythings) do
    table.insert(PrefabFiles, v)
end

--------------------------------------------

local require = GLOBAL.require
local cooking = require("cooking")
local AllRecipes = GLOBAL.AllRecipes
local ingredients = cooking.ingredients

local ISLAND = GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795")
local TROPICAL = GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912")
local MILK = GLOBAL.KnownModIndex:IsModEnabled("workshop-436654027")
local LEGION = GLOBAL.KnownModIndex:IsModEnabled("workshop-1392778117")

--[[InsertIngredientValues function by Serpens https://forums.kleientertainment.com/forums/topic/69732-dont-use-addingredientvalues-in-mods/]]

-- NOTE: If the thing already had a tag with the same name, you will still overwrite the old value, unless keepoldvalues is true. E.g if fish already had a tag seafood with value 0.5 and now you use this function with value 1, the result will be 1.
function InsertIngredientValues(names, tags, cancook, candry, keepoldvalues) -- if cancook or candry is true, the cooked/dried variant of the thing will also get the tags and the tags precook/dried.
    for _, name in pairs(names) do
        if ingredients[name] == nil then                                     -- if it is not cookable already, it will be nil. Following code is just a copy of the normal AddIngredientValues function
            ingredients[name] = {
                tags = {}
            }

            if cancook then
                ingredients[name .. "_cooked"] = {
                    tags = {}
                }
            end

            if candry then
                ingredients[name .. "_dried"] = {
                    tags = {}
                }
            end

            for tagname, tagval in pairs(tags) do
                ingredients[name].tags[tagname] = tagval
                -- print(name,tagname,tagval,ingtable[name].tags[tagname])

                if cancook then
                    ingredients[name .. "_cooked"].tags.precook = 1
                    ingredients[name .. "_cooked"].tags[tagname] = tagval
                end
                if candry then
                    ingredients[name .. "_dried"].tags.dried = 1
                    ingredients[name .. "_dried"].tags[tagname] = tagval
                end
            end
        else                                                                        -- but if there are already some tags, don't delete previous tags, just add the new ones.
            for tagname, tagval in pairs(tags) do
                if ingredients[name].tags[tagname] == nil or not keepoldvalues then -- only overwrite old value, if there is no old value, or if keepoldvalues is not true (will be not true by default)
                    ingredients[name].tags[tagname] =
                        tagval                                                      -- this will overwrite the old value, if there was one
                end
                -- print(name,tagname,tagval,ingtable[name].tags[tagname])

                if cancook then
                    if ingredients[name .. "_cooked"] == nil then
                        ingredients[name .. "_cooked"] = {
                            tags = {}
                        }
                    end
                    if ingredients[name .. "_cooked"].tags.precook == nil or not keepoldvalues then
                        ingredients[name .. "_cooked"].tags.precook = 1
                    end
                    if ingredients[name .. "_cooked"].tags[tagname] == nil or not keepoldvalues then
                        ingredients[name .. "_cooked"].tags[tagname] = tagval
                    end
                end
                if candry then
                    if ingredients[name .. "_dried"] == nil then
                        ingredients[name .. "_dried"] = {
                            tags = {}
                        }
                    end
                    if ingredients[name .. "_dried"].tags.dried == nil or not keepoldvalues then
                        ingredients[name .. "_dried"].tags.dried = 1
                    end
                    if ingredients[name .. "_dried"].tags[tagname] == nil or not keepoldvalues then
                        ingredients[name .. "_dried"].tags[tagname] = tagval
                    end
                end
            end
        end
    end
end

require "Feast_ingredienttags"

InsertIngredientValues({ "humanmeat" }, {
    meat = 1
}, true, true, true)
InsertIngredientValues({ "moon_cap" }, {
    mushrooms = 1
}, true, false, true)
InsertIngredientValues({ "red_cap" }, {
    mushrooms = 1,
    mushrooms_red = 1
}, true, false, true)
InsertIngredientValues({ "green_cap" }, {
    mushrooms = 1,
    mushrooms_green = 1
}, true, false, true)
InsertIngredientValues({ "blue_cap" }, {
    mushrooms = 1,
    mushrooms_blue = 1
}, true, false, true)
InsertIngredientValues({ "red_chunk", "red_chunk_bloom" }, {
    mushrooms = 1,
    mushrooms_red = 1,
    veggie = 0.5
}, false, false, true)
InsertIngredientValues({ "green_chunk", "green_chunk_bloom" }, {
    mushrooms = 1,
    mushrooms_green = 1,
    veggie = 0.5
}, false, false, true)
InsertIngredientValues({ "blue_chunk", "blue_chunk_bloom" }, {
    mushrooms = 1,
    mushrooms_blue = 1,
    veggie = 0.5
}, false, false, true)
InsertIngredientValues({ "trunk_summer", "trunk_winter", "trunk_cooked", "trunk_winter_cooked" }, {
    meat = 1
}, false, false, true)
InsertIngredientValues({ "honey" }, {
    honey = 1
}, false, false, true)
InsertIngredientValues({ "honey_floral" }, {
    sweetener = 1,
    honey = 1
}, false, false, false)
InsertIngredientValues({ "honey_killer" }, {
    sweetener = 1,
    honey = 1
}, false, false, false)
InsertIngredientValues({ "honey_crystals" }, {
    inedible = 1,
    sugar = 1
}, false, false, false)
InsertIngredientValues({ "corn" }, {
    sugar = 1
}, false, false, true)
-- InsertIngredientValues({"sap"},{syrup=1},false,false,true) -- TODO: Sugarwood forest compatability
InsertIngredientValues({ "syrup" }, {
    sweetener = 1
}, false, false, false)
InsertIngredientValues({ "egg_monster" }, {
    egg = 1,
    monster = 1
}, true, false, false)
InsertIngredientValues({ "egg_plant" }, {
    egg = 1,
    plantmeat = 1
}, true, false, false)
InsertIngredientValues({ "plantmeat" }, {
    plantmeat = 1
}, true, false, true)
InsertIngredientValues({ "rocky_meat" }, {
    shellfish = 1,
    fish = 2
}, false, false, true)
InsertIngredientValues({ "wobster_sheller_land" }, {
    shellfish = 1
}, false, false, true)
if ISLAND or TROPICAL then
    InsertIngredientValues({ "lobster" }, {
        shellfish = 1
    }, false, false, true)
end
InsertIngredientValues({ "glommerfuel" }, {}, false, false, true)
InsertIngredientValues({ "wheat" }, {
    inedible = 2
}, false, false, false)
InsertIngredientValues({ "seeds" }, {
    inedible = 2
}, true, false, true)
InsertIngredientValues({ "potato_seeds", "tomato_seeds", "carrot_seeds", "corn_seeds", "pumpkin_seeds",
    "watermelon_seeds", "asparagus_seeds", "eggplant_seeds", "onion_seeds", "garlic_seeds",
    "pepper_seeds", "dragonfruit_seeds" }, {
    inedible = 2
}, false, false, false)
InsertIngredientValues({ "pomegranate_seeds" }, {
    fruit = 0.25
}, false, false, false)
InsertIngredientValues({ "durian_seeds" }, {
    monster = 1
}, false, false, false)
if ISLAND then
    InsertIngredientValues({ "sweet_potato_seeds" }, {
        inedible = 2
    }, false, false, false)
end
if LEGION then
    InsertIngredientValues({ "pineananas_seeds" }, {
        inedible = 2
    }, false, false, false)
end
InsertIngredientValues({ "flour" }, {
    veggie = 0.5,
    inedible = 1,
    flour = 1
}, false, false, false)
InsertIngredientValues({ "pasta_dry" }, {
    noodle = 1
}, false, false, false)
InsertIngredientValues({ "turnip" }, {
    veggie = 1
}, false, false, false)
InsertIngredientValues({ "carrot" }, {
    carrot = 1
}, true, false, true)
InsertIngredientValues({ "rock_avocado_fruit_ripe" }, {
    stone = 1
}, true, false, true)
InsertIngredientValues({ "tomato_rock_dried" }, {
    veggie = 1
}, false, false, false)
InsertIngredientValues({ "fishbite_dried" }, {
    fish = 0.5
}, false, false, false)
InsertIngredientValues({ "fish_dried" }, {
    fish = 1
}, false, false, false)
InsertIngredientValues({ "cheese_goat" }, {
    cheese = 1
}, false, false, false)
InsertIngredientValues({ "berries", "berries_juicy" }, {
    berries = 0.5
}, true, false, true)
InsertIngredientValues({ "bigbird_meat" }, {
    meat = 1,
    poultry = 1
}, true, false, false)
InsertIngredientValues({ "chicken" }, {
    meat = 0.5,
    poultry = 1
}, false, false, false)
InsertIngredientValues({ "drumstick" }, {
    poultry = 1
}, true, false, true)
InsertIngredientValues({ "rabbit" }, {
    meat = 0.5
}, false, false, false)
InsertIngredientValues({ "manrabbit_tail" }, {
    inedible = 1
}, false, false, false)
InsertIngredientValues({ "froglegs" }, {
    frogmeat = 1
}, true, false, true)
InsertIngredientValues({ "toad_meat" }, {
    meat = 1,
    frogmeat = 1
}, true, false, false)
InsertIngredientValues({ "squid_meat" }, {
    monster = 1,
    fish = 0.5
}, true, false, false)
InsertIngredientValues({ "bear_meat" }, {
    meat = 1.5
}, true, false, false)
InsertIngredientValues({ "deer_meat" }, {
    meat = 1.5
}, true, false, false)
InsertIngredientValues({ "dragon_meat" }, {
    meat = 1
}, true, false, false)

--------------------------------------------

if GetModConfigData("config_HoneyCrystals") then
    GLOBAL.TUNING.FAFHONEYCRYSTALS = true
end

if GetModConfigData("config_MonsterEggs") then
    GLOBAL.TUNING.FAFMONSTEREGGS = true
end

if GetModConfigData("config_HoneyFridge") then
    GLOBAL.TUNING.FAFHONEYFRIDGE = true
end

if GetModConfigData("config_LeafyEggs") then
    GLOBAL.TUNING.FAFLEAFYEGGS = true
end

local function crystalize(inst)
    if GLOBAL.TheWorld.state.temperature < 0 then
        inst.components.perishable:SetPercent(0)
    end
end

local function honeyontemperaturetick(inst, temperature)
    if temperature < 0 and (inst.components.inventoryitem == nil or inst.components.inventoryitem.owner == nil) then
        inst.components.perishable:SetPercent(0)
    end
end

local function fridgehoney(inst, owner)
    if owner ~= nil and owner:HasTag("fridge") and not owner:HasTag("nocool") then
        local goop = GLOBAL.SpawnPrefab("honey_crystals")
        if goop ~= nil then
            if goop.components.stackable ~= nil and inst.components.stackable ~= nil then
                goop.components.stackable:SetStackSize(inst.components.stackable.stacksize)
            end
            local x, y, z = inst.Transform:GetWorldPosition()
            inst:Remove()
            goop.Transform:SetPosition(x, y, z)
            if goop.components.inventoryitem ~= nil then
                goop.components.inventoryitem:OnDropped(true, 1)
            end
        end
    end
end

local function HoneyCrystalsInit(inst)
    if GLOBAL.TUNING.FAFHONEYFRIDGE == nil then
        inst:AddTag("smallcreature") -- Hacky, but prevents honey from being placed in the fridge
    end
    if inst.components.perishable then
        inst.components.perishable.onperishreplacement = "honey_crystals"
        inst:ListenForEvent("onputininventory", fridgehoney)
        inst:ListenForEvent("ondropped", crystalize)
        inst:ListenForEvent("on_loot_dropped", crystalize)
        inst:WatchWorldState("temperature", honeyontemperaturetick)
    end
end

AddPrefabPostInit("honey", function(inst)
    inst.AnimState:SetBank("honeys")
    inst.AnimState:SetBuild("honeys")
    inst.AnimState:PlayAnimation("normal_idle")
end)

AddPrefabPostInit("beebox", function(inst)
    if inst.components.harvestable then
        inst:WatchWorldState("isspring", function(inst)
            inst.components.harvestable.product = "honey_killer"
        end) -- Seasonal Transitions
        inst:WatchWorldState("issummer", function(inst)
            inst.components.harvestable.product = "honey_floral"
        end)
        inst:WatchWorldState("isautumn", function(inst)
            inst.components.harvestable.product = "honey"
        end)
        inst:WatchWorldState("iswinter", function(inst)
            inst.components.harvestable.product = "honey"
        end)

        if GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SUMMER then -- Loading directly in
            inst.components.harvestable.product = "honey_floral"
        elseif GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SPRING then
            inst.components.harvestable.product = "honey_killer"
        else
            inst.components.harvestable.product = "honey"
        end
    end
end)

AddPrefabPostInit("bee", function(inst)
    if inst.components.lootdropper then
        inst.components.lootdropper.randomloot = nil -- reset the drops, have to do this each time or we'll keep adding honey to the random loot table
        -- inst.components.lootdropper:AddRandomLoot("honey", 1)
        if GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SPRING then
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey_killer", 0.5)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        elseif GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SUMMER then
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey_floral", 2)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        else
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey", 1)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        end

        inst:WatchWorldState("isspring", function()
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey_killer", 0.5)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        end)
        inst:WatchWorldState("issummer", function()
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey_floral", 2)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        end)
        inst:WatchWorldState("isautumn", function()
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey", 1)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        end)
        inst:WatchWorldState("iswinter", function()
            inst.components.lootdropper.randomloot = nil
            inst.components.lootdropper:AddRandomLoot("honey", 1)
            inst.components.lootdropper:AddRandomLoot("stinger", 5)
            inst.components.lootdropper.numrandomloot = 1
        end)
    end
end)

AddPrefabPostInit("killerbee", function(inst) -- much simpler
    if inst.components.lootdropper then
        inst.components.lootdropper.randomloot = nil
        inst.components.lootdropper:AddRandomLoot("honey_killer", 1)
        inst.components.lootdropper:AddRandomLoot("stinger", 5)
        inst.components.lootdropper.numrandomloot = 1
    end
end)

AddPrefabPostInit("beehive", function(inst)
    if inst.components.lootdropper then
        if GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SPRING then
            inst.components.lootdropper:SetLoot({ "honey_killer", "honey_killer", "honey_killer", "honeycomb" })
        elseif GLOBAL.TheWorld.state.season == GLOBAL.SEASONS.SUMMER then
            inst.components.lootdropper:SetLoot({ "honey_floral", "honey_floral", "honey_floral", "honeycomb" })
        else
            inst.components.lootdropper:SetLoot({ "honey", "honey", "honey", "honeycomb" })
        end

        inst:WatchWorldState("isspring", function()
            inst.components.lootdropper:SetLoot({ "honey_killer", "honey_killer", "honey_killer", "honeycomb" })
        end) -- Seasonal Transitions
        inst:WatchWorldState("issummer", function()
            inst.components.lootdropper:SetLoot({ "honey_floral", "honey_floral", "honey_floral", "honeycomb" })
        end)
        inst:WatchWorldState("isautumn", function()
            inst.components.lootdropper:SetLoot({ "honey", "honey", "honey", "honeycomb" })
        end)
        inst:WatchWorldState("iswinter", function()
            inst.components.lootdropper:SetLoot({ "honey", "honey", "honey", "honeycomb" })
        end)
    end
end)

AddPrefabPostInit("wasphive", function(inst)
    if inst.components.lootdropper then
        inst.components.lootdropper:SetLoot({ "honey_killer", "honey_killer", "honey_killer", "honeycomb" })
    end
end)

-- PENGULL EGGS --
AddPrefabPostInit("penguin", function(inst)
    if inst.eggprefab then
        inst.eggprefab = "egg_pengull"
    end
end)

-- ICE CREAM MAGIC --

local function icecreamfridge(inst, owner)
    if owner ~= nil and owner:HasTag("fridge") and not owner:HasTag("nocool") then
        inst.components.perishable:StopPerishing()
    end
end

local function icecreamnofridge(inst, owner)
    inst.components.perishable:StartPerishing()
end

local function IcecreamFridgeInit(inst)
    if inst.components.perishable then
        inst:ListenForEvent("onputininventory", icecreamfridge)
        inst:ListenForEvent("onpickup", icecreamnofridge)
        inst:ListenForEvent("ondropped", icecreamnofridge)
    end
end

-- BREAD MAGIC --

local function breadbox(inst, owner)
    if owner ~= nil and owner:HasTag("breadbox") then
        inst.components.perishable:StopPerishing()
    end
end

local function breadnobox(inst, owner)
    inst.components.perishable:StartPerishing()
end

local function BreadBoxInit(inst)
    inst:AddTag("breadbox_valid")
    if inst.components.perishable then
        inst:ListenForEvent("onputininventory", breadbox)
        inst:ListenForEvent("onpickup", breadnobox)
        inst:ListenForEvent("ondropped", breadnobox)
    end
end

-- TIME 4 CHEESE --

local function GoatCheeseInit(inst)
    if inst.components.perishable then
        inst.components.perishable.onperishreplacement = "cheese_goat"
    end
end

-- MONSTER EGG BIZ --

local seedmin = GetModConfigData("config_SeedMin")
local seedplus = GetModConfigData("config_SeedPlus")

local invalid_foods = { "bird_egg", "bird_egg_cooked", "rottenegg", -- "monstermeat",
    "egg_monster", "egg_monster_cooked",                            -- "plantmeat",
    "egg_plant", "egg_plant_cooked" }

local function ShouldAcceptMonsterItem(inst, item)
    local seed_name = string.lower(item.prefab .. "_seeds")

    local can_accept = (item.components.edible and
        (GLOBAL.Prefabs[seed_name] or item.prefab == "seeds" or string.match(item.prefab, "_seeds") or
            (item.components.edible.foodtype == GLOBAL.FOODTYPE.MEAT and
                not item:HasTag("preparedfood")))) or item.prefab == "wheat"

    if table.contains(invalid_foods, item.prefab) then
        can_accept = false
    end

    return can_accept
end

local function PushStateAnim(inst, anim, loop)
    inst.AnimState:PushAnimation(anim .. inst.CAGE_STATE, loop)
end

local function GetBird(inst)
    return (inst.components.occupiable and inst.components.occupiable:GetOccupant()) or nil
end
local function ShowFeedMessagea(inst, giver, item, lootname)
    if giver and giver.components.talker then
        local foodname = item:GetDisplayName()
        local loot = lootname or "something"
        giver.components.talker:Say("Я дал " .. foodname .. ", получил " .. loot)
    end
end
local function ShowFeedMessage(giver, lootname)
    if giver and giver.components.talker then
        giver.components.talker:Say("Птица получила: " .. lootname)
    end
end
local function OnFeed(inst, giver, food)
    giver.components.talker:Say("Я даю птице: " .. "Ху")
    if giver and giver.components.talker then
        local name = food.prefab or "unknown"
        giver.components.talker:Say("Я даю птице: " .. name)
    end
end

local function DigestFoodMonster(inst, food, giver)
    -- OnFeed(inst, giver, food)
    if (food.components.edible.foodtype == GLOBAL.FOODTYPE.MEAT) then
        local egg = nil
        if (GetModConfigData("config_MonsterEggs") and food.prefab == "monstermeat" and math.random() > 0.04) then
            egg = inst.components.lootdropper:SpawnLootPrefab("egg_monster")
        elseif (GetModConfigData("config_LeafyEggs") and food.prefab == "plantmeat" and math.random() > 0.04) then
            egg = inst.components.lootdropper:SpawnLootPrefab("egg_plant")
        end

        if not egg then
            egg = inst.components.lootdropper:SpawnLootPrefab("bird_egg")
        end
        -- ShowFeedMessage(inst, GetModConfigData("config_KitchenWheat"))
        -- if egg and giver and giver.components.talker then
        --     ShowFeedMessagea(inst, giver, food, egg.prefab)
        -- end
    elseif (food.prefab == "wheat") then
        if GetModConfigData("config_KitchenWheat") then
            inst._wheatcount = (inst._wheatcount or 0) + 1
            if inst._wheatcount >= 5 then
                inst._wheatcount = 0
                inst.components.lootdropper:SpawnLootPrefab("dug_wheatgrass")
                return
            end
        end
        local seed_name = "seeds"
        if GLOBAL.Prefabs[seed_name] ~= nil then
            inst.components.lootdropper:SpawnLootPrefab(seed_name)
        end
        if math.random() < 0.05 then
            inst.components.lootdropper:SpawnLootPrefab("dug_grass")
        end
    else
        local seed_name = string.lower(food.prefab .. "_seeds")
        if GLOBAL.Prefabs[seed_name] ~= nil then
            local num_seeds = math.random(seedmin, seedmin + seedplus)
            for i = 1, num_seeds do
                inst.components.lootdropper:SpawnLootPrefab(seed_name)
            end
        elseif math.random() < 0.33 then
            local loot = inst.components.lootdropper:SpawnLootPrefab("guano")
            loot.Transform:SetScale(.33, .33, .33)
        end
    end

    local bird = GetBird(inst)
    if bird and bird:IsValid() and bird.components.perishable then
        bird.components.perishable:SetPercent(1)
    end
end

local function OnGetItemMonster(inst, giver, item)
    if inst.components.sleeper and inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end

    if item.components.edible ~= nil and
        (item.components.edible.foodtype == GLOBAL.FOODTYPE.MEAT or item.prefab == "seeds" or
            string.match(item.prefab, "_seeds") or GLOBAL.Prefabs[string.lower(item.prefab .. "_seeds")] ~= nil or
            item.prefab == "wheat") then -- <- добавил явную проверку на пшеницу
        inst.AnimState:PlayAnimation("peck")
        inst.AnimState:PushAnimation("peck")
        inst.AnimState:PushAnimation("peck")
        inst.AnimState:PushAnimation("hop")
        PushStateAnim(inst, "idle", true)
        inst:DoTaskInTime(60 * GLOBAL.FRAMES, function()
            DigestFoodMonster(inst, item, giver)
        end)
    end
end

function DigestFoodMonsterInit(inst)
    if inst and inst.components.trader then
        inst.components.trader:SetAcceptTest(ShouldAcceptMonsterItem)
        inst.components.trader.onaccept = OnGetItemMonster
    end
end

AddPrefabPostInit("birdcage", DigestFoodMonsterInit)

if GLOBAL.TUNING.FAFHONEYCRYSTALS ~= nil then
    AllRecipes["spice_sugar"].ingredients = { Ingredient("honey_crystals", 3, "images/inventoryimages/feast_famine.xml",
        "honey_crystals") }
    AddPrefabPostInit("honey", HoneyCrystalsInit)
    AddPrefabPostInit("honey_floral", HoneyCrystalsInit)
    AddPrefabPostInit("honey_killer", HoneyCrystalsInit)
end

AddPrefabPostInit("icecream", IcecreamFridgeInit)
AddPrefabPostInit("watermelonicle", IcecreamFridgeInit)
AddPrefabPostInit("bananapop", IcecreamFridgeInit)
AddPrefabPostInit("goatmilk", GoatCheeseInit)

local BREADS = { "bread", "bread_garlic", "bread_cheese", "bread_jam", "frogglebunwich", "bread_rocky", -- "bread_fish",
    "leafymeatburger", "barnaclepita", "frognewton" }

for k, v in pairs(BREADS) do
    AddPrefabPostInit(v, BreadBoxInit)
end

if ISLAND then
    AddPrefabPostInit("jellyopop", IcecreamFridgeInit)
end
--------------------------------------------
--[[ -- moved to Modmain
for k, recipe in pairs(require("Feast_foods")) do AddCookerRecipe("cookpot", recipe) end
for k, recipe in pairs(require("Feast_foods")) do AddCookerRecipe("portablecookpot", recipe) end
for k, recipe in pairs(require("Feast_foodspiced")) do AddCookerRecipe("portablespicer", recipe) end
]]

if MILK then
    for k, recipe in pairs(require("Milk_foods")) do
        AddCookerRecipe("portablecookpot", recipe)
    end
    for k, recipe in pairs(require("Milk_foods")) do
        AddCookerRecipe("portablespicer", recipe)
    end

    for k, recipe in pairs(require("Milk_foods_unspicy")) do
        AddCookerRecipe("portablecookpot", recipe)
    end

    for k, recipe in pairs(require("Milk_foodspiced")) do
        AddCookerRecipe("portablespicer", recipe)
    end
end

--------------------------------------------

local syrup = {
    name = "syrup",
    test = function(cooker, names, tags)
        return tags.sugar and tags.sugar > 3
    end,

    priority = 20,
    weight = 1,
    perishtime = nil,
    cooktime = 0.5,
    tags = { "honeyed" },
    cookbook_atlas = "images/cookbook_syrup.xml"
    -- oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_DUST_MOTH_FOOD
}

AddCookerRecipe("cookpot", syrup)
AddCookerRecipe("portablecookpot", syrup)

--[[ -- disabled in favour of Steamed Twigs
local stick_pretzels =
{
test = function(cooker, names, tags) return names.twigs and names.twigs >= 2 and not tags.fruit and not tags.flour end,
    priority = 30,
    weight = 1,
    cookbook_atlas = "images/cookbook_stick_pretzels.xml",
    foodtype = GLOBAL.FOODTYPE.ROUGHAGE,
    secondaryfoodtype = GLOBAL.FOODTYPE.WOOD,
    health = TUNING.HEALING_TINY/2,
    hunger = TUNING.CALORIES_TINY*6,
    perishtime = TUNING.PERISH_PRESERVED,
    sanity = 0,
    cooktime = 0.5
}

if GLOBAL.TUNING.FAFTWIGGYTREATS then
    AddCookerRecipe("cookpot", stick_pretzels)
    AddCookerRecipe("portablecookpot", stick_pretzels)
end
]]

local pasta_wet = {
    name = "pasta_wet",
    test = function(cooker, names, tags)
        return tags.egg and tags.flour
    end,

    priority = 20,
    weight = 1,
    health = 0,
    hunger = -TUNING.CALORIES_MED,
    perishtime = TUNING.PERISH_FAST,
    sanity = -TUNING.SANITY_SMALL,
    cooktime = 0.5,
    cookbook_atlas = "images/cookbook_pasta_wet.xml"
}

AddCookerRecipe("cookpot", pasta_wet)
AddCookerRecipe("portablecookpot", pasta_wet)

local cheese_goat = {
    name = "cheese_goat",
    test = function(cooker, names, tags)
        return names.goatmilk
    end,

    priority = 0,
    weight = 1,
    health = TUNING.HEALING_SMALL,
    hunger = TUNING.CALORIES_SMALL * 3,
    perishtime = TUNING.PERISH_SLOW,
    sanity = TUNING.SANITY_TINY,
    cooktime = 2,
    cookbook_atlas = "images/cookbook_cheese_goat.xml"
}

AddCookerRecipe("cookpot", cheese_goat)
AddCookerRecipe("portablecookpot", cheese_goat)

cooking.GetRecipe("cookpot", "jellybean").test = function(cooker, names, tags)
    return names.royal_jelly and tags.fruit and not tags.inedible and not tags.monster
end
cooking.GetRecipe("portablecookpot", "jellybean").test = function(cooker, names, tags)
    return names.royal_jelly and tags.fruit and not tags.inedible and not tags.monster
end
cooking.GetRecipe("cookpot", "icecream").test = function(cooker, names, tags)
    return tags.frozen and tags.dairy and tags.sweetener and not tags.meat and not tags.veggie and
        not names.beefalo_milk and not tags.inedible and not tags.egg
end -- Beefalo Milk and Cheese Nerf
cooking.GetRecipe("portablecookpot", "icecream").test = function(cooker, names, tags)
    return tags.frozen and tags.dairy and tags.sweetener and not tags.meat and not tags.veggie and
        not names.beefalo_milk and not tags.inedible and not tags.egg
end -- Beefalo Milk and Cheese Nerf
cooking.GetRecipe("cookpot", "powcake").test = function(cooker, names, tags)
    return names.twigs and tags.sweetener and
        (names.corn or names.corn_cooked or names.oceanfish_small_5_inv or names.oceanfish_medium_5_inv)
end
cooking.GetRecipe("portablecookpot", "powcake").test = function(cooker, names, tags)
    return names.twigs and tags.sweetener and
        (names.corn or names.corn_cooked or names.oceanfish_small_5_inv or names.oceanfish_medium_5_inv)
end
cooking.GetRecipe("cookpot", "fishsticks").health = TUNING.HEALING_MED
cooking.GetRecipe("portablecookpot", "fishsticks").health = TUNING.HEALING_MED
cooking.GetRecipe("cookpot", "fishtacos").health = TUNING.HEALING_LARGE
cooking.GetRecipe("portablecookpot", "fishtacos").health = TUNING.HEALING_LARGE
cooking.GetRecipe("cookpot", "fishtacos").hunger = TUNING.CALORIES_MED
cooking.GetRecipe("portablecookpot", "fishtacos").hunger = TUNING.CALORIES_MED

cooking.GetRecipe("cookpot", "lobsterbisque").test = function(cooker, names, tags)
    return tags.shellfish and tags.frozen
end
cooking.GetRecipe("portablecookpot", "lobsterbisque").test = function(cooker, names, tags)
    return tags.shellfish and tags.frozen
end
cooking.GetRecipe("cookpot", "lobsterdinner").test = function(cooker, names, tags)
    return tags.shellfish and names.butter and not tags.frozen
end
cooking.GetRecipe("portablecookpot", "lobsterdinner").test = function(cooker, names, tags)
    return tags.shellfish and names.butter and not tags.frozen
end

cooking.GetRecipe("cookpot", "frogglebunwich").test = function(cooker, names, tags)
    return tags.frogmeat and tags.veggie
end
cooking.GetRecipe("portablecookpot", "frogglebunwich").test = function(cooker, names, tags)
    return tags.frogmeat and tags.veggie
end
cooking.GetRecipe("cookpot", "turkeydinner").test = function(cooker, names, tags)
    return tags.poultry and tags.poultry > 1 and tags.meat and tags.meat > 1 and (tags.veggie or tags.fruit)
end
cooking.GetRecipe("portablecookpot", "turkeydinner").test = function(cooker, names, tags)
    return tags.poultry and tags.poultry > 1 and tags.meat and tags.meat > 1 and (tags.veggie or tags.fruit)
end

cooking.GetRecipe("portablecookpot", "frogfishbowl").test = function(cooker, names, tags)
    return tags.frogmeat and tags.frogmeat >= 2 and tags.fish and tags.fish >= 1 and not tags.inedible
end

cooking.GetRecipe("cookpot", "honeynuggets").test = function(cooker, names, tags)
    return tags.honey and tags.meat and tags.meat <= 1.5 and not tags.inedible
end
cooking.GetRecipe("portablecookpot", "honeynuggets").test = function(cooker, names, tags)
    return tags.honey and tags.meat and tags.meat <= 1.5 and not tags.inedible
end
cooking.GetRecipe("cookpot", "honeyham").test = function(cooker, names, tags)
    return tags.honey and tags.meat and tags.meat > 1.5 and not tags.inedible
end
cooking.GetRecipe("portablecookpot", "honeyham").test = function(cooker, names, tags)
    return tags.honey and tags.meat and tags.meat > 1.5 and not tags.inedible
end
cooking.GetRecipe("portablecookpot", "freshfruitcrepes").test = function(cooker, names, tags)
    return tags.fruit and tags.fruit >= 1.5 and names.butter and tags.honey
end

cooking.GetRecipe("cookpot", "shroomcake").test = function(cooker, names, tags)
    return names.moon_cap and tags.mushrooms_red and tags.mushrooms_blue and tags.mushrooms_green
end
cooking.GetRecipe("portablecookpot", "shroomcake").test = function(cooker, names, tags)
    return names.moon_cap and tags.mushrooms_red and tags.mushrooms_blue and tags.mushrooms_green
end

cooking.GetRecipe("cookpot", "barnaclepita").test = function(cooker, names, tags)
    return (names.barnacle or names.barnacle_cooked) and tags.flour
end
cooking.GetRecipe("cookpot", "barnaclepita").stacksize = 2
cooking.GetRecipe("portablecookpot", "barnaclepita").test = function(cooker, names, tags)
    return (names.barnacle or names.barnacle_cooked) and tags.flour
end
cooking.GetRecipe("portablecookpot", "barnaclepita").stacksize = 2

cooking.GetRecipe("cookpot", "barnaclinguine").test = function(cooker, names, tags)
    return ((names.barnacle or 0) + (names.barnacle_cooked or 0) >= 2) and tags.noodle
end
cooking.GetRecipe("cookpot", "barnaclinguine").stacksize = 2
cooking.GetRecipe("portablecookpot", "barnaclinguine").test = function(cooker, names, tags)
    return ((names.barnacle or 0) + (names.barnacle_cooked or 0) >= 2) and tags.noodle
end
cooking.GetRecipe("portablecookpot", "barnaclinguine").stacksize = 2

cooking.GetRecipe("cookpot", "leafymeatburger").test = function(cooker, names, tags)
    return (names.plantmeat or names.plantmeat_cooked) and (names.onion or names.onion_cooked) and tags.flour
end
cooking.GetRecipe("cookpot", "leafymeatburger").stacksize = 2
cooking.GetRecipe("cookpot", "leafymeatburger").foodtype = "GOODIES"
cooking.GetRecipe("portablecookpot", "leafymeatburger").test = function(cooker, names, tags)
    return (names.plantmeat or names.plantmeat_cooked) and (names.onion or names.onion_cooked) and tags.flour
end
cooking.GetRecipe("portablecookpot", "leafymeatburger").stacksize = 2
cooking.GetRecipe("portablecookpot", "leafymeatburger").foodtype = "GOODIES"

cooking.GetRecipe("cookpot", "leafloaf").test = function(cooker, names, tags)
    return tags.plantmeat and tags.plantmeat >= 2
end
cooking.GetRecipe("cookpot", "leafloaf").foodtype = "GOODIES"
cooking.GetRecipe("portablecookpot", "leafloaf").test = function(cooker, names, tags)
    return tags.plantmeat and tags.plantmeat >= 2
end
cooking.GetRecipe("portablecookpot", "leafloaf").foodtype = "GOODIES"

cooking.GetRecipe("cookpot", "leafymeatsouffle").test = function(cooker, names, tags)
    return names.egg_plant and names.egg_plant >= 2 and tags.sweetener and tags.sweetener >= 2
end
cooking.GetRecipe("cookpot", "leafymeatsouffle").foodtype = "GOODIES"
cooking.GetRecipe("portablecookpot", "leafymeatsouffle").test = function(cooker, names, tags)
    return names.egg_plant and names.egg_plant >= 2 and tags.sweetener and tags.sweetener >= 2
end
cooking.GetRecipe("portablecookpot", "leafymeatsouffle").foodtype = "GOODIES"

cooking.GetRecipe("cookpot", "meatysalad").test = function(cooker, names, tags)
    return tags.plantmeat and tags.veggie and tags.veggie >= 3
end
cooking.GetRecipe("cookpot", "meatysalad").foodtype = "GOODIES"
cooking.GetRecipe("portablecookpot", "meatysalad").test = function(cooker, names, tags)
    return tags.plantmeat and tags.veggie and tags.veggie >= 3
end
cooking.GetRecipe("portablecookpot", "meatysalad").foodtype = "GOODIES"

cooking.GetRecipe("cookpot", "bunnystew").test = function(cooker, names, tags)
    return (names.rabbit or names.manrabbit_tail) and (tags.frozen and tags.frozen >= 2)
end
cooking.GetRecipe("portablecookpot", "bunnystew").test = function(cooker, names, tags)
    return (names.rabbit or names.manrabbit_tail) and (tags.frozen and tags.frozen >= 2)
end

cooking.GetRecipe("cookpot", "koalefig_trunk").test = function(cooker, names, tags)
    return (names.trunk_summer or names.trunk_winter or names.trunk_cooked or names.trunk_winter_cooked) and
        (names.fig or names.fig_cooked)
end
cooking.GetRecipe("portablecookpot", "koalefig_trunk").test = function(cooker, names, tags)
    return (names.trunk_summer or names.trunk_winter or names.trunk_cooked or names.trunk_winter_cooked) and
        (names.fig or names.fig_cooked)
end

if MILK then
    cooking.GetRecipe("cookpot", "cheese").test = function(cooker, names, tags)
        return tags.dairy and tags.dairy >= 2
    end
    cooking.GetRecipe("portablecookpot", "cheese").test = function(cooker, names, tags)
        return tags.dairy and tags.dairy >= 2
    end
    cooking.GetRecipe("cookpot", "pizza").test = function(cooker, names, tags)
        return tags.cheese == 0.5 and tags.meat and tags.veggie
    end -- edit to allow flour
    cooking.GetRecipe("portablecookpot", "pizza").test = function(cooker, names, tags)
        return tags.cheese == 0.5 and tags.meat and tags.veggie
    end
end

if ISLAND or TROPICAL then
    cooking.GetRecipe("cookpot", "lobsterdinner").test = function(cooker, names, tags)
        return tags.shellfish and tags.fat and not tags.frozen
    end
    cooking.GetRecipe("portablecookpot", "lobsterdinner").test = function(cooker, names, tags)
        return tags.shellfish and tags.fat and not tags.frozen
    end
end

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Recipes = GLOBAL.AllRecipes
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient

-- Credit to the Island Adventures team, this replaces sortkey
local function SortRecipe(a, b, filter_name, offset)
    local filter = GLOBAL.CRAFTING_FILTERS[filter_name]
    if filter and filter.recipes then
        for sortvalue, product in ipairs(filter.recipes) do
            if product == a then
                table.remove(filter.recipes, sortvalue)
                break
            end
        end

        local target_position = #filter.recipes + 1
        for sortvalue, product in ipairs(filter.recipes) do
            if product == b then
                target_position = sortvalue + offset
                break
            end
        end

        table.insert(filter.recipes, target_position, a)
    end
end

local function SortBefore(a, b, filter_name)
    SortRecipe(a, b, filter_name, 0)
end

local function SortAfter(a, b, filter_name)
    SortRecipe(a, b, filter_name, 1)
end

local flour = AddRecipe2("flour", { Ingredient("wheat", 3, nil, nil, "quagmire_wheat.tex") }, TECH.FOODPROCESSING_ONE, {
    nounlock = true
}, { "COOKING", "REFINE" })
SortBefore("flour", "wintersfeastoven", "COOKING")
SortBefore("flour", "rope", "REFINE")

local mealingstone = AddRecipe2("mealingstone", { Ingredient("cutstone", 4), Ingredient("hammer", 1) }, TECH.SCIENCE_TWO,
    {
        placer = "mealingstone_placer",
        -- atlas = nil
        image = "quagmire_mealingstone.tex"
    }, { "COOKING", "STRUCTURES" })
SortBefore("mealingstone", "meatrack", "COOKING")
SortBefore("mealingstone", "meatrack", "STRUCTURES")

local breadbox = AddRecipe2("breadbox", { Ingredient("boards", 1), Ingredient("rope", 1) }, TECH.SCIENCE_ONE, {
    placer = "breadbox_placer",
    min_spacing = 1.5
}, { "CONTAINERS", "COOKING", "STRUCTURES" })
SortBefore("breadbox", "icebox", "CONTAINERS")
SortBefore("breadbox", "icebox", "COOKING")
SortBefore("breadbox", "icebox", "STRUCTURES")

local function CutletSizeInit(inst)
    inst.Transform:SetScale(0.85, 0.85, 0.85)
end

local function CakeSizeInit(inst)
    inst.Transform:SetScale(1.25, 1.25, 1.25)
end

AddPrefabPostInit("juicy_cutlet", CutletSizeInit)
AddPrefabPostInit("cake_carrot", CakeSizeInit)

local function TrunkInit(inst)
    inst.AnimState:SetBank("meats")
    inst.AnimState:SetBuild("meats_faf")
    inst.AnimState:PlayAnimation("trunk_idle")
    inst.Transform:SetScale(1.3, 1.3, 1.3)
end

local function TrunkCookedInit(inst)
    inst.AnimState:SetBank("meats")
    inst.AnimState:SetBuild("meats_faf")
    inst.AnimState:PlayAnimation("trunk_cooked")
    inst.Transform:SetScale(1.3, 1.3, 1.3)
end

local function TrunkWinterInit(inst)
    inst.AnimState:SetBank("meats")
    inst.AnimState:SetBuild("meats_faf")
    inst.AnimState:PlayAnimation("trunk2_idle")
    inst.Transform:SetScale(1.3, 1.3, 1.3)
    if inst.components.cookable then
        inst.components.cookable.product = "trunk_winter_cooked"
    end
end

AddPrefabPostInit("trunk_summer", TrunkInit)
AddPrefabPostInit("trunk_cooked", TrunkCookedInit)
AddPrefabPostInit("trunk_winter", TrunkWinterInit)

local function garlicdisplaynamefn(inst)
    return "Extra Garlicky Garlic Bread"
end

local function chillidisplaynamefn(inst)
    return "Super Spicy Chili"
end

AddPrefabPostInit("bread_garlic_spice_garlic", function(inst)
    inst.displaynamefn = garlicdisplaynamefn
end)
AddPrefabPostInit("hotchili_spice_chili", function(inst)
    inst.displaynamefn = chillidisplaynamefn
end)
