Citizen.CreateThread(function()
	TriggerEvent("esx_status:desactivar")
  while true do
    Citizen.Wait(200)
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local armor = GetPedArmour(ped)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            food = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.val / 10000
        end)


        SendNUIMessage({
			stats = true,
            heal = health,
            armor = armor,
            thirst = thirst,
            food = food,
        });

  end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, true) then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end
end)