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

menu2:AddButton({
    icon = '👁️',
    label = 'Visual Mods',
    value = menu2_visuals,
    description = 'Change Visual Mods.'
})

-- Visual Mods Menu
local mods_menu1 = MenuV:CreateMenu(false, 'Spoiler Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'spoiler')
local mods_menu2 = MenuV:CreateMenu(false, 'Front Bumper Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'frontbumper')
local mods_menu3 = MenuV:CreateMenu(false, 'Rear Diffuser Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'reardiffuser')
local mods_menu4 = MenuV:CreateMenu(false, 'Skirt', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'skirt')
local mods_menu5 = MenuV:CreateMenu(false, 'Bonnet', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'bonnet')
local mods_menu6 = MenuV:CreateMenu(false, 'Mirrors Menu', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'mirrors')
local mods_menu7 = MenuV:CreateMenu(false, 'Wheel Type', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wheeltype')
local mods_menu8 = MenuV:CreateMenu(false, 'Wheels', ConfigMenu.MenuLocation, MenuColor[1], MenuColor[2], MenuColor[3], ConfigMenu.MenuSize, 'none', 'menuv', 'wheels')

local mods = {
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
        label = 'Bonnet',
        desc = 'Change Vehicle\'s Bonnet',
		id = 7
    },
    [5] = {
        menu = mods_menu6,
        icon = '🔰',
        label = 'Mirrors',
        desc = 'Change Vehicle\'s Mirrors',
		id = 8
    },
    [6] = {
        menu = mods_menu7,
        icon = '🔰',
        label = 'Wheel Type',
        desc = 'Change Vehicle\'s Wheel Type',
		id = 'wheeltype',
        slider = true
    }
}

-- Functions

local function modMenus(menu, icon, label, desc, modid, slider)
    if not slider then
        menu2_visuals:AddButton({
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
        local wheelValues = {}
        if not IsThisModelABike(GetEntityModel(vehicle)) and IsThisModelACar(GetEntityModel(vehicle)) then
            for k, v in pairs(wheelTypes) do
                if k ~= 12 and k ~= 10 and k ~= 6 then
                    wheelValues[#wheelValues+1] = { label = v.name, value = k, description = 'Puting This '..v.name..' Type.' }
                end 
            end
        else
            for k, v in pairs(wheelTypes) do
                if k == 6 then
                    wheelValues[#wheelValues+1] = { label = v.name, value = k, description = 'Puting This '..v.name..' Type.' }
                end 
            end
        end
        local wheelslider = menu2_visuals:AddSlider(
        {
            icon = icon,
            label = label,
            value = menu,
            values = wheelValues
        })
		wheelslider:On('select', function(_, value)
			SetVehicleWheelType(vehicle, value)
		end)
    end
end

-- Mods SubMenu

CreateThread(function()
    menu2_visuals:On('open', function()
		menu2_visuals:ClearItems()
        for i = 0, #mods, 1 do 
            modMenus(mods[i].menu, mods[i].icon, mods[i].label, mods[i].desc, mods[i].id, mods[i].slider)
        end
    end)
end)