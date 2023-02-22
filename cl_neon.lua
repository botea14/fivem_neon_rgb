-- function to generate a random RGB color
function getRandomColor()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return {r, g, b}
end

-- function to turn on car neons and set a random RGB color
function turnOnCarNeons()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsUsing(ped)
    local neonEnabled = IsVehicleNeonLightEnabled(vehicle, 0)

    if not neonEnabled then
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
    end

    local color = getRandomColor()
    SetVehicleNeonLightsColour(vehicle, color[1], color[2], color[3])
    SetVehicleHeadlightsColour(vehicle, color[1], color[2], color[3])
    SetVehicleLights(vehicle, 2) -- turn on the headlights
    TriggerServerEvent("car-neons:updateColor", color)
end

-- register the 'neon' command to turn on car neons and set a random RGB color
RegisterCommand("neon", function()
    turnOnCarNeons()
end)

-- register the 'neon' key mapping to turn on car neons and set a random RGB color when the HOME key is pressed
RegisterKeyMapping("neon", "Turn on car neons", "keyboard", "home")
