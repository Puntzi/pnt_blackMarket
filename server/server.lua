ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterNetEvent('pnt_blackMarket:giveItem')
AddEventHandler('pnt_blackMarket:giveItem', function(itemLabel, itemValue, itemPrice, itemWeapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getAccount(Config.Account).money
    print(money)

    if itemPrice < money then
        if not itemWeapon then
            local canCarryItem = xPlayer.canCarryItem(itemValue, 1)
            if canCarryItem then
                xPlayer.removeAccountMoney(Config.Account, itemPrice)
                xPlayer.addInventoryItem(itemValue, 1)
                xPlayer.showNotification(_U("buyed", itemLabel, itemPrice))
            else
                xPlayer.showNotification(_U("cant_carry_item"))
            end
        else
            local canCarryWeapon = xPlayer.hasWeapon(itemValue)
            if not canCarryWeapon then
                xPlayer.removeAccountMoney(Config.Account, itemPrice)
                xPlayer.addWeapon(itemValue, Config.Bullets)
                xPlayer.showNotification(_U("buyed", itemLabel, itemPrice))
            else
                xPlayer.showNotification(_U("already_has_weapon"))
            end
        end
    else
        xPlayer.showNotification(_U("no_money"))
    end
end)