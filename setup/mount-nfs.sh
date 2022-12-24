mkdir -p $HOME/nfs/general
sudo mount_nfs -o vers=4 -o bg -P dev-surface3.totto.page:/var/nfs/general $HOME/nfs/general
