ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                                                                                                                                                                                                                                    print("^0| ^1zSonettes^7 | ^0CREATED BY^7 ^2SAYZ^7")
                                                                                                                                                                                                                                    print("^0| ^1OUR SHOP^7 | ^4dsc.gg/zdev^7")

RegisterNetEvent("zSonettes:accueil")
AddEventHandler("zSonettes:accueil", function()
    local _src = source
    print("test")
    for k,v in pairs(Config.Sonettes) do
        if ESX.GetPlayerFromId(_src).job.name == v.job then
            TriggerClientEvent("esx:showNotification", -1, "Quelqu'un sonne à l'accueil !")
        else 
            TriggerClientEvent("esx:showNotification", _src, "Appel Recu")
            
        end        
    end
end)