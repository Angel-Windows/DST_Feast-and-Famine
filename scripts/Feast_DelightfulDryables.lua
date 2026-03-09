local drythings = {"tomato_rock_dried", "pasta"}

for k, v in pairs(drythings) do
    table.insert(PrefabFiles, v)
end

local ISLAND = GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795")

local function DriedTomatoInit(inst)
    inst:AddComponent("dryable")
    inst.components.dryable:SetProduct("tomato_rock_dried")
    inst.components.dryable:SetDryTime(TUNING.DRY_FAST)
    inst.components.dryable:SetBuildFile("meat_rack_food_faf")
end

AddPrefabPostInit("tomato", DriedTomatoInit)