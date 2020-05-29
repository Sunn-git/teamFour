
-- 비계층형 도서 게시판
CREATE TABLE BOOK(
BOOK_SEQ NUMBER,
ISBN VARCHAR2(100 CHAR),
TITLE VARCHAR2(100 CHAR),
AUTHOR VARCHAR2(100 CHAR),
TRANSLATOR VARCHAR2(100 CHAR),
COVER_URL VARCHAR2(200 CHAR),
PUBLISHER VARCHAR2(100 CHAR),
CATEGORY_ID NUMBER, --FK
PRICE_STANDARD NUMBER,
PUB_DATE DATE,
DESCRIPTION LONG,
PRIMARY KEY(BOOK_SEQ)
);

ALTER TABLE BOOK
ADD CONSTRAINT BOOK_FK1 
FOREIGN KEY(CATEGORY_ID)
REFERENCES CATEGORY(CATEGORY_ID);

--카테고리 테이블
CREATE TABLE CATEGORY(
CATEGORY_ID NUMBER,
CATEGORY_TAG VARCHAR2(100 CHAR),
PRIMARY KEY(CATEGORY_ID)
);


-- 계층형 댓글 게시판 (DEPTH 1까지만 구현)
CREATE TABLE REPLY(
REPLY_SEQ NUMBER,
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
REPLY_STAR_RATE NUMBER,
REPLY_CONTENT VARCHAR2(150 CHAR),
REPLY_DATE DATE,
REPLY_LIKE NUMBER,
REFER NUMBER,
DEPTH NUMBER,
STEP NUMBER,
PRIMARY KEY(REPLY_SEQ)
);

ALTER TABLE REPLY
ADD CONSTRAINT REPLY_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE REPLY
ADD CONSTRAINT REPLY_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);

-- 비계층형 포스트 게시판
CREATE TABLE POST(
POST_SEQ NUMBER,
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
POST_TITLE VARCHAR2(100 CHAR),
POST_CONTENTS LONG,
POST_DATE DATE,
POST_VIEWS NUMBER,
POST_UPLOAD_FILE VARCHAR2(100 CHAR),
PRIMARY KEY(POST_SEQ)
);

ALTER TABLE POST
ADD CONSTRAINT POST_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE POST
ADD CONSTRAINT POST_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);


-- 회원 테이블
CREATE TABLE USERS(
USER_ID VARCHAR2(20 CHAR),
USER_PWD VARCHAR2(20 CHAR),
USER_EMAIL VARCHAR2(50 CHAR),
USER_NAME VARCHAR2(10 CHAR),
USER_IMAGE VARCHAR2(100 CHAR),
PRIMARY KEY(USER_ID)
);


-- 찜 테이블
CREATE TABLE DIBS(
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
DIBS_DATE DATE
);

ALTER TABLE DIBS
ADD CONSTRAINT DIBS_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE DIBS
ADD CONSTRAINT DIBS_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);

ALTER TABLE DIBS
ADD CONSTRAINT DIBS_PK
PRIMARY KEY(USER_ID, BOOK_SEQ);

-- 비계층형 공지사항 게시판
CREATE TABLE NOTICE(
NOTICE_SEQ NUMBER,
ADMIN_ID VARCHAR2(20 CHAR),--FK
NOTICE_TITLE VARCHAR2(100 CHAR),
NOTICE_CONTENTS LONG,
NOTICE_DATE DATE,
-- 일단 파일 업로드 없는채로 만들었어요 파일 업로드 기능 넣고싶으시면 컬럼 추가하면 돼요 !
-- NOTICE_UPLOAD_FILE VARCHAR2(100 CHAR),
PRIMARY KEY(NOTICE_SEQ)
);

ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_FK1 
FOREIGN KEY(ADMIN_ID)
REFERENCES ADMIN(ADMIN_ID);




--관리자 테이블
CREATE TABLE ADMIN(
ADMIN_ID VARCHAR2(20 CHAR),
ADMIN_PWD VARCHAR2(20 CHAR),
PRIMARY KEY(ADMIN_ID)
);


--시퀀스 생성
CREATE SEQUENCE BOOK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1;

CREATE SEQUENCE REPLY_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1;

CREATE SEQUENCE POST_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1;

CREATE SEQUENCE NOTICE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1;


----------------------------------------------------------------


DROP TABLE ADMIN;
DROP TABLE BOOK;
DROP TABLE CATEGORY;
DROP TABLE DIBS;
DROP TABLE NOTICE;
DROP TABLE POST;
DROP TABLE REPLY;
DROP TABLE USERS;

-- 비계층형 도서 게시판
CREATE TABLE BOOK(
BOOK_SEQ NUMBER,
ISBN VARCHAR2(100 CHAR),
TITLE VARCHAR2(100 CHAR),
AUTHOR VARCHAR2(100 CHAR),
TRANSLATOR VARCHAR2(100 CHAR),
COVER_URL VARCHAR2(200 CHAR),
PUBLISHER VARCHAR2(100 CHAR),
CATEGORY_ID NUMBER, --FK
PRICE_STANDARD NUMBER,
PUB_DATE DATE,
DESCRIPTION LONG,
PRIMARY KEY(BOOK_SEQ)
);

