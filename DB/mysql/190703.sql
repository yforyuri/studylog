-- 2019.07.03
-- example

-- 1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename, sal, sal + 300 from emp;

-- 2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename, sal, sal * 12 + 100 from emp
order by sal * 12 + 100 desc;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ename, sal from emp
where sal >= 2000
order by sal desc;

-- 4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename, empno from emp
where empno = 7788;

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ename, sal from emp
where sal not between 2000 and 3000;

-- 6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ename, job, hiredate from emp
where hiredate between '1981/02/20' and '1981/05/01';

-- 7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ename, deptno from emp
where deptno between 20 and 30
order by ename desc;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
select ename, sal, deptno from emp
where sal between 2000 and 3000 and deptno between 20 and 30
order by ename asc;

-- 9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)

select ename, hiredate from emp
where hiredate like '81%';

-- 10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ename, job from emp
where mgr is null;

-- 11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select ename, sal, comm from emp
where comm is not null
order by sal + comm desc;

-- 12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename from emp
where ename like '__R%';

-- 13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename from emp
where ename like '%A%' and ename like '%E%';

-- 14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ename, job, sal from emp
where job in ('CLERK','SALESMAN') and sal not in(1600,950,1300);

-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ename, sal, comm from emp
where comm >=500 ;

-- 16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select substr(hiredate, 1, 7) from emp;

-- 17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select * from emp 
where substr(hiredate, '6', '2')='04';

-- 18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select * from emp
where mod(empno, 2)=0;

-- 19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.

select TO_CHAR(hiredate, 'YY/MON/DY') from emp;

-- 20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.

select trunc(sysdate-to_date('2019/01/01', 'yyyy/mm/dd')) from dual;

-- 21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.

select nvl(mgr,0) from emp;

-- 22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오

select ename, job, sal,
        DECODE(job,
                'ANALYST', sal+200,
                'SALESMAN', sal+180,
                'MANAGER', sal+150,
                'CLERK', sal+100 
        ) as upSal
from emp;