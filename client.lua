local QBCore = exports['qb-core']:GetCoreObject()
local MenuColor = {56, 158, 209}

local menu1 = MenuV:CreateMenu(false, 'Customize Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'custom')
menu1:SetPosition(ConfigMenu.MenuLocation)
local menu2 = MenuV:CreateMenu(false, 'Vehicle Mods', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'mods')
local menu3 = MenuV:CreateMenu(false, 'Vehicle Colors', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'colors')
local menu4 = MenuV:CreateMenu(false, 'Vehicle Neon Kits', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'neonkits')
local menu5 = MenuV:CreateMenu(false, 'Vehicle Liveries', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'liveries')
local menu6 = MenuV:CreateMenu(false, 'Vehicle Extras', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'extras')

local function CheckVeh()
	local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then
		QBCore.Functions.Notify('You are not in vehicle.', 'error')
		return false
	else
		return true
	end
end

RegisterNetEvent('qb-customs:client:openMenu', function()
    if not CheckVeh() then return end
    MenuV:OpenMenu(menu1)
end)

menu1:AddButton({
    icon = '🔧',
    label = 'Repair',
    value = 'repair',
    description = 'Repair Vehicle.',
    select = function(btn)
        local selection = btn.Value
        TriggerEvent('qb-mechanicjob:client:fixEverything')
        QBCore.Functions.Notify('Vehicle Has Been Repaired.', 'success')
    end
})
-- Main Menu

menu1:AddButton({
	icon = '⚙️',
    label = 'Vehicle Mods',
    value = menu2,
    description = 'Tune and Customize.',
})

menu1:AddButton({
	icon = '🖌️',
    label = 'Vehicle Colors',
    value = menu3,
    description = 'Tune and Customize.',
})

menu1:AddButton({
	icon = '💡',
    label = 'Vehicle Neon Kits',
    value = menu4,
    description = 'Tune and Customize.',
})

menu1:AddButton({
	icon = '✨',
    label = 'Vehicle Liveries',
    value = menu5,
    description = 'Tune and Customize.',
})

menu1:AddButton({
	icon = '🔰',
    label = 'Vehicle Extras',
    value = menu6,
    description = 'Tune and Customize.',
})

-- Vehicle Mods Menu

local menu2_visuals = MenuV:CreateMenu(false, 'Visuals Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'Visuals')
local menu2_upgrade = MenuV:CreateMenu(false, 'Upgrades Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'Upgrades')

menu2:AddButton({
    icon = '👁️',
    label = 'Visual Mods',
    value = menu2_visuals,
    description = 'Change Visual Mods.'
})

menu2:AddButton({
    icon = '⚙️',
    label = 'Upgrade Mods',
    value = menu2_upgrade,
    description = 'Change Upgrade Mods.'
})

-- Visual Mods Menu
local mods_menu1 = MenuV:CreateMenu(false, 'Spoiler Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'spoiler')
local mods_menu2 = MenuV:CreateMenu(false, 'Front Bumper Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'frontbumper')
local mods_menu3 = MenuV:CreateMenu(false, 'Rear Diffuser Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'reardiffuser')
local mods_menu4 = MenuV:CreateMenu(false, 'Skirt', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'skirt')
local mods_menu5 = MenuV:CreateMenu(false, 'Exhaust', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'exhaust')
local mods_menu6 = MenuV:CreateMenu(false, 'Hood', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'hood')
local mods_menu7 = MenuV:CreateMenu(false, 'Left Fender Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wingl')
local mods_menu8 = MenuV:CreateMenu(false, 'Right Fender Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wingr')
local mods_menu9 = MenuV:CreateMenu(false, 'Roof Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'roof')
local mods_menu10 = MenuV:CreateMenu(false, 'Window Tint Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'tint')
local mods_menu11 = MenuV:CreateMenu(false, 'Wheel Type', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wheeltype')
local mods_menu12 = MenuV:CreateMenu(false, 'Wheels', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wheels')

local visual_mods = {
    [0] = {
        menu = mods_menu1,
        icon = '🔰',
        label = 'Spoiler',
        desc = 'Change Vehicle\'s Spoiler',
		id = 0
    },
    [1] = {
        menu = mods_menu2,
        icon = '🔰',
        label = 'Front Bumper',
        desc = 'Change Vehicle\'s Front Bumper',
		id = 1
    },
    [2] = {
        menu = mods_menu3,
        icon = '🔰',
        label = 'Rear Diffuser',
        desc = 'Change Vehicle\'s Rear Diffuser',
		id = 2
    },
    [3] = {
        menu = mods_menu4,
        icon = '🔰',
        label = 'Skirt',
        desc = 'Change Vehicle\'s Skirt',
		id = 3
    },
    [4] = {
        menu = mods_menu5,
        icon = '🔰',
        label = 'Exhaust',
        desc = 'Change Vehicle\'s Exhaust',
		id = 4
    },
    [5] = {
        menu = mods_menu6,
        icon = '🔰',
        label = 'Hood',
        desc = 'Change Vehicle\'s Hood',
		id = 7
    },
    [6] = {
        menu = mods_menu7,
        icon = '🔰',
        label = 'Left Fender',
        desc = 'Change Vehicle\'s Left Fender',
		id = 8
    },
    [7] = {
        menu = mods_menu8,
        icon = '🔰',
        label = 'Right Fender',
        desc = 'Change Vehicle\'s Right Fender',
		id = 9
    },
    [8] = {
        menu = mods_menu9,
        icon = '🔰',
        label = 'Roof',
        desc = 'Change Vehicle\'s Roof',
		id = 10
    },
    [9] = {
        menu = mods_menu10,
        icon = '🔰',
        label = 'Window Tint',
        desc = 'Change Vehicle\'s Window Tint',
		id = 'windowtint',
        slider = true
    },
    [10] = {
        menu = mods_menu11,
        icon = '🔰',
        label = 'Wheel Type',
        desc = 'Change Vehicle\'s Wheel Type',
		id = 'wheeltype',
        slider = true
    },
    [11] = {
        menu = mods_menu12,
        icon = '🔰',
        label = 'Wheel Model',
        desc = 'Change Vehicle\'s Wheel Model',
		id = 23
    }
}

local umods_menu1 = MenuV:CreateMenu(false, 'Engine Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'engine')
local umods_menu2 = MenuV:CreateMenu(false, 'Brakes Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'brakes')
local umods_menu3 = MenuV:CreateMenu(false, 'Suspension Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'suspension')
local umods_menu4 = MenuV:CreateMenu(false, 'Armor Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'armor')

local upgrade_mods = {
    [0] = {
        menu = umods_menu1,
        icon = '🔧',
        label = 'Current Engine: %d',
        desc = 'Change Vehicle\'s Engine',
		id = 11,
        slider = true
    },
    [1] = {
        menu = umods_menu2,
        icon = '🔧',
        label = 'Current Brakes: %d',
        desc = 'Change Vehicle\'s Brakes',
		id = 12,
        slider = true
    },
    [2] = {
        menu = umods_menu3,
        icon = '🔧',
        label = 'CurrentSuspension: %d',
        desc = 'Change Vehicle\'s Suspension',
		id = 15,
        slider = true
    },
    [3] = {
        menu = umods_menu4,
        icon = '🔧',
        label = 'Current Armor: %d',
        desc = 'Change Vehicle\'s Armor',
		id = 16,
        slider = true
    },
}

-- Functions

local function modMenus(selectedmenu ,menu, icon, label, desc, modid, slider)
    if not slider then
        selectedmenu:AddButton({
            icon = icon,
            label = label,
            value = menu,
            description = desc,
            select = function ()
                if not CheckVeh() then return end
                local ped = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(ped, false)
                SetVehicleModKit(vehicle, 0)
				menu:ClearItems()
                for i = -1, GetNumVehicleMods(vehicle, modid) -1 do
                    local labeltxt = GetLabelText(GetModTextLabel(vehicle, modid, i))
                    if labeltxt == 'NULL' then labeltxt = 'None' end
                    menu:AddButton({
                        icon = '⚙️',
                        label = labeltxt,
                        value = i,
                        description = 'Puting this '..labeltxt,
                        select = function ()
                            TriggerEvent('InteractSound_CL:PlayOnOne', 'airwrench', 0.5)
                        end
                    })
                end
                menu:On('switch', function(item, currentItem, prevItem) 
                    SetVehicleMod(vehicle, modid, currentItem.data.Value)
                
                end)
            end
        })
    else
        if not CheckVeh() then return end
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        SetVehicleModKit(vehicle, 0)
        local sliderValues = {}
        if modid == 'wheeltype' then
            local wheelTypes = {
                [0] = {
                    name = 'Sport'
                },
                [1] = {
                    name = 'Muscle'
                },
                [2] = {
                    name = 'Lowrider'
                },
                [3] = {
                    name = 'SUV'
                },
                [4] = {
                    name = 'Offroad'
                },
                [5] = {
                    name = 'Tuner'
                },
                [6] = {
                    name = 'Bike Wheels'
                },
                [7] = {
                    name = 'High End'
                },
                [8] = {
                    name = 'Benny\'s Original'
                },
                [9] = {
                    name = 'Benny\'s Bespoke'
                },
                [10] = {
                    name = 'Open Wheel'
                },
                [11] = {
                    name = 'Street'
                },
                [12] = {
                    name = 'Track'
                },
            }
            local vehiclewheeltype = wheelTypes[GetVehicleWheelType(vehicle)]
            sliderValues[1] = { label = vehiclewheeltype.name, value = GetVehicleWheelType(vehicle), description = 'Puting This '..vehiclewheeltype.name..' Type.'}
            if not IsThisModelABike(GetEntityModel(vehicle)) and IsThisModelACar(GetEntityModel(vehicle)) then
                for k, v in pairs(wheelTypes) do
                    if k ~= 12 and k ~= 10 and k ~= 6 and k ~= GetVehicleWheelType(vehicle) then
                        sliderValues[#sliderValues+1] = { label = v.name, value = k, description = 'Puting This '..v.name..' Type.' }
                    end 
                end
            else
                for k, v in pairs(wheelTypes) do
                    if k == 6 and k ~= GetVehicleWheelType(vehicle) then
                        sliderValues[#sliderValues+1] = { label = v.name, value = k, description = 'Puting This '..v.name..' Type.' }
                    end 
                end
            end
        elseif modid == 'windowtint' then 
            local windowColors = {
                [0] = { name = 'Stock', no = 1 },
                [1] = { name = 'Pure Black', no = 2 },
                [2] = { name = 'Dark Smoke', no = 3 },
                [3] = { name = 'Light Smoke', no = 4 },
                [5] = { name = 'Limo', no = 5 },
            }
            for k, v in pairs(windowColors) do
                local labeltxt = v.name
                if labeltxt == 'NULL' then labeltxt = 'None' end
                sliderValues[#sliderValues+1] = { label = labeltxt..' ['..v.no..'/5]', value = k, description = 'Puting This '..labeltxt..' Type.' }
            end
        else
            local labeltxt = GetLabelText(GetModTextLabel(vehicle, modid, GetVehicleMod(vehicle, modid)))
            print(GetVehicleMod(vehicle, modid))
            for i = -1, GetNumVehicleMods(vehicle, modid) -1 do
                labeltxt = GetLabelText(GetModTextLabel(vehicle, modid, i))
                if labeltxt == 'NULL' then labeltxt = 'None' end
                sliderValues[#sliderValues+1] = { label = ' ['..(i+1)..'/'..GetNumVehicleMods(vehicle, modid)..']', value = i, description = 'Puting This '..labeltxt..' Type.' }
            end
        end
        
        local slider = selectedmenu:AddSlider(
        {
            icon = icon,
            label = label:format(GetVehicleMod(vehicle, modid)+1),
            value = vehiclewheeltype,
            values = sliderValues,
            select = function(_, newV)
                if modid == 'wheeltype' then
                    SetVehicleWheelType(vehicle, newV)
                elseif modid == 'windowtint' then
                    SetVehicleWindowTint(vehicle, newV)
                else
                    print(newV)
                    SetVehicleMod(vehicle, modid, newV)
                end
            end,
        })
    end
end

-- Mods SubMenu

CreateThread(function()
    menu2_visuals:On('open', function()
		menu2_visuals:ClearItems()
        for i = 0, #visual_mods, 1 do 
            modMenus(menu2_visuals ,visual_mods[i].menu, visual_mods[i].icon, visual_mods[i].label, visual_mods[i].desc, visual_mods[i].id, visual_mods[i].slider)
        end
    end)
    menu2_upgrade:On('open', function ()
        menu2_upgrade:ClearItems()
        for i = 0, #upgrade_mods, 1 do
            modMenus(menu2_upgrade, upgrade_mods[1].menu, upgrade_mods[i].icon, upgrade_mods[i].label, upgrade_mods[i].desc, upgrade_mods[i].id, upgrade_mods[i].slider)
        end
    end)
end)