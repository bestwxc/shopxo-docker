create database if not exists shopxo;
create user 'shopxo'@'%' identified by '123456';
grant all privileges on shopxo.* to 'shopxo'@'%';
flush privileges;