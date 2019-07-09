-- 2019.07.08
-- example

create table memberinfo(
    idx int(7) primary key,
    id varchar(12) not null unique,
    pw varchar(16) not null,
    name varchar(20) not null,
    photo varchar(30),
    regdate datetime default now()
);

desc memberinfo;

select * from memberinfo;

-- 회원가입
insert into memberinfo (idx, id, pw, name, photo) values (1, 'nana', '1111', 'nana', 'napic.png');
insert into memberinfo (idx, id, pw, name, photo) values (2, 'bobo', '2222', 'bobo', 'bopic.png');
insert into memberinfo (idx, id, pw, name, photo) values (3, 'gaga', '3333', 'gaga', 'null');

commit;
rollback;

-- 데이터 수정 :pk 조건
-- 이름 수정
update memberinfo set name='bbo' where idx=1;

-- 비밀번호 수정
update memberinfo set pw='2121' where idx=2;

-- 이름 비밀번호 한번에 수정
update memberinfo set name='summer', pw='0000' where idx=3;

-- 데이터 삭제 : pk기준으로 삭제
delete from memberinfo where idx=2;
-- 전체삭제
delete from memberinfo;

drop table memberinfo;

-- autocommit 설정을 해제해야 rollback/commit 기능을 사용할 수 있음 
select @@autocommit; -- 상태확인
set autocommit = false;  -- autocommit 해제/ true - 설정


-- 회원 가입시 증가하는 idx값을 위한 sequence 생성









select * from emp;
select * from dept;

-- 43. 사원 번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원 이름과 담당업무)하시오.
select ename, job from emp
where job = (select job from emp where empno='7788');

-- 44. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 감당 업무
select ename, job, sal
from emp
where sal > (select sal from emp where empno='7499');

-- 45. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
select ename, job, sal
from emp 
where sal = (select min(sal) from emp);

-- 46. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.
select job, avg(sal)
from emp
group by job
having avg(sal) <= all(select avg(sal) from emp group by job);

-- 47. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, sal, deptno
from emp
where sal in(select min(sal) from emp group by deptno);

-- 48. 담당업무가 ANALYST 인 사원보다 급여가 적으면서 업무가 ANALYST가 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오.
select empno, ename, job, sal
from emp
where sal < (select distinct sal from emp where job='ANALYST') and job !='ANALYST';

-- 49. 부하직원이 없는 사원의 이름을 표시하시오.
select ename from emp e
where not exists (select ename from emp m where e.empno=m.mgr);
 
-- 50. 부하직원이 있는 사원의 이름을 표시하시오.
select ename from emp e
where exists (select ename from emp m where e.empno=m.mgr);

-- 51. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오. ( 단 BLAKE는 제외 )
select ename, hiredate, deptno
from emp
where deptno = (select deptno from emp where ename='BLAKE') and ename !='BLAKE';

-- 52. 급여가 평균 급여보다 많은 사원들의 사원 번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
select empno, ename
from emp
where sal > (select avg(sal) from emp)
order by sal asc;

-- 53. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원 번호와 이름을 표시하시오.
select empno, ename
from emp
where deptno = any (select deptno from emp where ename like '%K%');

-- 54. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하시오.
select emp.ename, emp.deptno, emp.job
from emp, dept
where dept.loc='DALLAS';

-- 55. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select ename, sal from emp where mgr=(select empno from emp where ename='KING');

-- 56. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname='RESEARCH');

-- 57. 평균 월급보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원 번호, 이름, 급여를 표시하시오.
select empno, ename, sal
from emp
where deptno=(select deptno from emp where sal > (select avg(sal) from emp) and ename like '%M%');

-- 58. 평균급여가 가장 적은 업무를 찾으시오.
select job
from emp
group by job
having avg(sal) <= all(select avg(sal) from emp group by job);

-- 59. 담당업무가 MANAGER 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select ename
from emp
where deptno in (select deptno from emp where job='MANAGER');



-- 1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수

-- (6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
-- (7) 박지성이구매하지않은도서의이름

-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
-- (8) 주문하지않은고객의이름(부속질의사용)
-- (9) 주문금액의총액과주문의평균금액
-- (10) 고객의이름과고객별구매액
-- (11) 고객의이름과고객이구매한도서목록
-- (12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
-- (13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름

-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

-- 4 다음질의에대해DML 문을작성하시오.
-- (1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
--     삽입이안될경우필요한데이터가더있는지찾아보자.
-- (2) ‘삼성당’에서출판한도서를삭제해야한다.
-- (3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.
-- (4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.
