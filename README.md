# AdiBags - World Events

Addon for World of Warcraft to filter "World Events" using AdiBags.

* [Curse: AdiBags_WorldEvents](https://www.curseforge.com/wow/addons/adibags-world-events)
* [Curse: AdiBags](https://www.curseforge.com/wow/addons/adibags)
* [Curse: idTip](https://www.curseforge.com/wow/addons/idTip)

## Development

* [API Clients](https://develop.battle.net/access/clients)
* [API Documentation](https://develop.battle.net/documentation/world-of-warcraft/game-data-apis)

Software:

```bash
sudo apt install curl jq
```

Required API Authorization:

```bash
source functions.sh
authentificate "{Your client id}" "{Your client secret}"
```

### Translation

```bash
# Translate: item name (22206, -- Bouquet of Red Roses)
wowItemTranslate 22206 37898 ...

# Translate: Achievement category
wowAchievementCategoryTranslate 155 156 ...
```

### Simple methods

```bash
# Get item
wowItem 22206

# Get achievement categories
wowAchievementCategories
less /tmp/wowAchievementCategories.json
```
