local QBCore = exports['qb-core']:GetCoreObject()
local npcEntities = {}

local function GetRandomColor()
    local colors = {
        1,    -- Red
        2,    -- Green
        3,    -- Blue
        4,    -- Yellow
        5,    -- Orange
        6,    -- White
        7,    -- Black
        8,    -- Purple
        9,    -- Pink
        10,   -- Light Blue
    }
    return colors[math.random(#colors)]
end

CreateThread(function()
    for _, npc in ipairs(Config.NPC) do
        RequestModel(npc.model)
        while not HasModelLoaded(npc.model) do Wait(0) end

        local ped = CreatePed(0, npc.model, npc.coords.x, npc.coords.y, npc.coords.z - 1.0, npc.coords.w, false, true)
        FreezeEntityPosition(ped, true)        
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        table.insert(npcEntities, {entity = ped, coords = npc.coords, destinations = npc.destinations})

        local blip = AddBlipForCoord(npc.coords.x, npc.coords.y, npc.coords.z)
        SetBlipSprite(blip, 280) 
        SetBlipScale(blip, 0.7)   
        SetBlipColour(blip, 46)  
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Fast travel")
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)

        for _, npc in pairs(npcEntities) do
            local dist = #(coords - vector3(npc.coords.x, npc.coords.y, npc.coords.z))
            if dist < 3.0 then
                DrawText3D(npc.coords.x, npc.coords.y, npc.coords.z + 0.1, '~o~[E]~w~ - Fast travel')
                if IsControlJustReleased(0, 38) then
                    openTravelMenu(npc.destinations)
                end
            end
        end
    end
end)

function openTravelMenu(allowedLabels)
    local options = {}

    for _, dest in ipairs(Config.FastTravel.destinations) do
        for _, label in ipairs(allowedLabels) do
            if dest.label == label then
                table.insert(options, {
                    title = dest.label,
                    description = dest.desc,
                    icon = dest.icon or 'taxi',
                    image = dest.image,
                    onSelect = function()
                        TriggerServerEvent('sonttu-fasttravel:tryTravel', dest.label)
                    end
                })
            end
        end
    end

    lib.registerContext({
        id = 'fast_travel_menu',
        title = 'Fast Travel',
        options = options
    })

    lib.showContext('fast_travel_menu')
end

RegisterNetEvent('sonttu-fasttravel:startTravel', function(coords, heading, taxiSpawn, taxiHeading)
    local ped = PlayerPedId()

    TaskGoStraightToCoord(ped, taxiSpawn.x, taxiSpawn.y, taxiSpawn.z, 1.0, -1, taxiHeading, 0.0)
    Wait(5000)

    DoScreenFadeOut(1000)
    Wait(1500)
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, true)
    SetEntityHeading(ped, heading)
    Wait(500)
    DoScreenFadeIn(1000)

    exports['ox_lib']:notify({
        title = 'Ilmoitus',
        description = 'Olet onnistuneesti saapunut määränpäähäsi!',
        position = 'center-left',
        style = {
            backgroundColor = '#0c1521',
            color = '#f3794c'
        },
        icon = 'check-circle',
        iconColor = '#f3794c'
    })
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end
