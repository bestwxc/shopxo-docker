# shopxo-docker

## 用法
1. 安装docker和docker compose(低版本docker需要下载额外二进制程序，高版本安装docker-compose-plugin)
2. 进入该READMD.md 目录
3. sudo docker compose up -d
4. sudo docker exec -it shopxo-docker-shopxo-db-1 /bin/bash
5. mysql -uroot -p123456 （假设123456为默认的root密码）
6. 创建数据库用户等，参考(已经迁移到./conf/init-db/init-shopxo.sql, 请根据实际情况调整)
```mysql
create database if not exists shopxo;
create user 'shopxo'@'%' identified by '123456';
grant all privileges on shopxo.* to 'shopxo'@'%';
flush privileges;
```
7. 访问IP:PORT，默认为80端口
8. 按照提示，到配置数据库页面，其中
   - 数据库服务器： shopxo-db
   - 数据库端口: 3306
   - 数据库名: shopxo，与前面创建一致
   - 数据库用户名，shopxo，与前面创建一致，不建议用root
   - 数据库密码：123456，与前面一致，建议改掉
9. 点击安装 等待安装完成
10. 按照提示完成设置
11. 当配置完毕后，进入php容器 sudo docker exec -it shopxo-docker-shopxo-php-1 /bin/bash
12. 按照提示删除install目录 rm -rf /var/www/shopxo/app/install

## 构建镜像的命令
```bash
## 常规构建
sudo docker build shopxo-image \
  --build-arg SHOPXO_VER=2.3.2 \
  -t wxc252/shopxo:2.3.2 \
  --push
##  构建多平台镜像
sudo docker buildx create --name mybuilder --use
sudo docker buildx build shopxo-image \
  --platform linux/386,linux/amd64,linux/arm/v5,linux/arm/v7,linux/arm64/v8,linux/mips64le,linux/ppc64le,linux/s390x \
  --build-arg SHOPXO_VER=2.3.2 \
  -t wxc252/shopxo:2.3.2 \
  --push
```



