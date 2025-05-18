local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('sonttu-fasttravel:tryTravel', function(destinationLabel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local destination = nil
    for _, dest in pairs(Config.FastTravel.destinations) do
        if dest.label == destinationLabel then
            destination = dest
            break
        end
    end

    if not destination then return end

    if Player.Functions.RemoveMoney('cash', Config.FastTravel.price) then
        TriggerClientEvent('sonttu-fasttravel:startTravel', src,
            destination.coords, destination.coords.w,
            destination.taxiSpawn, destination.taxiSpawn.w
        )
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Virhe',
            description = 'Tarvitset 10000 euroa matkustamiseen.',
            type = 'error'
        })
    end
end)
