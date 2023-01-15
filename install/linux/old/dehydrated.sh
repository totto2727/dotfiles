if ! test -e ~/dotfiles/static/dns/cloudflare.token; then
  echo not found token
  exit 1
fi

cd
mkdir -p ~/.dehydrated/
ln -s -f ~/dotfiles/static/dns/config ~/.dehydrated/config
ln -s -f ~/dotfiles/static/dns/domains.txt ~/.dehydrated/domains.txt
ln -s -f ~/dotfiles/static/dns/cloudflare.token ~/.dehydrated/cloudflare.token
ln -s -f ~/dotfiles/static/dns/update.sh ~/.dehydrated/update.sh
chmod +x ~/dotfiles/static/dns/update.sh
export CF_TOKEN=$(cat ~/.dehydrated/cloudflare.token)

sudo apt-get install jq publicsuffix
curl -L -o ~/.dehydrated/hook.sh https://raw.githubusercontent.com/socram8888/dehydrated-hook-cloudflare/master/cf-hook.sh
chmod +x ~/.dehydrated/hook.sh

git clone https://github.com/lukas2511/dehydrated.git

cd dehydrated
./dehydrated  --config ~/.dehydrated/config --register --accept-terms
./dehydrated  --config ~/.dehydrated/config -c

echo crontab -e
echo "00 5 * * * ~/.dehydrated/update.sh"
