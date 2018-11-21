Config = {}
Config.Locale = 'en'

Config.GiveBlackMoney = true -- give black money, if disabled it will give cash instead 

Config.RequiredCopsRob = 5
Config.RequiredCopsSell = 1

Stores = {
	["Shipment"] = {
		position = { ['x'] = 32.89, ['y'] = -2690.678, ['z'] = 6.008 },       
		reward = math.random(100000,150000),
		nameofstore = "shipment",
		lastrobbed = 0
	}
}
