local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('custom', 'Customize a vehicle (Admin Only)', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-customs:client:openMenu', src)
end, 'admin')