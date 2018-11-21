local holdingup = false
local store = ""
local blipRobbery = nil

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_estasy_shipment:currentlyrobbing')
AddEventHandler('esx_estasy_shipment:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

RegisterNetEvent('esx_estasy_shipment:killblip')
AddEventHandler('esx_estasy_shipment:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_estasy_shipment:setblip')
AddEventHandler('esx_estasy_shipment:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_estasy_shipment:toofarlocal')
AddEventHandler('esx_estasy_shipment:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	incircle = false
end)


RegisterNetEvent('esx_estasy_shipment:robberycomplete')
AddEventHandler('esx_estasy_shipment:robberycomplete', function(robb)
	holdingup = false

		TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
	    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	    end
	    end)
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 439)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)


incircle = false

hasrobbed = false
hasrobbed2 = false
hasrobbed3 = false
hasrobbed4 = false
hasrobbed5 = false
hasrobbed6 = false
hasrobbed7 = false
hasrobbed8 = false
hasrobbed9 = false


function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob'))
						end
						incircle = true
						if sControlJustReleased(0, Keys['E'] then

							gioielli1 = AddBlipForCoord(37.382, -2727.888, 2.138)
							SetBlipSprite(gioielli1,1)
							SetBlipColour(gioielli1,16742399)
							SetBlipScale(gioielli1,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli1)

							gioielli2 = AddBlipForCoord(34.411, -2727.888, 2.138)
							SetBlipSprite(gioielli2,1)
							SetBlipColour(gioielli2,16742399)
							SetBlipScale(gioielli2,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli2)

							gioielli3 = AddBlipForCoord(31.823, -2727.888, 2.138)
							SetBlipSprite(gioielli3,1)
							SetBlipColour(gioielli3,16742399)
							SetBlipScale(gioielli3,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli3)

							gioielli4 = AddBlipForCoord(37.382, -2734.888, 2.138)
							SetBlipSprite(gioielli4,1)
							SetBlipColour(gioielli4,16742399)
							SetBlipScale(gioielli4,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli4)


							gioielli5 = AddBlipForCoord(34.411, -2734.888, 2.138)
							SetBlipSprite(gioielli5,1)
							SetBlipColour(gioielli5,16742399)
							SetBlipScale(gioielli5,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli5)

							gioielli6 = AddBlipForCoord(37.382, -2734.888, 2.138)
							SetBlipSprite(gioielli6,1)
							SetBlipColour(gioielli6,16742399)
							SetBlipScale(gioielli6,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli6)

							gioielli7 = AddBlipForCoord(37.382, -2738.888, 2.138)
							SetBlipSprite(gioielli7,1)
							SetBlipColour(gioielli7,16742399)
							SetBlipScale(gioielli7,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli7)

							gioielli8 = AddBlipForCoord(34.411, -2738.888, 2.138)
							SetBlipSprite(gioielli8,1)
							SetBlipColour(gioielli8,16742399)
							SetBlipScale(gioielli8,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli8)

							gioielli9 = AddBlipForCoord(31.823, -2738.888, 2.138)
							SetBlipSprite(gioielli9,1)
							SetBlipColour(gioielli9,16742399)
							SetBlipScale(gioielli9,0.5)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(_U('esctasyblipmap'))
							EndTextCommandSetBlipName(gioielli9)
							
							TriggerServerEvent('esx_estasy_shipment:rob', k)
                        end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 37.382, -2727.888, 2.138, true) < 0.5 ) then
								if (hasrobbed == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli1)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 34.411, -2727.888, 2.138, true) < 0.5 ) then
								if (hasrobbed2 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli2)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed2 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 31.823, -2727.888, 2.138, true) < 0.5 ) then
								if (hasrobbed3 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli3)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed3 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 37.382, -2734.888, 2.138, true) < 0.5 ) then
								if (hasrobbed4 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli4)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed4 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 34.411, -2734.888, 2.138, true) < 0.5 ) then
								if (hasrobbed5 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli5)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed5 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 37.382, -2734.888, 2.138, true) < 0.5 ) then
								if (hasrobbed6 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli6)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed6 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 37.382, -2738.888, 2.138, true) < 0.5 ) then
								if (hasrobbed7 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli7)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed7 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 34.411, -2738.888, 2.138, true) < 0.5 ) then
								if (hasrobbed8 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli8)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed8 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 31.823, -2738.888, 2.138, true) < 0.5 ) then
							if (hasrobbed9 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli9)
								TriggerServerEvent('esx_estasy_shipment:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed9 = true
							end
							end
							end


							if (hasrobbed == true) and (hasrobbed2 == true) and (hasrobbed3 == true) and (hasrobbed4 == true) and (hasrobbed5 == true) and (hasrobbed6 == true) and (hasrobbed7 == true) and (hasrobbed8 == true) and (hasrobbed9 == true) then
							holdingup = false
							
							hasrobbed = false
                            hasrobbed2 = false
                            hasrobbed3 = false
                            hasrobbed4 = false
                            hasrobbed5 = false
                            hasrobbed6 = false
                            hasrobbed7 = false
                            hasrobbed8 = false
                            hasrobbed9 = false
							TriggerServerEvent('esx_estasy_shipment:endrob', store)
							ESX.ShowNotification(_U('dealer'))
							TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                        end)
							end	

			local pos2 = Stores[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 32.89, -2690.678, 6.008, true) > 50 ) then
				TriggerServerEvent('esx_estasy_shipment:toofar', store)
				holdingup = false
				RemoveBlip(gioielli1)
				RemoveBlip(gioielli2)
				RemoveBlip(gioielli3)
				RemoveBlip(gioielli4)
				RemoveBlip(gioielli5)
				RemoveBlip(gioielli6)
				RemoveBlip(gioielli7)
				RemoveBlip(gioielli8)
				RemoveBlip(gioielli9)

				
				hasrobbed = false
                hasrobbed2 = false
                hasrobbed3 = false
                hasrobbed4 = false
                hasrobbed5 = false
                hasrobbed6 = false
                hasrobbed7 = false
                hasrobbed8 = false
                hasrobbed9 = false
			end
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_estasy_shipment:togliblip')
AddEventHandler('esx_estasy_shipment:togliblip', function(robb)
	RemoveBlip(gioielli1)
	RemoveBlip(gioielli2)
	RemoveBlip(gioielli3)
	RemoveBlip(gioielli4)
	RemoveBlip(gioielli5)
	RemoveBlip(gioielli6)
	RemoveBlip(gioielli7)
	RemoveBlip(gioielli8)
	RemoveBlip(gioielli9)
end)

RegisterNetEvent("dealer:createBlip")
AddEventHandler("dealer:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 77)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Dealer")
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
		TriggerEvent('dealer:createBlip', 77, -1194.942, -222.296, 37.947)

    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		
		if pos then
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 706.669, -966.898, 30.413, true) <= 5 then
					TriggerServerEvent('dealer:vendita')
                    Citizen.Wait(4000)
                    TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                end)
				end	
		end
    end
end)

