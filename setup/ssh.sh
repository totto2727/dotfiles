cd || exit
git clone git@github.com:totto2727/ssh_config.git || exit
mv ~/ssh_config/* ~/.ssh/
mv ~/ssh_config/.git ~/.ssh/
mv ~/ssh_config/.gitignore ~/.ssh/
rm -r -f ~/ssh_config
