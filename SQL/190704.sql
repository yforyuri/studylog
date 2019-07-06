-- 2019.07.04

-- 그룹함수

-- sum(컬럼) : 그룹의 합을 반환

-- 사원 테이블에서 사원의 월 급여의 총 합을 구해보자
select sum(sal) as "월 총 급여"
from emp;

-- 10번 부서 소속 직원들의 월 급여 총액을 구해보자
select sum(sal) from emp
where deptno=10;

-- sum 함수에서 null값 처리방식 : null값은 무시한다.
select sum(comm) from emp;
select comm from emp;

-- avg(컬럼) : 그룹에 포함된 값들의 평균값을 반환
select avg(sal) as"전체 사원의 월 평균 급여" from emp;
-- 그룹 함수의 결과는 단일형 하나의 컬럼
select trunc(avg(sal)) as"전체 사원의 월 평균 급여" from emp;
select trunc(avg(sal)) as"MANAGER의 월 평균 급여" 
from emp
where job='MANAGER';

-- avg함수도 컬럼의 값이 null일 때 제외하고 처리
select avg(comm) from emp;

-- MAX(칼럼):최대값 반환 MIN(컬럼) : 최소값 반환
select MAX(sal) as "최대급여", MIN(sal) as "최소급여" from emp;

-- count(컬럼) : row의 개수를 반환

-- 회사에 소속된 사원의 수
select count(*) as "전체 사원의 수" from emp;

-- 10번 부서에 소속된 직원 수
select count(*) from emp
where deptno=10;

-- 커미션을 받는 직원 수
select count(comm) from emp;

-- 부서의 수를 구하자
select count(*) from dept;

-- 사원들이 소속된 부서의 수
select deptno from emp;

select distinct deptno from emp;

select count(distinct deptno) from emp;

select job from emp;

select * from emp 
order by deptno;

-- group by : row를 그룹핑해서 처리, 집합함수( sum, avg, count)

-- 컬럼이름 -> 그룹핑의 기준
select deptno, sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno;

-- 직무별 지표를 출력해보자
select job, count(*) as "직원의 수", TO_CHAR(sum(sal), '999,999') as "급여의 총합"
, round(avg(sal)) as "급여의 평균", max(sal), min(sal)
from emp
group by job;

-- 부서의 평균 급여가 2000 이상인 부서만 출력
select deptno, sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
having avg(sal) >= 2000;

-- 부서의 평균 급여가 2900 이상인 부서만 출력
select deptno, sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
having avg(sal) >= 2900;


----------------------------------------------------------------------------
-- JOIN : 2개 이상의 테이블 옆으로 붙인다 -> 표현하는 컬럼에 늘어난다.
----------------------------------------------------------------------------

-- 테이블을 붙인다 : CROSS JOIN
select *
from emp, dept
where emp.deptno = dept.deptno;

-- 이름이 scott인 사원의 이름과 부서이름을 출력하자
select ename, dname, emp.deptno, dept.deptno
from emp, dept
where emp.deptno=dept.deptno and ename='SCOTT';

-- 주문 테이블에서 회원의 이름과 주문정보를 출력
-- orders, customer
select orders.orderid, customer.name
from orders, customer
where orders.custid = customer.custid and customer.name='박지성';

-- customer, book, orders
select *
from orders o, customer c, book b
where o.custid=c.custid and o.bookid=b.bookid;

--박지성 고객이 주문한 책의 이름을 출력.
select b.bookname, b.publisher
from orders o, customer c, book b
where o.custid=c.custid and o.bookid=b.bookid
and c.name='박지성';



select ename, sal, s.grade
from  emp e, salgrade s
where sal between s.losal and s.hisal and ename ='SCOTT';


-- self join : 하나의 테이블로 조인하는 형태
select e.ename || '의 매니저는 ' ||m.ename||'입니다.'
from emp e, emp m
where e.mgr=m.empno
order by m.ename;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr=m.empno(+);


-- ANSI CROSS JOIN
select *
from emp cross join dept;

select *
from emp, dept;

--ANSI INNER JOIN
select *
from emp inner join dept
on emp.deptno=dept.deptno;

select *
from emp, dept
where emp.deptno=dept.deptno;

select *
from emp join dept
on emp.deptno=dept.deptno;

select *
from emp join dept
USING (deptno);

select e.ename, m.ename
from emp e left outer join emp m
on e.mgr=m.empno;

select *
from customer;

select distinct(custid)
from orders;

select *
from orders o, customer c
where o.custid(+)=c.custid;

select *
from orders o right outer join customer c
where o.custid=c.custid;