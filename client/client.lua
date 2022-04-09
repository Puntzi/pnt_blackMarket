ESX = nil

CreateThread(function()
    while ESX == nil do
       TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
       Wait(0)
    end
end)

CreateThread(function()
    model = GetHashKey(Config.Model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    CreateDealer() 
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local distance = #(pedCoords - vector3(Config.NPC.x, Config.NPC.y, Config.NPC.z))
        local sleep = 500
        if distance < Config.InteractNPC then
            sleep = 0
            ESX.ShowFloatingHelpNotification(_U("interact"), vector3(Config.NPC.x, Config.NPC.y, Config.NPC.z + 1))
            if IsControlJustPressed(0, 38) then
                OpenBlackMarket()
            end
        end
        Wait(sleep)
    end
end)

function OpenBlackMarket()
    ESX.UI.Menu.CloseAll()
    
    elements = {}

    for k, v in pairs(Config.BlackMarketItems) do
        table.insert(elements, {label = _U('buy', v.name, v.price), name = v.name, value = v.value, price = v.price, isWeapon = v.isWeapon})
    end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'BlackMarket', {
		title    =  _U('market_name'),
		align    =  'bottom-right',
		elements =  elements
	}, function(data, menu)
        local data = data.current
        TriggerServerEvent('pnt_blackMarket:giveItem', data.name, data.value, data.price, data.isWeapon)
    end, function(data, menu)  
        menu.close()
	end)
end

function CreateDealer()
    ped = CreatePed(0, model , Config.NPC.x,Config.NPC.y,Config.NPC.z - 1, Config.NPC.h, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end