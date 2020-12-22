DROP SEQUENCE MEMBERSEQ;
DROP TABLE MEMBER;

CREATE SEQUENCE MEMBERSEQ;
CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_NAME VARCHAR2(20) NOT NULL,
	MEMBER_NIC VARCHAR2(20) NOT NULL,
	MEMBER_EMAIL VARCHAR2(20) NOT NULL,
	MEMBER_PW VARCHAR2(20),
	MEMBER_TEL VARCHAR2(20),
	MEMBER_BIRTH VARCHAR2(20),
	MEMBER_CON VARCHAR2(20),
	MEMBER_REGDATE DATE NOT NULL,
	MEMBER_DEL VARCHAR2(2) NOT NULL,
	MEMBER_ROLE VARCHAR2(10) NOT NULL,
	MEMBER_DAILY VARCHAR2(2) NOT NULL,
	MENTO_NO NUMBER,
	
	CONSTRAINT MEM_NIC UNIQUE(MEMBER_NIC),
	CONSTRAINT MEM_NO FOREIGN KEY(MENTO_NO) REFERENCES MEMBER(MEMBER_NO)
);

select * from member

--일별 인원수 구하기 
SELECT COUNT(*) AS count, to_char(MEMBER_REGDATE, 'YYYYMM') as 가입일
FROM MEMBER
WHERE SUBSTR(MEMBER_REGDATE, 4, 2) = 12
GROUP BY to_char(MEMBER_REGDATE, 'YYYYMM')



insert into member
values(memberseq.nextval, 'user1', 'baezzang', 'aaa@aaaa.com', 'user1', '010-0000-0000', 
       '901128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)

insert into member
values(memberseq.nextval, 'user2', 'BAE', 'BBB@BBBB.com', 'user2', '010-1111-1111', 
       '801128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user3', 'zzang', 'CCC@CCCC.com', 'user3', '010-2200-2200', 
       '791128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user4', 'BIGPIG', 'DDD@DDD.com', 'user4', '010-0022-0022', 
       '681128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user5', 'JENNY', 'EEE@EE.com', 'user5', '010-2020-2020', 
       '5601128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user6', 'WENDY', 'FF@aFFa.com', 'user6', '010-2020-2020', 
       '471128', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user7', 'IU', 'GGa@GGa.com', 'user7', '010-3300-3300', 
       '101128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user8', 'ADEL', 'HHH@HHaa.com', 'user8', '010-3030-3030', 
       '991128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user9', 'TAYLOR', 'IIa@III.com', 'user9', '010-4400-4400', 
       '921128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user10', 'BIBBER', 'aJJ@JJaa.com', 'user10', '010-4004-0044', 
       '871128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user11', 'JT', 'LLa@LLa.com', 'user11', '010-5500-0550', 
       '601128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user12', 'BUNNY', 'NN@NNaa.com', 'user12', '010-0055-0670', 
       '761128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user13', 'RABIT', 'MMa@aMMa.com', 'user13', '010-0666-0660', 
       '351128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user14', 'superman', 'OO@OO.com', 'user14', '010-6600-6600', 
       '651128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user15', 'hahaha', 'PPa@PPa.com', 'user15', '010-6066-6600', 
       '781128', 'ANTARCTICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user16', 'ido', 'QQa@QQ.com', 'user16', '010-6060-0606', 
       '881128', 'ANTARCTICA', SYSDATE, 'N', 'USER', 'N', NULL)
insert into member
values(memberseq.nextval, 'user24', '짱', 'a@QQ.com', 'user24', '010-6363-3636', 
       '881128', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL)
       insert into member
values(memberseq.nextval, 'user25', '이', 'hha@QQ.com', 'user26', '010-6566-5676', 
       '771128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL)
       insert into member
values(memberseq.nextval, 'user26', 'gn', 'sdfha@QQ.com', 'user26', '010-2536-5645', 
       '001128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL)
       insert into member
values(memberseq.nextval, 'user27', 'lu', 'qweha@QQ.com', 'user27', '010-4436-5785', 
       '021128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL)

SELECT COUNT(*) FROM MEMBER WHERE MEMBER_CON = 'ASIA'   
DELETE FROM MEMBER WHERE MEMBER_NIC = 'BIGPIG'


      