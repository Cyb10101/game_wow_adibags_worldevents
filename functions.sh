#!/usr/bin/env bash

getAccessToken() {
  accessToken=$(curl -s -u ${clientId}:${clientSecret} -d grant_type=client_credentials "https://oauth.battle.net/token" | jq -r '.access_token')
  echo "Access Token: ${accessToken}"
}

authentificate() {
  clientId="${1}"
  clientSecret="${2}"
  getAccessToken
}

wowItem() {
  curl -s -H "Authorization: Bearer ${accessToken}" \
    "https://${region}.api.blizzard.com/data/wow/item/${1}?namespace=${namespace}" \
    | jq '{id: .id, name: .name, item_class: .item_class | {id: .id, name: .name}, item_subclass: .item_subclass | {id: .id, name: .name}, inventory_type: .inventory_type}';
}

wowItemPreview() {
  curl -s -H "Authorization: Bearer ${accessToken}" \
    "https://${region}.api.blizzard.com/data/wow/item/${1}?namespace=${namespace}" \
    | jq '.preview_item';
}

# Get achievement categories
wowAchievementCategories() {
  file="/tmp/wowAchievementCategories.json"
  curl -s -H "Authorization: Bearer ${accessToken}" \
    "https://${region}.api.blizzard.com/data/wow/achievement-category/index?namespace=${namespace}" | jq > ${file}
  echo "File: ${file}"
}

wowItemTranslate() {
  for itemId in "$@"; do
    curl -s -H "Authorization: Bearer ${accessToken}" \
      "https://${region}.api.blizzard.com/data/wow/item/${itemId}?namespace=${namespace}&locale=en_GB" \
      | jq --raw-output '"\(.id), -- \(.name)"';
    done
}

wowAchievementCategoryTranslate() {
  echo "Languages: en_GB, de_DE, en_US, es_ES, es_MX, fr_FR, it_IT, ko_KR, pt_BR, ru_RU, zh_CN, zh_TW"
  for categoryId in "$@"; do
    curl -s -H "Authorization: Bearer ${accessToken}" \
      "https://${region}.api.blizzard.com/data/wow/achievement-category/${categoryId}?namespace=${namespace}" \
      | jq --raw-output '"L[\"\(.name.en_GB)\"] = true\nL[\"\(.name.en_GB)\"] = \"\(.name.de_DE)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.en_US)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.es_ES)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.es_MX)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.fr_FR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.it_IT)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.ko_KR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.pt_BR)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.ru_RU)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.zh_CN)\"\nL[\"\(.name.en_GB)\"] = \"\(.name.zh_TW)\""'
  done
}

getKeysByJsonFile() {
  clientId=`jq -r '.battleNet.clientId' ${1}`
  clientSecret=`jq -r '.battleNet.clientSecret' ${1}`
  getAccessToken
}

clientId=""
clientSecret=""
accessToken=""

region="eu"
namespace="static-eu"
