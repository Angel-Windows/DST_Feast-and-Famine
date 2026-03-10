local assets = {Asset("ANIM", "anim/crystalised_honey.zip"), Asset("ANIM", "anim/honeys.zip")}

local function crystalfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("crystalised_honey")
    inst.AnimState:SetBank("crystalised_honey")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("icebox_valid")
    inst:AddTag("honeyed")

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable")
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "honey_crystals"

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = 40 

    MakeHauntableLaunch(inst)

    return inst
end

local function floralfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("honeys")
    inst.AnimState:SetBank("honeys")
    inst.AnimState:PlayAnimation("floral_idle")

    inst:AddTag("honeyed")
    inst:AddTag("flower")

    MakeInventoryFloatable(inst, "med", nil, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = TUNING.SANITY_TINY

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("tradable")

    inst:AddComponent("inspectable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("inventoryitem")

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function winterfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("honeys")
    inst.AnimState:SetBank("honeys")
    inst.AnimState:PlayAnimation("winter_idle")

    inst:AddTag("honeyed")

    MakeInventoryFloatable(inst, "med", nil, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("tradable")

    inst:AddComponent("inspectable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("inventoryitem")

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function killerfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("honeys")
    inst.AnimState:SetBank("honeys")
    inst.AnimState:PlayAnimation("killer_idle")

    inst:AddTag("honeyed")

    MakeInventoryFloatable(inst, "med", nil, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_MEDSMALL
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = -TUNING.SANITY_SUPERTINY

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("tradable")

    inst:AddComponent("inspectable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("inventoryitem")

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

return Prefab("honey_crystals", crystalfn, assets), Prefab("honey_floral", floralfn, assets),
    Prefab("honey_winter", winterfn, assets), Prefab("honey_killer", killerfn, assets)
