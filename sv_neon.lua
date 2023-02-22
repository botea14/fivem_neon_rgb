-- table to store the neon colors for each player's vehicle
local neonColors = {}

-- event handler to receive neon color updates from clients
RegisterNetEvent("car-neons:updateColor")
AddEventHandler("car-neons:updateColor", function(color)
    local source = source
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
    neonColors[vehicle] = color
    TriggerClientEvent("car-neons:updateColor", -1, vehicle, color)
end)

-- function to send current neon colors to a client
function sendNeonColors(playerId)
    for vehicle, color in pairs(neonColors) do
        TriggerClientEvent("car-neons:updateColor", playerId, vehicle, color)
    end
end

-- event handler to send current neon colors to a client when they join the server
AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local playerId = source
    sendNeonColors(playerId)
end)
