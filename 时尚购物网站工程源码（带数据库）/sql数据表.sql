drop database testdb5; --删除testdb3
go
create database testdb5;--创建testdb3
go
use testdb5;--使用testdb3
go

--普通用户的表
create table users(
userid bigint primary key identity,
username varchar(30) not null unique,--用户名
truename varchar(30) not null,--真实姓名
passwd varchar(30) not null,--密码
email varchar(40) not null,--电子邮件
phone varchar(20) not null,--电话号码
address varchar(30) not null,--用户地址
postcode char(6) not null,--邮编
grade int default 1 --用户的级别
)

--管理员表admin
--暂时不写

--货物表
create table goods(
goodsId bigint primary key identity,
goodsName varchar(40),--名称
goodsIntro varchar(500),--介绍
goodsPrice float,--价格
goodsNum int,--数量
publisher varchar(40),--发行商
photo varchar(40),--照片
type varchar(10)--类型
)


--直接向数据库添加货物
insert into goods values('黑白森林','这是一部好片',59,1,'香港嘉禾出品','01.jpg','香港电影')
insert into goods values('金鸡II','这是一部好片',45,1,'香港嘉禾出品','02.jpg','香港电影')
insert into goods values('靓女菜馆','这是一部好片',99,1,'香港嘉禾出品','03.jpg','香港电影')
insert into goods values('布衣神相','这是一部好片',10,1,'香港嘉禾出品','04.jpg','香港电影')
insert into goods values('洛神','这是一部好片',68,1,'香港嘉禾出品','05.jpg','香港电影')
insert into goods values('黑白森林','这是一部好片',59,1,'香港嘉禾出品','01.jpg','香港电影')
insert into goods values('黑白森林','这是一部好片',59,1,'香港嘉禾出品','01.jpg','香港电影')
insert into goods values('金鸡II','这是一部好片',45,1,'香港嘉禾出品','02.jpg','香港电影')
insert into goods values('靓女菜馆','这是一部好片',99,1,'香港嘉禾出品','03.jpg','香港电影')
insert into goods values('布衣神相','这是一部好片',10,1,'香港嘉禾出品','04.jpg','香港电影')
insert into goods values('洛神','这是一部好片',68,1,'香港嘉禾出品','05.jpg','香港电影')
insert into goods values('布衣神相','这是一部好片',10,1,'香港嘉禾出品','04.jpg','香港电影')
insert into goods values('靓女菜馆','这是一部好片',99,1,'香港嘉禾出品','03.jpg','香港电影')

--向用户表中初始化一个用户，将来时通过注册界面加入的
insert into users values('lzp','李占平','lzp110','158869557@qq.com','023-1111111','时间都去哪了',123456,5)

--显示初始化的信息
select * from users;
select * from goods;
go















