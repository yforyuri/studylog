-- 2019.07.11
-- GUESTBOOK DDL

create table `GUESTBOOK_MESSAGE` (
message_id int(6) PRIMARY KEY auto_increment,
guestname varchar(50) not null,
password varchar(20) not null,
message text not null
);

insert into GUESTBOOK_MESSAGE (GUEST_NAME, PASSWORD, MESSAGE) values (?,?,?);
select * from GUESTBOOK_MESSAGE;
drop table GUESTBOOK_MESSAGE;