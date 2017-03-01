create database collo;
use collo
create table register(uname varchar2(40), userid varchar2(50) primary key , password varchar2(20), gender varchar2(10),status varchar2(15));
insert into register values('admin','admin@collo.com','admin','admin','admin');
commit;
create table queationtable(qid varchar2(15),queation varchar2(1000),userid varchar2(50),category varchar2(5));
create table answertable(aid varchar2(15),answer varchar2(1500),userid varchar2(50),qid varchar2(20),alike varchar2(15));

create table alike(lid varchar2(15),qid varchar2(15),aid varchar2(15),userid varchar2(50));


