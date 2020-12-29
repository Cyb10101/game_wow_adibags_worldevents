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

API Authorization:

```bash
clientId="{Your client id}"
clientSecret="{Your client secret}"

realm="eu"
namespace="static-eu"

accessToken=$(curl -s -u ${clientId}:${clientSecret} -d grant_type=client_credentials "https://${realm}.battle.net/oauth/token" | jq -r '.access_token')
```

### Get achievement categories

```bash
curl -s -H "Authorization: Bearer ${accessToken}" \
  "https://${realm}.api.blizzard.com/data/wow/achievement-category/index?namespace=${namespace}" | jq > /tmp/achievementCategories.json
```

### Create translation

Languages: en_GB, de_DE, en_US, es_ES, es_MX, fr_FR, it_IT, ko_KR, pt_BR, ru_RU, zh_CN, zh_TW

#### Translate: item & name

```bash
wowItem() { \
  curl -s -H "Authorization: Bearer ${accessToken}" \
    "https://${realm}.api.blizzard.com/data/wow/item/${1}?namespace=${namespace}&locale=en_GB" \
    | jq --raw-output '"\(.id), -- \(.name)"'; \
}

wowItem 22206 > /tmp/wowItem.txt
wowItem 44731 >> /tmp/wowItem.txt
wowItem 49715 >> /tmp/wowItem.txt
cat /tmp/wowItem.txt
```

Result:

```text
22206, -- Bouquet of Red Roses
44731, -- Bouquet of Ebon Roses
49715, -- Forever-Lovely Rose
```

#### Translate: Achievement category

```bash
achievementCategory() { \
  curl -s -H "Authorization: Bearer ${accessToken}" \
    "https://${realm}.api.blizzard.com/data/wow/achievement-category/${1}?namespace=${namespace}" \
    | jq --raw-output '"L[\"\(.name.en_GB)\"] = true\nL[\"\(.name.en_GB)\"] = \"\(.name.de_DE)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.en_US)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.es_ES)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.es_MX)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.fr_FR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.it_IT)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.ko_KR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.pt_BR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.ru_RU)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.zh_CN)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.zh_TW)\""'
}

achievementCategory 156
```
