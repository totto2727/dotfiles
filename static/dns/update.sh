export CF_TOKEN=$(cat ~/.dehydrated/cloudflare.token)

cd ~/dehydrated
./dehydrated --config ~/.dehydrated/config -c > /tmp/dehydrated.log 2> /tmp/dehydrated_err.log

rsync -a -v --chmod=D755,F644 --chown=nobody:nogroup ~/.dehydrated/certs /var/nfs/general
