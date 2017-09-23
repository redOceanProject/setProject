DROP TABLE member;
DROP TABLE reply;
DROP TABLE mainboard;
DROP SEQUENCE mainboardnum_seq;
DROP SEQUENCE replynum_seq;


-- 1. 회원가입
CREATE TABLE member
(
	email varchar2(40) PRIMARY KEY,
	password varchar2(20) not null,
	name varchar2(20) not null,
	type number(2) 			-- 회원구분 : (탈퇴회원), (일반회원)
);

-- 2. 메인게시판
CREATE TABLE mainboard 
(
	boardnum number(3) PRIMARY KEY,
	email varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	title varchar2(30) NOT NULL,
	content varchar2(4000) NOT NULL,
	inputdate date default sysdate,
	goal_date date NOT NULL,
	hits number default 0,
	originalfile varchar2(300),
	savedfile varchar2(300),
	sickName varchar2(30),
	status number(1) default 0,
	goal_blood number(3) NOT NULL,
	blood_present number(3)
	
);


CREATE SEQUENCE mainboardnum_seq start with 1 increment by 1;

-- 3. Reply
CREATE TABLE reply
(
	replynum number(4) PRIMARY KEY,
	email varchar2(20) NOT NULL,
	text varchar2(200)  NOT NULL,
	inputdate date default sysdate,
	boardnum number NOT NULL,
	constraint reply_boardnum_fk FOREIGN KEY(boardnum) references mainboard(boardnum) on delete cascade
);

CREATE SEQUENCE replynum_seq start with 1 increment by 1;







