# AdiBags - World Events

Addon for World of Warcraft to filter "World Events" using AdiBags.

* [CurseForge: AdiBags_WorldEvents](https://www.curseforge.com/wow/addons/adibags-world-events)
* [CurseForge: AdiBags](https://www.curseforge.com/wow/addons/adibags)
* [CurseForge: idTip](https://www.curseforge.com/wow/addons/idTip)

## Development

* [API Clients](https://develop.battle.net/access/clients)
* [API Documentation](https://develop.battle.net/documentation/world-of-warcraft/game-data-apis)

### Functions script

Requirements:

```bash
sudo apt install curl jq
```

Authentificate API:

```bash
source functions.sh

# Authentificate by Json file
getKeysByJsonFile ~/Sync/private-notes/storage/api-keys.json

# Authentificate directly
authentificate "{Client id}" "{Client secret}"
```

Translate:

```bash
# Translate: item name (22206, -- Bouquet of Red Roses)
wowItemTranslate 22206 37898 ...

# Translate: Achievement category
wowAchievementCategoryTranslate 155 156 ...
```

Other methods:

```bash
# Get item
wowItem 22206
wowItemPreview 22206

# Get achievement categories
wowAchievementCategories
less /tmp/wowAchievementCategories.json
```

### Deploy

* Update `Interface` id in *.toc file

```bash
git add *.toc
git commit
git tag -f 100002.1
git push && git push --tags
```

* Wait until CurseForge build automatically
