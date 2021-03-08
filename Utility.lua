local addonName, addonTable = ...

local color = {
	red = "|c00ff0000",
	green = "|c005ac18e",
	blue = "|c004ca3dd",
	yellow = "|c00e9d700",
	reset = "|r",
}
addonTable.color = color

local function dump(variable, title)
	print(color.green .. "*" .. color.reset .. color.red, title, color.reset .. "=" .. color.blue, variable, color.reset)
end
addonTable.dump = dump

-- Dump object
-- dumpTable(slotData, "slotData")
-- dumpTable(slotData, "slotData", {itemId = true, itemId = true, class = true, subclass = true, name = true})
local function dumpTable(variable, title, include)
	if (title == nil or title == "") then
		title = "Undefined Variable"
	end
	print(color.yellow .. "[" .. title .. "]" .. color.reset)
	table.foreach(variable, function(key, value)
		if (include == nil or include[key] ~= nil) then
			print(color.green .. "->" .. color.reset .. color.red, key, color.reset .. "=" .. color.blue, value, color.reset)
		end
	end)
end
addonTable.dumpTable = dumpTable

local function dumpTooltip(tooltip, slotData, id)
	if (slotData.itemId == id) then
			dumpTable({
				text1 = tooltip.leftside[1]:GetText(),
				text2 = tooltip.leftside[2]:GetText(),
				text3 = tooltip.leftside[3]:GetText(),
				text4 = tooltip.leftside[4]:GetText(),
				text5 = tooltip.leftside[5]:GetText(),
				text6 = tooltip.leftside[6]:GetText(),
				text7 = tooltip.leftside[7]:GetText(),
				text8 = tooltip.leftside[8]:GetText(),
				text9 = tooltip.leftside[9]:GetText(),
			}, "Tooltip: " .. slotData.itemId)
	end
end
addonTable.dumpTooltip = dumpTooltip

local function tocVersionDeprecated(oldTocVersion)
	-- /run print((select(4, GetBuildInfo())))
	local version, build, date, tocVersion = GetBuildInfo()
	if (tocVersion > oldTocVersion) then
		dumpTable({version = version, build = build, date = date, tocVersion = tocVersion}, "TOC Version is old")
	end
end
addonTable.tocVersionDeprecated = tocVersionDeprecated
