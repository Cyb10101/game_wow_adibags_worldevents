local addonName, addonTable = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addonTable.L = L

local locale = GetLocale()

-- Default: en_GB
-- https://eu.api.blizzard.com/data/wow/achievement-category/{id}?namespace=static-eu
L["World Events"] = true -- id: 155
L["Winter Veil"] = true -- id: 156
L["Hallow's End"] = true -- id: 158
L["Noblegarden"] = true -- id: 159
L["Lunar Festival"] = true -- id: 160
L["Midsummer"] = true -- id: 161
L["Brewfest"] = true -- id: 162
L["Children's Week"] = true -- id: 163
L["Love is in the Air"] = true -- id: 187
L["Pilgrim's Bounty"] = true -- id: 14981
L["Darkmoon Faire"] = true -- id: 15101
L["Brawler's Guild"] = true -- id: 15282

if locale == "deDE" then
	L["World Events"] = "Weltereignisse"
	L["Winter Veil"] = "Winterhauch"
	L["Hallow's End"] = "Schlotternächte"
	L["Noblegarden"] = "Nobelgarten"
	L["Lunar Festival"] = "Mondfest"
	L["Midsummer"] = "Sonnenwende"
	L["Brewfest"] = "Braufest"
	L["Children's Week"] = "Kinderwoche"
	L["Love is in the Air"] = "Liebe liegt in der Luft"
	L["Pilgrim's Bounty"] = "Die Pilgerfreuden"
	L["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt"
	L["Brawler's Guild"] = "Kampfgilde"
elseif locale == "enUS" then
	L["World Events"] = "World Events"
	L["Winter Veil"] = "Winter Veil"
	L["Hallow's End"] = "Hallow's End"
	L["Noblegarden"] = "Noblegarden"
	L["Lunar Festival"] = "Lunar Festival"
	L["Midsummer"] = "Midsummer"
	L["Brewfest"] = "Brewfest"
	L["Children's Week"] = "Children's Week"
	L["Love is in the Air"] = "Love is in the Air"
	L["Pilgrim's Bounty"] = "Pilgrim's Bounty"
	L["Darkmoon Faire"] = "Darkmoon Faire"
	L["Brawler's Guild"] = "Brawler's Guild"
elseif locale == "esES" then
	L["World Events"] = "Eventos del mundo"
	L["Winter Veil"] = "Festival de Invierno"
	L["Hallow's End"] = "Halloween"
	L["Noblegarden"] = "Jardín Noble"
	L["Lunar Festival"] = "Festival Lunar"
	L["Midsummer"] = "Solsticio"
	L["Brewfest"] = "Fiesta de la Cerveza"
	L["Children's Week"] = "Los Niños"
	L["Love is in the Air"] = "Amor en el aire"
	L["Pilgrim's Bounty"] = "Generosidad"
	L["Darkmoon Faire"] = "Feria de la Luna Negra"
	L["Brawler's Guild"] = "Hermandad de camorristas"
elseif locale == "esMX" then
	L["World Events"] = "Eventos del mundo"
	L["Winter Veil"] = "Festival de Invierno"
	L["Hallow's End"] = "Halloween"
	L["Noblegarden"] = "Jardín Noble"
	L["Lunar Festival"] = "Festival Lunar"
	L["Midsummer"] = "Solsticio"
	L["Brewfest"] = "Fiesta de la Cerveza"
	L["Children's Week"] = "Los Niños"
	L["Love is in the Air"] = "Amor en el aire"
	L["Pilgrim's Bounty"] = "Generosidad"
	L["Darkmoon Faire"] = "Feria de la Luna Negra"
	L["Brawler's Guild"] = "Gremio de luchadores"
elseif locale == "frFR" then
	L["World Events"] = "Évènements mondiaux"
	L["Winter Veil"] = "Voile d'hiver"
	L["Hallow's End"] = "Sanssaint"
	L["Noblegarden"] = "Jardin des nobles"
	L["Lunar Festival"] = "Fête lunaire"
	L["Midsummer"] = "Solstice d'été"
	L["Brewfest"] = "Fête des Brasseurs"
	L["Children's Week"] = "Semaine des enfants"
	L["Love is in the Air"] = "De l'amour dans l'air"
	L["Pilgrim's Bounty"] = "Bienfaits du pèlerin"
	L["Darkmoon Faire"] = "Foire de Sombrelune"
	L["Brawler's Guild"] = "Les Bastonneurs"
elseif locale == "itIT" then
	L["World Events"] = "Eventi mondiali"
	L["Winter Veil"] = "Grande Inverno"
	L["Hallow's End"] = "Veglia delle Ombre"
	L["Noblegarden"] = "Festa di Nobiluova"
	L["Lunar Festival"] = "Celebrazione della Luna"
	L["Midsummer"] = "Mezza Estate"
	L["Brewfest"] = "Festa della Birra"
	L["Children's Week"] = "Settimana dei Bambini"
	L["Love is in the Air"] = "Amore nell'Aria"
	L["Pilgrim's Bounty"] = "Ringraziamento"
	L["Darkmoon Faire"] = "Fiera di Lunacupa"
	L["Brawler's Guild"] = "Circolo dei Combattenti"
elseif locale == "koKR" then
	L["World Events"] = "이벤트"
	L["Winter Veil"] = "겨울맞이 축제"
	L["Hallow's End"] = "할로윈 축제"
	L["Noblegarden"] = "귀족의 정원"
	L["Lunar Festival"] = "달의 축제"
	L["Midsummer"] = "한여름 축제"
	L["Brewfest"] = "가을 축제"
	L["Children's Week"] = "어린이 주간"
	L["Love is in the Air"] = "온누리에 사랑을"
	L["Pilgrim's Bounty"] = "순례자의 감사절"
	L["Darkmoon Faire"] = "다크문 축제"
	L["Brawler's Guild"] = "싸움꾼 조합"
elseif locale == "ptBR" then
	L["World Events"] = "Eventos Mundiais"
	L["Winter Veil"] = "Véu de Inverno"
	L["Hallow's End"] = "Noturnália"
	L["Noblegarden"] = "Jardinova"
	L["Lunar Festival"] = "Festival da Lua"
	L["Midsummer"] = "Solstício"
	L["Brewfest"] = "CervaFest"
	L["Children's Week"] = "A Semana das Crianças"
	L["Love is in the Air"] = "O Amor Está no Ar"
	L["Pilgrim's Bounty"] = "Festa da Fartura"
	L["Darkmoon Faire"] = "Feira de Negraluna"
	L["Brawler's Guild"] = "Guilda dos Brigões"
elseif locale == "ruRU" then
	L["World Events"] = "Игровые события"
	L["Winter Veil"] = "Зимний Покров"
	L["Hallow's End"] = "Тыквовин"
	L["Noblegarden"] = "Сад чудес"
	L["Lunar Festival"] = "Лунный фестиваль"
	L["Midsummer"] = "Огненный солнцеворот"
	L["Brewfest"] = "Хмельной фестиваль"
	L["Children's Week"] = "Детская неделя"
	L["Love is in the Air"] = "Любовная лихорадка"
	L["Pilgrim's Bounty"] = "Пиршество странников"
	L["Darkmoon Faire"] = "Ярмарка Новолуния"
	L["Brawler's Guild"] = "Бойцовская гильдия"
elseif locale == "zhCN" then
	L["World Events"] = "世界事件"
	L["Winter Veil"] = "冬幕节"
	L["Hallow's End"] = "万圣节"
	L["Noblegarden"] = "复活节"
	L["Lunar Festival"] = "春节"
	L["Midsummer"] = "仲夏节"
	L["Brewfest"] = "美酒节"
	L["Children's Week"] = "儿童周"
	L["Love is in the Air"] = "情人节"
	L["Pilgrim's Bounty"] = "感恩节"
	L["Darkmoon Faire"] = "暗月马戏团"
	L["Brawler's Guild"] = "搏击俱乐部"
elseif locale == "zhTW" then
	L["World Events"] = "世界事件"
	L["Winter Veil"] = "冬幕節"
	L["Hallow's End"] = "萬鬼節"
	L["Noblegarden"] = "貴族花園"
	L["Lunar Festival"] = "新年節慶"
	L["Midsummer"] = "仲夏節"
	L["Brewfest"] = "啤酒節"
	L["Children's Week"] = "兒童週"
	L["Love is in the Air"] = "愛就在身邊"
	L["Pilgrim's Bounty"] = "旅人豐年祭"
	L["Darkmoon Faire"] = "暗月馬戲團"
	L["Brawler's Guild"] = "鬥陣俱樂部"
end

-- Localize true values with key name
for key, value in pairs(L) do
	if value == true then
		L[key] = key
	end
end
