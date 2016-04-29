drop database testdb3
go
create database testdb3;
go
use testdb3;
go

--��ͨ�û��ı�
create table  users(
userid  bigint primary key identity,--�û�id
username varchar(30) not null unique,--�û���
truename varchar(30) not null,--��ʵ����
passwd   varchar(30) not null,--����
email	varchar(40) not null,--�����ʼ�
phone   varchar(20) not null, --�绰����
address varchar(30) not null, --�û���ַ
postcode char(6) not null,--�ʱ�
grade	int   default 5 --�û��ļ���
)

--����Ա��admin 


--�����
create table goods (
goodsId bigint primary key identity,--����id
goodsName varchar(40) ,--����
goodsIntro varchar(500),--����
goodsPrice float ,--�۸�
goodsNum int ,--����
publisher varchar(40),--������
photo varchar(40),--��Ƭ
type varchar(10)--����
)


--ֱ�������ݿ���ӻ���
insert into goods values( '�ڰ�ɭ��','����һ����Ƭ', 59, 1, '��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values( '��II','����һ����Ƭ', 45, 1, '��ۼκ̳�Ʒ','02.jpg','��۵�Ӱ')
insert into goods values( '��Ů�˹�', '����һ����Ƭ',99, 1, '��ۼκ̳�Ʒ','03.jpg','��۵�Ӱ')
insert into goods values( '��������','����һ����Ƭ', 10, 1, '��ۼκ̳�Ʒ','04.jpg','��۵�Ӱ')
insert into goods values( '����', '����һ����Ƭ',68, 1, '��ۼκ̳�Ʒ','05.jpg','��۵�Ӱ')
insert into goods values( '�ڰ�ɭ��', '����һ����Ƭ',56, 1, '��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values( '�ڰ�ɭ��', '����һ����Ƭ',56, 1, '��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values( '��II', '����һ����Ƭ',55, 1, '��ۼκ̳�Ʒ','02.jpg','��۵�Ӱ')


--���û����г�ʼ��һ���û���������ͨ��ע���������

insert into users values('shunping','��˳ƽ','shunping','hanshunping@tsinghua.org.cn','010-88888888','����С������¥������Ԫ123����','123456',1);




--ѧ������������ƶ�����(����)
--create table orders(
	
--	ordersId bigint primary key identity(1,1),--������
--	userId   bigint constraint fk_client_id references users(userid),--�ĸ��û�����
--	goodsId  bigint constraint fk_shangpin_id references goods(goodsId),--��Ʒ��
--	nums int not null,--����
--	orderDate datetime default getdate(),--�¶�����ʱ��
--	payMode varchar(20)check (payMode in('��������','֧��������')) default '��������',--����ķ�ʽ
--	isPayed bit check  ( isPayed in (0 ,1)),--(0,��ʾ��û�и��� 1:��ʾ�Ѿ�������)
--	totalPrice float not null,--�ܼ۸�
--)



--Ӧ������ȥ��ƶ�����
create table orders(
	
	ordersId bigint primary key identity(1,1),--������
	userId   bigint constraint fk_client_id references users(userid),--�ĸ��û�����
	orderDate datetime default getdate(),--�¶�����ʱ��
	payMode varchar(20)check (payMode in('��������','֧��������')) default '��������',--����ķ�ʽ
	isPayed bit check  ( isPayed in (0 ,1)),--(0,��ʾ��û�и��� 1:��ʾ�Ѿ�������)
	totalPrice float not null--�ܼ۸�
)

--����ϸ�ڱ�
create table orderDetail(
	
	ordesIid bigint constraint fk_order_id references orders(ordersId),--������(����һ�����) ָ��orders�������
	goodsId  bigint constraint fk_shangpin_id references goods(goodsId),--��Ʒ��(����һ�����) ָ��goods�������
	nums int not null--����
)


--��ʾһ�¸�����ĳ�ʼ����Ϣ
select * from users;
select * from goods;
select * from orders

select * from orderDetail

go


