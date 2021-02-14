-- Shared addon data
local addonName, addonTable = ...
local L = addonTable.L

local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
local Tooltip

local configuration = {
	tooltipScanning = false, -- Tooltip scanning (This is a bad idea)
}

local filterDatabase = {
	worldEventWinterVeil = {
		items = {
			17202, -- Snowball
			21213, -- Preserved Holly
			21328, -- Wand of Holiday Cheer
			21524, -- Red Winter Hat
			21525, -- Green Winter Hat
			34085, -- Red Winter Clothes
			34087, -- Green Winter Clothes
			70923, -- Gaudy Winter Veil Sweater
			128768, -- Candy Cane
			139299, -- Finely-Tailored Red Holiday Hat
			174865, -- A Tiny Winter Hat
			21325, -- Mechanical Greench
		},
	},
	worldEventHallowsEnd = {
		items = {
			33292, -- Hallowed Helm
			34068, -- Weighted Jack-o'-Lantern
		},
	},
	worldEventNoblegarden = {
		items = {
			44800, -- Spring Robes
			44803, -- Spring Circlet
			45067, -- Egg Basket
			45073, -- Spring Flowers
		},
	},
	worldEventLunarFestival = {
		items = {
			21536, -- Elune Stone
			21711, -- Lunar Festival Invitation
		},
	},
	worldEventMidsummer = {
		items = {
			23323, -- Crown of the Fire Festival
			23324, -- Mantle of the Fire Festival
			34683, -- Sandals of Summer
			34685, -- Vestment of Summer
		},
	},
	worldEventBrewfest = {
		items = {
			33016, -- Blue Brewfest Stein
			33455, -- Brewfest Prize Ticket
			33862, -- Brewfest Regalia
			33868, -- Brewfest Boots
			33969, -- Purple Brewfest Hat
			37897, -- Filled Green Brewfest Stein
			38626, -- Empty Brew Bottle
			37898, -- Wild Winter Pilsner
		},
	},
	worldEventChildrensWeek = {
		items = {
		},
	},
	worldEventLoveIsInTheAir = {
		items = {
			21813, -- Bag of Heart Candies
			22200, -- Silver Shafted Arrow
			22206, -- Bouquet of Red Roses
			22236, -- Buttermilk Delight
			22237, -- Dark Desire
			22238, -- Very Berry Cream
			22239, -- Sweet Surprise
			34258, -- Love Rocket
			44731, -- Bouquet of Ebon Roses
			49655, -- Lovely Charm
			49661, -- Lovely Charm Collector's Kit
			49669, -- Crown Cologne Sprayer
			49670, -- Crown Chocolate Sampler
			49715, -- Forever-Lovely Rose
			49856, -- "VICTORY" Perfume
			49857, -- "Enchantress" Perfume
			49858, -- "Forever" Perfume
			49859, -- "Bravado" Cologne
			49860, -- "Wizardry" Cologne
			49861, -- "STALWART" Cologne
			49916, -- Lovely Charm Bracelet
			49927, -- Love Token
			49936, -- Lovely Stormwind Card
			49937, -- Lovely Undercity Card
			49938, -- Lovely Darnassus Card
			49939, -- Lovely Orgrimmar Card
			49940, -- Lovely Ironforge Card
			49941, -- Lovely Thunder Bluff Card
			49942, -- Lovely Exodar Card
			49943, -- Lovely Silvermoon City Card
		},
	},
	worldEventPilgrimsBounty = {
		items = {
			44785, -- Pilgrim's Dress
			44788, -- Pilgrim's Boots
			46723, -- Pilgrim's Hat
			46800, -- Pilgrim's Attire
			46824, -- Pilgrim's Robe
		},
	},
	worldEventDarkmoonFaire = {
		items = {
			71083, -- Darkmoon Game Token
			81055, -- Darkmoon Ride Ticket
			92958, -- Darkmoon "Nightsaber"
			92959, -- Darkmoon "Cougar"
			92966, -- Darkmoon "Dragon"
			92967, -- Darkmoon "Gryphon"
			92968, -- Darkmoon "Murloc"
			92969, -- Darkmoon "Rocket"
			92970, -- Darkmoon "Wyvern"
			151256, -- Purple Dance Stick
			151257, -- Green Dance Stick
			171364, -- Darkmoon Top Hat
		},
	},
	worldEventBrawlersGuild = {
		items = {
		},
	},
}

