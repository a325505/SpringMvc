drop database testdb5; --ɾ��testdb3
go
create database testdb5;--����testdb3
go
use testdb5;--ʹ��testdb3
go

--��ͨ�û��ı�
create table users(
userid bigint primary key identity,
username varchar(30) not null unique,--�û���
truename varchar(30) not null,--��ʵ����
passwd varchar(30) not null,--����
email varchar(40) not null,--�����ʼ�
phone varchar(20) not null,--�绰����
address varchar(30) not null,--�û���ַ
postcode char(6) not null,--�ʱ�
grade int default 1 --�û��ļ���
)

--����Ա��admin
--��ʱ��д

--�����
create table goods(
goodsId bigint primary key identity,
goodsName varchar(40),--����
goodsIntro varchar(500),--����
goodsPrice float,--�۸�
goodsNum int,--����
publisher varchar(40),--������
photo varchar(40),--��Ƭ
type varchar(10)--����
)


--ֱ�������ݿ���ӻ���
insert into goods values('�ڰ�ɭ��','����һ����Ƭ',59,1,'��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values('��II','����һ����Ƭ',45,1,'��ۼκ̳�Ʒ','02.jpg','��۵�Ӱ')
insert into goods values('��Ů�˹�','����һ����Ƭ',99,1,'��ۼκ̳�Ʒ','03.jpg','��۵�Ӱ')
insert into goods values('��������','����һ����Ƭ',10,1,'��ۼκ̳�Ʒ','04.jpg','��۵�Ӱ')
insert into goods values('����','����һ����Ƭ',68,1,'��ۼκ̳�Ʒ','05.jpg','��۵�Ӱ')
insert into goods values('�ڰ�ɭ��','����һ����Ƭ',59,1,'��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values('�ڰ�ɭ��','����һ����Ƭ',59,1,'��ۼκ̳�Ʒ','01.jpg','��۵�Ӱ')
insert into goods values('��II','����һ����Ƭ',45,1,'��ۼκ̳�Ʒ','02.jpg','��۵�Ӱ')
insert into goods values('��Ů�˹�','����һ����Ƭ',99,1,'��ۼκ̳�Ʒ','03.jpg','��۵�Ӱ')
insert into goods values('��������','����һ����Ƭ',10,1,'��ۼκ̳�Ʒ','04.jpg','��۵�Ӱ')
insert into goods values('����','����һ����Ƭ',68,1,'��ۼκ̳�Ʒ','05.jpg','��۵�Ӱ')
insert into goods values('��������','����һ����Ƭ',10,1,'��ۼκ̳�Ʒ','04.jpg','��۵�Ӱ')
insert into goods values('��Ů�˹�','����һ����Ƭ',99,1,'��ۼκ̳�Ʒ','03.jpg','��۵�Ӱ')

--���û����г�ʼ��һ���û�������ʱͨ��ע���������
insert into users values('lzp','��ռƽ','lzp110','158869557@qq.com','023-1111111','ʱ�䶼ȥ����',123456,5)

--��ʾ��ʼ������Ϣ
select * from users;
select * from goods;
go















