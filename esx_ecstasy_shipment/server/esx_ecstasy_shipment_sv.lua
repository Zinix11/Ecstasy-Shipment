local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('esx_estasy_shipment:toofar')
AddEventHandler('esx_estasy_shipment:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Stores[robb].nameofstore)
			TriggerClientEvent('esx_estasy_shipment:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_estasy_shipment:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esx_estasy_shipment:endrob')
AddEventHandler('esx_estasy_shipment:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('end'))
			TriggerClientEvent('esx_estasy_shipment:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_estasy_shipment:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_ended') .. Stores[robb].nameofstore)
	end
end)

RegisterServerEvent('esx_estasy_shipment:rob')
AddEventHandler('esx_estasy_shipment:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Stores[robb] then

		local store = Stores[robb]

		if (os.time() - store.lastrobbed) < 600 and store.lastrobbed ~= 0 then

            TriggerClientEvent('esx_estasy_shipment:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (1800 - (os.time() - store.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end


		if rob == false then

			if(cops >= Config.RequiredCopsRob)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' then
							TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
							TriggerClientEvent('esx_estasy_shipment:setblip', xPlayers[i], Stores[robb].position)
					end
				end

				TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. store.nameofstore .. _U('do_not_move'))
				TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
			    TriggerClientEvent('esx_estasy_shipment:currentlyrobbing', source, robb)
                CancelEvent()
				Stores[robb].lastrobbed = os.time()
			else
				TriggerClientEvent('esx_estasy_shipment:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, _U('min_six_police'))
			end
		else
			TriggerClientEvent('esx_estasy_shipment:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

RegisterServerEvent('esx_estasy_shipment:gioielli1')
AddEventHandler('esx_estasy_shipment:gioielli1', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('ecstasy', math.random(10, 20))
end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true and CopsConnected >= Config.RequiredCopsSell then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local EcstasyQuantity = xPlayer.getInventoryItem('ecstasy').count

			if EcstasyQuantity < 1 then 
				TriggerClientEvent('esx:showNotification', source, _U('notenoughgold'))
			else   
                xPlayer.removeInventoryItem('ecstasy', 1)
                Citizen.Wait(4000)
				xPlayer.addMoney(4000)
				
				Craft(source)
			end
		else
		TriggerClientEvent('esx:showNotification', source, _U('copsforsell'))
		end
	end)
end

RegisterServerEvent('dealer:vendita')
AddEventHandler('dealer:vendita', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('goldsell'))
	Craft(_source)
end)

RegisterServerEvent('dealer:nvendita')
AddEventHandler('dealer:nvendita', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