local options = {
	worldEventWinterVeil = {
		name = L["Winter Veil"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Winter Veil"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventHallowsEnd = {
		name = L["Hallow's End"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Hallow's End"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventNoblegarden = {
		name = L["Noblegarden"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Noblegarden"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventLunarFestival = {
		name = L["Lunar Festival"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Lunar Festival"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventMidsummer = {
		name = L["Midsummer"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Midsummer"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventBrewfest = {
		name = L["Brewfest"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Brewfest"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventChildrensWeek = {
		name = L["Children's Week"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Children's Week"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventLoveIsInTheAir = {
		name = L["Love is in the Air"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Love is in the Air"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventPilgrimsBounty = {
		name = L["Pilgrim's Bounty"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Pilgrim's Bounty"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventDarkmoonFaire = {
		name = L["Darkmoon Faire"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Darkmoon Faire"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
	worldEventBrawlersGuild = {
		name = L["Brawler's Guild"],
		desc = L["Enable"] .. " " .. L["World Events"] .. ": " .. L["Brawler's Guild"],
		type = "toggle",
		-- width = 'double',
		order = 20,
	},
}

local function initialize()
	-- Convert filterDatabase (item|class|tooltip) [id => true]
	table.foreach(options, function(optionKey, optionData)
		if (filterDatabase[optionKey] ~= nil) then
			for filterKey, _ in pairs(filterDatabase[optionKey]) do
				if (filterDatabase[optionKey][filterKey] ~= nil) then
					local tmpTable = {}
					for _, id in ipairs(filterDatabase[optionKey][filterKey]) do
						tmpTable[id] = true
					end
					filterDatabase[optionKey][filterKey] = tmpTable
				end
			end
		end
	end)
end
initialize()

local function Tooltip_Init()
	local tip = CreateFrame("GameTooltip")
	local leftside = {};
	for i = 1, 9 do
		local Left, Right = tip:CreateFontString(), tip:CreateFontString()
		Left:SetFontObject(GameFontNormal)
		Right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(Left, Right)
		leftside[i] = Left
	end
	tip.leftside = leftside
	return tip
end

local AdiBagsFilter = AdiBags:RegisterFilter("WorldEvents", 98, "ABEvent-1.0")
AdiBagsFilter.uiName = L["World Events"]
AdiBagsFilter.uiDesc = L["World Events"] .. " " .. L["Filter"]

function AdiBagsFilter:OnInitialize()
	local profileEnabled = {}
	table.foreach(options, function(optionKey, optionData)
		if (optionData.type == "toggle") then
			profileEnabled[optionKey] = true
		elseif (optionData.type == "multiselect") then
			profileEnabled[optionKey] = {true}
		end
	end)

	self.db = AdiBags.db:RegisterNamespace("WorldEvents", {
		profile = profileEnabled,
	})
end

function AdiBagsFilter:Update()
	self:SendMessage("AdiBags_FiltersChanged")
end

function AdiBagsFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function AdiBagsFilter:OnDisable()
	AdiBags:UpdateFilters()
end

local function unescape(String)
	local Result = tostring(String)
	Result = gsub(Result, "|c........", "") -- Remove color start.
	Result = gsub(Result, "|r", "") -- Remove color end.
	Result = gsub(Result, "|H.-|h(.-)|h", "%1") -- Remove links.
	Result = gsub(Result, "|T.-|t", "") -- Remove textures.
	Result = gsub(Result, "{.-}", "") -- Remove raid target icons.
	return Result
end

function AdiBagsFilter:Filter(slotData)
	-- Find filter category by itemId
	local findCategoryByItemId = table.foreach(options, function(optionKey, optionData)
		if (self.db.profile[optionKey] and optionData.type == "toggle" and filterDatabase[optionKey].items ~= nil and filterDatabase[optionKey].items[slotData.itemId]) then
			return optionData.name
		end
	end)
	if (findCategoryByItemId ~= nil) then
		return findCategoryByItemId
	end

	-- Find filter by class or subclass
	local findCategoryByClass = table.foreach(options, function(optionKey, optionData)
		if (self.db.profile[optionKey] and optionData.type == "toggle") then
			if ((filterDatabase[optionKey].class ~= nil and filterDatabase[optionKey].class[slotData.class]) or (filterDatabase[optionKey].subclass ~= nil and filterDatabase[optionKey].subclass[slotData.subclass])) then
				return optionData.name
			end
		end
	end)
	if (findCategoryByClass ~= nil) then
		return findCategoryByClass
	end

	if (configuration.tooltipScanning) then
		-- Find filter by tooltip
		-- Note: This is a bad idea, but it works
		Tooltip = Tooltip or Tooltip_Init()
		Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
		Tooltip:ClearLines()

		if slotData.bag == BANK_CONTAINER then
			Tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
		else
			Tooltip:SetBagItem(slotData.bag, slotData.slot)
		end

		local tooltipText = {
			unescape(Tooltip.leftside[1]:GetText()),
			unescape(Tooltip.leftside[2]:GetText()),
			unescape(Tooltip.leftside[3]:GetText()),
			unescape(Tooltip.leftside[4]:GetText()),
			unescape(Tooltip.leftside[5]:GetText()),
			unescape(Tooltip.leftside[6]:GetText()),
			unescape(Tooltip.leftside[7]:GetText()),
			unescape(Tooltip.leftside[8]:GetText()),
			unescape(Tooltip.leftside[9]:GetText()),
		}

		-- Find filter category by tooltip
		local findCategoryByTooltip = table.foreach(options, function(optionKey, optionData)
			if (self.db.profile[optionKey] and optionData.type == "toggle") then

				-- Find filter category by explizit tooltip
				for i = 1,9 do
					local tooltipKey = "tooltip" .. i
					if (filterDatabase[optionKey][tooltipKey] ~= nil and filterDatabase[optionKey][tooltipKey][tooltipText[i]]) then
						return optionData.name
					end
				end

				-- Find filter category by all tooltips
				for i = 1,9 do
					if (filterDatabase[optionKey].tooltip ~= nil and filterDatabase[optionKey].tooltip[tooltipText[i]]) then
						return optionData.name
					end
				end

			end
		end)
		if (findCategoryByTooltip ~= nil) then
			return (isDevelopment and color.red or "") .. findCategoryByTooltip .. (isDevelopment and color.reset or "")
		end

		Tooltip:Hide()
	end
end

function AdiBagsFilter:GetOptions()
	return options, AdiBags:GetOptionHandler(self, false, function()
		return self:Update()
	end)
end
