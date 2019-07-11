-- 2019.07.09
-- example

select * from book;
select * from customer;
select * from orders;

-- 1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수
select count(b.publisher)
from book b, orders o, (select custid from customer where name='박지성') c
where o.custid = c.custid and b.bookid = o.bookid; 

-- (6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select b.bookname, b.price, b.price-o.saleprice
from book b, orders o, (select custid from customer where name='박지성') c
where o.custid = c.custid and b.bookid = o.bookid;  

-- (7) 박지성이구매하지않은도서의이름
select bookname
from book b, orders o, (select * from customer where name='박지성') c
where o.custid != c.custid and b.bookid = o.bookid;

-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
-- (8) 주문하지않은고객의이름(부속질의사용)
select name
from customer
where customer.custid not in (select custid from Orders);

-- (9) 주문금액의총액과주문의평균금액
select sum(saleprice), avg(saleprice)
from orders;

-- (10) 고객의이름과고객별구매액
select c.name, sum(o.saleprice)
from customer c, orders o
where c.custid=o.custid
group by name;

-- (11) 고객의이름과고객이구매한도서목록
select c.name, b.bookname
from customer c, book b, orders o
where c.custid=o.custid  and b.bookid=o.bookid;

-- (12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select *
from book b, orders o
where b.bookid=o.bookid and b.price-o.saleprice=
(select max(b.price-o.saleprice) from book b, orders o where b.bookid=o.bookid);

-- (13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름
select c.name
from customer c, orders o
where c.custid=o.custid
group by c.name
having avg(saleprice)>(select avg(saleprice) from orders);


-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select c.name
from customer c, orders o, book b
where c.custid=o.custid and b.bookid=o.bookid
and publisher in
(select publisher from customer c, orders o, book b where name='박지성') and c.name!='박지성'
group by c.name;

-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name
from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
group by c.name;

-- 4 다음질의에대해DML 문을작성하시오.
-- (1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
--     삽입이안될경우필요한데이터가더있는지찾아보자.
insert into book values(11, '스포츠세계', '대한미디어', 10000);

-- (2) ‘삼성당’에서출판한도서를삭제해야한다.
delete from book where publisher="삼성당";

-- (3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.
delete from book where publisher="이상미디어";

-- (4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.
update book set publisher="대한출판사" where publisher="대한미디어";

