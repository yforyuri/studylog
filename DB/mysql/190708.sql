-- 2019.07.08

-- subquery2

-- 고객 이름별 구매 총 금액을 출력
select custid, (
select name from customer c
where o.custid = c.custid
), sum(saleprice) as 총액
from orders o
group by custid;

-- join 처리
select o.custid, c.name, sum(o.saleprice) as 총액
from orders o join customer c
on o.custid = c.custid
group by custid;

-- inline view
select * from customer where custid <= 2;

select *
from (select * from customer where custid <= 2) c, orders o
where c.custid = o.custid;

-- rownum
-- oracle rownum으로 사용
-- mysql 은 set으로 초기화 후 @rownum:=@rownum+1 해줘야 함

set @rownum:=0;  -- rownum 초기화

select @rownum:=@rownum+1, empno, ename 
from emp
order by ename;

select rownum, empno, ename 
from (select * from emp order by ename);

-- 평균 주문금액 이하의 주문에 대해서
-- 주문번호와 금액을 출력
select avg(saleprice)
from orders;

-- 11800
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문내역에 대해서 주문번호, 고객번호, 금액을 출력
select orderid, custid, saleprice
from orders od
where saleprice > (
select avg(saleprice) 
from orders os
where od.custid = os.custid
);
-- 고객별 주문 평균금액 확인 
select avg(saleprice) 
from orders os
where os.custid=2;

-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액
select sum(saleprice) as 총액
from orders
where custid in(
select custid from customer where address like '%대한민국%'
);
-- 한국에서 주문한 내역 고객번호 주소 확인
select custid, address from customer where address like '%대한민국%';

-- JOIN
select sum(saleprice) as 총액
from orders o join customer c
on o.custid=c.custid
where address like '%대한민국%';

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액
-- 최대값보다 큰 값 찾기
select orderid, saleprice
from orders
where saleprice > all (
select max(saleprice) from orders where custid = 3
);

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액
select sum(saleprice) as 총판매액
from orders o
where exists (
select * from customer c 
where o.custid=c.custid and c.address like '%대한민국%'
);




--------------------------------------------------------------
-- DML
--------------------------------------------------------------

-- 데이터 입력 : INSERT INTO 테이블 명(컬럼 리스트) VALUES(입력 데이터 리스트)

-- 테이블 삭제
drop table dept01;

-- 테이블 생성
create table dept01
as
select * from dept where 1=0;

-- 데이터 입력
insert into dept01 (deptno, dname, loc) values(10, 'accounting', 'newyork');

select * from dept01;

desc dept01;
insert into dept01 values(20, 'research', 'losangeles');

-- null값의 입력
-- 암묵적 / 암시적 방법
-- 컬럼을 빼고 입력
insert into dept01 (deptno, dname) values (30, 'sales');

insert into dept01 values (40, 'operations', null);

insert into dept01 values (50, '', null);

insert into dept01
select * from dept;

-- 데이터의 수정 : update 테이블 이름 set 컬럼이름=변경데이터, 컬럼이름=변경데이터
-- 			   where 변경하고자 하는 행을 찾기위한 조건
update emp01 set deptno = 30;
update emp01 set sal=sal * 1.1;
update emp01 set hiredate=now();  -- oracle:sysdate

desc emp01;
select * from emp01;

drop table emp01;
create table emp01
as
select * from emp;

-- where절을 이용한 특정행의 데이터 변경
-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp01 set deptno=30 where deptno=10;
-- 급여가 3000이상인 사원만 급여를 10% 인상
update emp01 set sal=sal*1.1 where sal>=3000;

-- 1987년에 입사한 사원의 입사일이 오늘로 수정. 사원의입사일을 오늘로 수정한 후에 테이블 내용출력
update emp01 set hiredate = now() where substr(hiredate, 3, 2)='87';

-- SCOTT 사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정
update emp01 set deptno=20, job='manager' where ename='SCOTT';

-- SCOTT 사원의 입사일자는 오늘로, 급여를 50 으로 커미션을 4000 으로 수정
update emp01 set hiredate=now(), sal=50, comm=4000 where ename='SCOTT';

drop table dept01;
create table dept01
as
select * from dept;
select * from dept01;

-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기
-- [mysql] insert, update, delete에서 subquery로 동일한 테이블의 조건을 사용시 에러 발생 -> subquery로 한번 더 감싸줘야함
-- ORALCE과의 차이점: set 문에 subquery를 쓰려면 subquery 문으로 또 써야 함.
-- why? where / from / select 문에만 가능하기 때문
update dept01 set loc = ( select * from(
select loc from dept01 where deptno=40) as 지역명
) where deptno=20;


-- 데이터 삭제 : DELETE FROM 테이블 이름 WHERE 조건
-- 전체 행을 삭제
delete from dept01;

-- 특정 행을 삭제. where절에서 특정 행을 찾는 조건을 기술
delete from dept01 where deptno=30;





--------------------------------------------------------------
-- VIEW : 사용자에게 보여주는 가상 테이블 
-- (특정 컬럼을 제외하거나 복잡한 sql문을 간소화시킨다)
--------------------------------------------------------------

-- VIEW 생성 : create view 뷰 이름 as subquery
create view emp_view30
as
select empno, ename, deptno
from emp
where deptno=30;

-- 같은 결과 도출
select empno, ename, deptno from emp where deptno=30;
select * from emp_view30; 

-- inline view
-- 사원중에서 입사일이 빠른 다섯명만 얻어오는 질의문을 작성
set @rownum:=0;
select @rownum:=@rownum+1 as NO, empno, ename, hiredate from emp
order by hiredate;

select @rownum:=@rownum+1 as NO, empno, ename, hiredate 
from (
select empno, ename, hiredate 
from emp 
order by hiredate) 
where rownum <= 5
order by hiredate;

select @rownum:=@rownum+1 as NO, empno, ename, hiredate from emp limit 0,5;

-- inlineview 사용
create view emp_hire 
as
select empno, ename, hiredate
from emp 
order by hiredate;

select @rownum:=@rownum+1 as NO, empno, ename, hiredate from emp_hire;

select @rownum:=@rownum+1 as NO, empno, ename, hiredate from emp_hire limit 0,5;








-- [ORACLE]
--------------------------------------------------------------
-- SEQUENCE : 자동 숫자 증가 처리해주는 객체
--------------------------------------------------------------
create sequences test_seq;
start with 10
increament by 10;
drop sequence test_seq;

select test_seq.nextval from dual;
select test_seq.currval from dual;

 desc dept01;
 select * from dept01;
 insert into dept01 values(test_seq.nextval, 'design', 'seoul');
 delete from dept01;
 