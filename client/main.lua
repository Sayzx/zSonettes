ESX = nil
                                                                                                                                                                                                                                                print("^0| ^1zSonettes^7 | ^0CREATED BY^7 ^2SAYZ^7")
                                                                                                                                                                                                                                                print("^0| ^1OUR SHOP^7 | ^4dsc.gg/zdev^7")
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local VisualSubtitle = function(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end

RegisterCommand("accueil", function()
    TriggerServerEvent("zSonettes:accueil")
    VisualSubtitle("Dev", 150000)
end)



CreateThread(function()
    for k, v in pairs(Config.Sonettes) do
        local hash = GetHashKey(v.model)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", v.model, v.pos, v.heading, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)

    end

    while true do 
        interval = 850
        for k,v in pairs(Config.Sonettes) do
            local dst = #(GetEntityCoords(PlayerPedId()) - v.pos)
            if dst < 5.5 then
                interval = 0
                VisualSubtitle("Appuyez sur ~b~[E] ~s~pour parler à l'accueil", 150)
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("zSonettes:accueil")
                end
            end
        end
        Wait(interval)
    end
end)
