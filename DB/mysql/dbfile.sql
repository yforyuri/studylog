CREATE TABLE `dept` (
  `DEPTNO` int(11) NOT NULL,
  `DNAME` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `LOC` varchar(13) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
);

CREATE TABLE `emp` (
  `EMPNO` int(11) NOT NULL,
  `ENAME` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `JOB` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `MGR` int(11) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` int(11) DEFAULT NULL,
  `COMM` int(11) DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_DEPTNO` (`DEPTNO`),
  CONSTRAINT `FK_DEPTNO` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`)
);

INSERT INTO project.DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO project.DEPT VALUES (20, 'RESEARCH','DALLAS');

INSERT INTO project.DEPT VALUES (30, 'SALES','CHICAGO');

INSERT INTO project.DEPT VALUES (40, 'OPERATIONS','BOSTON');


INSERT INTO project.EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO project.EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO project.EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO project.EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO project.EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO project.EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO project.EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO project.EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO project.EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO project.EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO project.EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO project.EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO project.EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO project.EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);


CREATE TABLE project.SALGRADE 
(  GRADE int, 
 LOSAL int, 
 HISAL int 
); 
    
INSERT INTO project.SALGRADE VALUES (1,700,1200); 
INSERT INTO project.SALGRADE VALUES (2,1201,1400); 
INSERT INTO project.SALGRADE VALUES (3,1401,2000); 
INSERT INTO project.SALGRADE VALUES (4,2001,3000); 
INSERT INTO project.SALGRADE VALUES (5,3001,9999); 

COMMIT; 




-- 
CREATE TABLE project.Book (
  bookid      int PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       int 
);

CREATE TABLE  project.Customer (
  custid      int PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(50),
  phone       VARCHAR(20)
);


CREATE TABLE project.Orders (
  orderid int PRIMARY KEY,
  custid  int REFERENCES project.Customer(custid),
  bookid  int REFERENCES Book(bookid),
  saleprice int ,
  orderdate DATE
);

-- Book, project.Customer, project.Orders 데이터 생성
INSERT INTO project.BOOK VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO project.BOOK VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO project.BOOK VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO project.BOOK VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO project.BOOK VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO project.BOOK VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO project.BOOK VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO project.BOOK VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO project.BOOK VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO project.BOOK VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO project.Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO project.Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO project.Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO project.Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO project.Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

-- 주문(project.Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO project.Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (7, 4, 8, 13000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO project.Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO project.Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));


COMMIT;

