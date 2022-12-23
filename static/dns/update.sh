export CF_TOKEN=$(cat ~/.dehydrated/cloudflare.token)

cd ~/dehydrated
./dehydrated --config ~/.dehydrated/config -c > /tmp/dehydrated.log 2> /tmp/dehydrated_err.log

rsync -a -v ~/.dehydrated/certs /var/nfs/general && chmod -R "=r,u+w,g+w,+X" /var/nfs/general/certs
