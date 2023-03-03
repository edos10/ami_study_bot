#!/bin/bash

echo "Введите имя пользователя:"
read username
echo "Введите пароль:"
read -s password
response=$(curl -s -u "$username:$password" -X POST https://api.github.com/authorizations \
-d "{\"scopes\":[\"repo\"],\"note\":\"github-messenger\"}")
token=$(echo $response | grep -oP '"token": "\K[^"]+')
echo $token > ~/.github_token
echo "Вы успешно вошли на GitHub! Токен доступа сохранен в ~/.github_token"
