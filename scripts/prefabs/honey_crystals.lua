local assets = {
    Asset("ANIM", "anim/crystalised_honey.zip"),
}

local function fn()
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

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "honey_crystals" 

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = 40

    inst:AddComponent("tradable")

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("honey_crystals", fn, assets)