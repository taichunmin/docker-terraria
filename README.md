# Docker Compose for Terraria Server 泰拉瑞亞伺服器

```bash
git clone https://github.com/taichunmin/docker-terraria.git
cd docker-terraria
bash ./install.sh # enter sudo password if required
nano serverconfig.txt # change whatever you want!
sudo docker-compose up -d
```

# If you need to attach into docker

```bash
sudo docker-compose ps
sudo docker attach docker-terraria_terraria_1
# "ctrl+p ctrl+q" to leave, do not use "ctrl+c"
```