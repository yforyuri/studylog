-- 190705

-- sub query

-- SCOTT사원이 소속된 -> 서브쿼리
-- 부서 이름을 출력 -> 메인쿼리
select *
from dept
where deptno = (
                select deptno
                from emp
                where ename='SCOTT'
                );
                
select deptno
from emp
where ename='SCOTT';

-- 사원들중 평균 급여보다 많은 급여를 받는 사원의 이름과 급여를 출력해보자.
select *
from emp
where sal > (select avg(sal) from emp);

-- 급여가 3000 이상인 사원의 소속부서
-- 해당 부서에 근무 하는 사원의 리스트
select ename
from emp
where deptno in(  -- 20, 10,20
                select deptno
                from emp
                where sal >= 3000
                );

select deptno
from emp
where sal >= 3000;

select sal
from emp
where deptno = 30;

select ename, sal
from emp
where sal > all(
                select sal
                from emp
                where deptno = 30
                );
                
select ename, sal
from emp
where sal > any(
                select sal
                from emp
                where deptno = 30
                );
                
-- 인라인 뷰 : from절 뒤에 서브쿼리가 위치
select mpno, ename, sal
from( select empno, ename, job, hiredate
      from emp
      );

select empno, ename, job, hiredate
from emp
;

select ename, deptno, (
               select dname
               from dept
               where dept.deptno=emp.deptno
               )
from emp;




-------------------------------------------------------------
-- DDL
-------------------------------------------------------------

-- create table : 테이블 생성 ( 데이터 저장 규칙을 정의)
-- 컬럼 이름, 저장 데이터 타입, 저장 데이터 사이즈, 제약조건
-- null 유무
-- unique(중복여부)
-- default value
-- check
-- primary key
-- foreing key




-- CREATE TABLE : 컬럼 직접 설정
create table emp01(  -- 테이블 이름은 emp01로 만든다,
    empno number(4),  -- 컬럼 이름이 empno인 저장공간을 만든다. 숫자타입 4자리
    ename varchar2(20),  -- 컬럼 이름이 ename, 가변 문자타입, 20자리
    sal number(7, 2)  -- 컬럼이름 sal, 숫자타입, 7자리, 7자리 중 뒤 2자리는 소수
    );

-- CREATE TABLE : 서브쿼리를 이용하는 방법
create table emp02
AS
select * from emp;


create table emp03
as
select empno, ename, job, hiredate from emp;

desc emp03;

create table emp04
as
select * from emp where deptno=20;

select * from emp04;

create table emp05
as
select * from emp where 1=2;

select *  from emp05;


-- MEMBERINFO table 생성
-- 아이디 : 6~12자리 문자열
-- 비밀번호 : 8~16자리 문자열
-- 이름 : 10자리 문자열
-- 사진경로(파일경로) : 30자리 문자열
-- 가입날짜 : 날짜타입

drop table memberinfo;

create table memberinfo(
    u_id varchar2(12),
    u_pw varchar2(16),
    u_name varchar2(20),
    u_photo varchar(30),
    regdate date
);


-- 테이블의 구조를 수정하는 명령 : ALTER TABLE
-- 컬럼의 추가, 컬럼의 수정, 컬럼의 삭제

desc emp01;

--alter table 테이블이름 add 컬럼이름
alter table emp01
add (job VARCHAR2(9));

-- alter table 테이블 이름 modify (컬럼정의)
alter table emp01 modify (job VARCHAR2(30));

-- alter table 테이블이름 drop COLUMN 칼럼이름
alter table emp01  drop COLUMN job;

select * from emp02;
TRUNCATE table emp02;

rename emp02 to test;
desc emp02;
desc test;

-- 제약조건 적용
create table emp06(
    empno number(4) not null UNIQUE,
    ename varchar2(20),
    sal number(7,2)
    );
   
desc emp06;

-- insert into 테이블이름 (컬럼리스트) values (값, 값, 값...)
insert into emp06 (empno, ename) values (null, null);
insert into emp06 (empno, ename) values (2011, null);

select * from emp06;

insert into emp06 (empno, ename) values (2011, 'king');
insert into emp06 (empno, ename) values (2012, 'king');
insert into emp06 (empno, ename, sal) values (2012, 'king', 4000);

drop table emp06;

create table emp06(
    empno number(4) not null UNIQUE,
    ename varchar2(20) not null,
    sal number(7,2) default 1000,
    grade number(1) CHECK (grade between 1 and 5),
    gender char(1) check(gender in ( 'M', 'F')),
    deptno number(2), 
    foreign key (deptno) REFERENCES dept(deptno)
    );

insert into emp06 values (1000, 'king', null, 5, 'M', 40);
insert into emp06 values (1001, 'king', null, 3, 'F', 20);


create table emp07(
    empno number(4) constraint emp07_empno_nn not null,
    ename varchar2(10) constraint emp07_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    constraint emp07_empno_pk PRIMARY KEY(empno),
    constraint emp07_job_uk UNIQUE(job),
    constraint emp07_deptno_fk FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

-- MEMBERINFO table 생성
-- 대리키 : idx                           - 기본키
-- 아이디 : 6~12자리 문자열                - not null, unique
-- 비밀번호 : 8~16자리 문자열               - not null
-- 이름 : 10자리 문자열                    - not null
-- 사진경로(파일경로) : 30자리 문자열
-- 가입날짜 : 날짜타입                     - default sysdate


create table memberinfo(
    idx number(7),
    id varchar2(12) constraint memberinfo_id_nn not null,
    pw varchar2(16) constraint memberinfo_pw_nn not null,
    name varchar2(20) constraint memberinfo_name_nn not null,
    photo varchar(30),
    regdate date default sysdate,
    constraint memberinfo_idx_pk PRIMARY KEY(idx),
    constraint memberinfo_id_uk UNIQUE(id)
);