--카테고리 테이블
CREATE TABLE CATEGORY(
CATEGORY_ID NUMBER,
CATEGORY_TAG VARCHAR2(100 CHAR),
PRIMARY KEY(CATEGORY_ID)
);

-- 계층형 댓글 게시판 (DEPTH 1까지만 구현)
CREATE TABLE REPLY(
REPLY_SEQ NUMBER,
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
REPLY_STAR_RATE NUMBER,
REPLY_CONTENT VARCHAR2(150 CHAR),
REPLY_DATE DATE,
REPLY_LIKE NUMBER,
REFER NUMBER,
DEPTH NUMBER,
STEP NUMBER,
PRIMARY KEY(REPLY_SEQ)
);

-- 비계층형 포스트 게시판
CREATE TABLE POST(
POST_SEQ NUMBER,
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
POST_TITLE VARCHAR2(100 CHAR),
POST_CONTENTS LONG,
POST_DATE DATE,
POST_VIEWS NUMBER,
POST_UPLOAD_FILE VARCHAR2(100 CHAR),
PRIMARY KEY(POST_SEQ)
);


-- 회원 테이블
CREATE TABLE USERS(
USER_ID VARCHAR2(20 CHAR),
USER_PWD VARCHAR2(20 CHAR),
USER_EMAIL VARCHAR2(50 CHAR),
USER_NAME VARCHAR2(10 CHAR),
USER_IMAGE VARCHAR2(100 CHAR),
PRIMARY KEY(USER_ID)
);


-- 찜 테이블
CREATE TABLE DIBS(
USER_ID VARCHAR2(20 CHAR),--FK
BOOK_SEQ NUMBER,--FK
DIBS_DATE DATE
);

-- 비계층형 공지사항 게시판
CREATE TABLE NOTICE(
NOTICE_SEQ NUMBER,
ADMIN_ID VARCHAR2(20 CHAR),--FK
NOTICE_TITLE VARCHAR2(100 CHAR),
NOTICE_CONTENTS LONG,
NOTICE_DATE DATE,
-- 일단 파일 업로드 없는채로 만들었어요 파일 업로드 기능 넣고싶으시면 컬럼 추가하면 돼요 !
-- NOTICE_UPLOAD_FILE VARCHAR2(100 CHAR),
PRIMARY KEY(NOTICE_SEQ)
);



--관리자 테이블
CREATE TABLE ADMIN(
ADMIN_ID VARCHAR2(20 CHAR),
ADMIN_PWD VARCHAR2(20 CHAR),
PRIMARY KEY(ADMIN_ID)
);


--------- 제약조건 추가 --------------
ALTER TABLE BOOK
ADD CONSTRAINT BOOK_FK1 
FOREIGN KEY(CATEGORY_ID)
REFERENCES CATEGORY(CATEGORY_ID);


ALTER TABLE REPLY
ADD CONSTRAINT REPLY_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE REPLY
ADD CONSTRAINT REPLY_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);



ALTER TABLE POST
ADD CONSTRAINT POST_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE POST
ADD CONSTRAINT POST_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);



ALTER TABLE DIBS
ADD CONSTRAINT DIBS_FK1 
FOREIGN KEY(USER_ID)
REFERENCES USERS(USER_ID);

ALTER TABLE DIBS
ADD CONSTRAINT DIBS_FK2 
FOREIGN KEY(BOOK_SEQ)
REFERENCES BOOK(BOOK_SEQ);

ALTER TABLE DIBS
ADD CONSTRAINT DIBS_PK
PRIMARY KEY(USER_ID, BOOK_SEQ);


ALTER TABLE NOTICE
ADD CONSTRAINT NOTICE_FK1 
FOREIGN KEY(ADMIN_ID)
REFERENCES ADMIN(ADMIN_ID);




select * from users;


------------------------------


-- BOOK 테이블에 RANK 컬럼 추가
ALTER TABLE BOOK ADD(RANK NUMBER);

--CATEGORY 테이블에 데이터 추가 (BOOK INSERT 하기전에 필요함)

INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(101, '소설');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(102, '시/에세이');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(103, '예술/대중문화');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(104, '사회과학');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(105, '역사와 문화');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(107, '잡지');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(108, '만화');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(109, '유아');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(110, '아동');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(111, '가정과 생활');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(112, '청소년');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(113, '초등학습서');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(114, '고등학습서');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(115, '국어/외국어/사전');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(116, '자연과 과학');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(117, '경제경영');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(118, '자기계발');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(119, '인문');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(120, '종교/역학');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(122, '컴퓨터/인터넷');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(123, '자격서/수험서');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(124, '취미/레저');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(125, '전공도서/대학교재');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(126, '건강/뷰티');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(128, '여행');
INSERT INTO CATEGORY(CATEGORY_ID, CATEGORY_TAG) VALUES(129, '중등학습서');

SELECT* FROM CATEGORY;
            

INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, TRANSLATOR, COVER_URL, PUBLISHER,
                CATEGORY_ID, PRICE_STANDARD, PUB_DATE, DESCRIPTION, RANK) 
          VALUES(1, '2', '3', '4', '5', '6', '7', 101, 9, SYSDATE, '11', 12);
          
SELECT* FROM BOOK;


commit;

delete BOOK where category_id=110;

delete users where user_id='admin';

select * from  users;
select * from reply;



































































