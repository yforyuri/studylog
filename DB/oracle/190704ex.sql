-- 190704
-- example

-- 23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select max(sal) as "최고액", min(sal) as "최저액", sum(sal) as "급여의 총합", round(avg(sal)) as "급여의 평균"
from emp;

-- 24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select job, max(sal) as "최고액", min(sal) as "최저액", sum(sal) as "급여의 총합", round(avg(sal)) as "급여의 평균"
from emp
group by job;

-- 25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select job, count(*) from emp
group by job;

-- 26. 관리자 수를 나열하시오.
select count(distinct mgr) from emp;

select nvl(mgr, 0), count(*)
from emp
group by mgr
;

-- 27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal)-min(sal) from emp;

-- 28. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원의 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job, min(sal) from emp
where mgr is not null  -- and sal >2000 
group by job
having min(sal) > 2000
order by min(sal) desc;

-- 29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno, count(*), round(avg(sal),2) from emp
group by deptno;

-- 30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno as "부서번호", decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') as "부서명", 
decode(deptno, 10, 'NEW YORK', 20, 'DALLAS', 30, 'CHICAGO', 40, 'BOSTON') as "지역" ,
count(*) as "사원 수", round(avg(sal)) as "평균급여"
from emp
group by deptno;

select e.deptno, d.dname, d.loc, count(*), round(avg(sal))
from emp e, dept d
where e.deptno=d.deptno
group by e.deptno, d.dname, d.loc
;

-- 31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 
-- 별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. ( hint. Decode, group by )
select job, deptno as DNO, decode(deptno,10,sum(sal)) as "부서10", decode(deptno,20,sum(sal)) as "부서20", decode(deptno,30,sum(sal)) as "부서30", sum(sal) as "총액"
from emp
group by job, deptno
order by deptno;



--32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
select ename, dname, dept.deptno
from emp, dept
where emp.deptno=dept.deptno and ename='SCOTT';

--33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
select ename, dname, loc
from emp inner join dept
on emp.deptno=dept.deptno;

--36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select ename, dname
from emp, dept
where emp.deptno=dept.deptno and ename like '%A%';

--37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select ename, job, dept.deptno, dname
from emp, dept
where  emp.deptno=dept.deptno and loc='NEW YORK';

--38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
select e.ename, e.empno, m.ename as MGR
from emp e, emp m
where e.mgr=m.empno;

--39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.ename, e.empno, m.ename as MGR
from emp e, emp m
where e.mgr=m.empno(+)
order by e.empno desc;

--40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
select e.ename, e.deptno, m.ename, m.deptno
from emp e, emp m
where m.ename='SCOTT' and  e.deptno = m.deptno;

--41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select e.ename, e.hiredate, m.ename, m.hiredate
from emp e, emp m
where m.ename='WARD' and e.hiredate > m.hiredate;

--42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.ename, e.hiredate, m.ename, m.hiredate
from emp e, emp m
where e.mgr=m.empno and m.hiredate > e.hiredate;
