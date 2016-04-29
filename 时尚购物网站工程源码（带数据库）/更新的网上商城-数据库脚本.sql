drop database testdb3
go
create database testdb3;
go
use testdb3;
go

--普通用户的表
create table  users(
userid  bigint primary key identity,--用户id
username varchar(30) not null unique,--用户名
truename varchar(30) not null,--真实姓名
passwd   varchar(30) not null,--密码
email	varchar(40) not null,--电子邮件
phone   varchar(20) not null, --电话号码
address varchar(30) not null, --用户地址
postcode char(6) not null,--邮编
grade	int   default 5 --用户的级别
)

--管理员表admin 


--货物表
create table goods (
goodsId bigint primary key identity,--货物id
goodsName varchar(40) ,--名称
goodsIntro varchar(500),--介绍
goodsPrice float ,--价格
goodsNum int ,--数量
publisher varchar(40),--发行商
photo varchar(40),--照片
type varchar(10)--类型
)


--直接向数据库添加货物
insert into goods values( '黑白森林','这是一部好片', 59, 1, '香港嘉禾出品','01.jpg','香港电影')
insert into goods values( '金鸡II','这是一部好片', 45, 1, '香港嘉禾出品','02.jpg','香港电影')
insert into goods values( '靓女菜馆', '这是一部好片',99, 1, '香港嘉禾出品','03.jpg','香港电影')
insert into goods values( '布衣神相','这是一部好片', 10, 1, '香港嘉禾出品','04.jpg','香港电影')
insert into goods values( '洛神', '这是一部好片',68, 1, '香港嘉禾出品','05.jpg','香港电影')
insert into goods values( '黑白森林', '这是一部好片',56, 1, '香港嘉禾出品','01.jpg','香港电影')
insert into goods values( '黑白森林', '这是一部好片',56, 1, '香港嘉禾出品','01.jpg','香港电影')
insert into goods values( '金鸡II', '这是一部好片',55, 1, '香港嘉禾出品','02.jpg','香港电影')


--向用户表中初始化一个用户，将来是通过注册界面加入的

insert into users values('shunping','韩顺平','shunping','hanshunping@tsinghua.org.cn','010-88888888','星星小区哈哈楼嘻嘻单元123房间','123456',1);




--学生可能这样设计订单表(错误)
--create table orders(
	
--	ordersId bigint primary key identity(1,1),--订单号
--	userId   bigint constraint fk_client_id references users(userid),--哪个用户订的
--	goodsId  bigint constraint fk_shangpin_id references goods(goodsId),--商品号
--	nums int not null,--数量
--	orderDate datetime default getdate(),--下订单的时间
--	payMode varchar(20)check (payMode in('货到付款','支付宝付款')) default '货到付款',--付款的方式
--	isPayed bit check  ( isPayed in (0 ,1)),--(0,表示还没有付款 1:表示已经付款了)
--	totalPrice float not null,--总价格
--)



--应该这样去设计订单表
create table orders(
	
	ordersId bigint primary key identity(1,1),--订单号
	userId   bigint constraint fk_client_id references users(userid),--哪个用户订的
	orderDate datetime default getdate(),--下订单的时间
	payMode varchar(20)check (payMode in('货到付款','支付宝付款')) default '货到付款',--付款的方式
	isPayed bit check  ( isPayed in (0 ,1)),--(0,表示还没有付款 1:表示已经付款了)
	totalPrice float not null--总价格
)

--订单细节表
create table orderDetail(
	
	ordesIid bigint constraint fk_order_id references orders(ordersId),--订单号(并是一个外键) 指向orders表的主键
	goodsId  bigint constraint fk_shangpin_id references goods(goodsId),--商品号(并是一个外键) 指向goods表的主键
	nums int not null--数量
)


--显示一下各个表的初始化信息
select * from users;
select * from goods;
select * from orders

select * from orderDetail

go


