export CF_TOKEN=$(cat ~/.dehydrated/cloudflare.token)

cd ~/dehydrated
./dehydrated --config ~/.dehydrated/config -c > /tmp/dehydrated.log 2> /tmp/dehydrated_err.log

#docker exec nginx service nginx reload
