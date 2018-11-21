Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob = 5
Config.RequiredCopsSell = 1

Stores = {
	["Shipment"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(100000,150000),
		nameofstore = "shipment",
		lastrobbed = 0
	}
}