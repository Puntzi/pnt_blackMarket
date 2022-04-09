Config = {}

Config.Locale = 'en'

Config.NPC = {x = 748.68, y = -529.04, z = 27.76, h = 67.28 } -- Coords for NPC (h is for heading)
Config.Model = "s_m_y_dealer_01" -- You can choose the model here: https://docs.fivem.net/docs/game-references/ped-models/
Config.InteractNPC = 2.0 -- Distance to interact with NPC need's to be a float

Config.BlackMarketItems = {
    {name = "Bread", value = "pan", price = 300, isWeapon = false},
    {name = "Pistol", value = "WEAPON_PISTOL", price = 2000, isWeapon = true} -- If u add more remember to put the comma's
}

Config.Account = 'black_money' -- Here you choose with want you want to pay 'money' or 'black_money'

Config.Bullets = 120 -- here how much bullets you want to give with the weapon max 250