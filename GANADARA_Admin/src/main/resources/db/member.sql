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

--비번 암호화 메일 인증
CREATE SEQUENCE MEMBERSEQ;
CREATE TABLE MEMBER(
MEMBER_NO NUMBER PRIMARY KEY,
MEMBER_NAME VARCHAR2(20) NOT NULL,
MEMBER_NIC VARCHAR2(20) NOT NULL,
MEMBER_EMAIL VARCHAR2(20) NOT NULL,
MEMBER_PW VARCHAR2(500), 
MEMBER_TEL VARCHAR2(20),
MEMBER_BIRTH VARCHAR2(20),
MEMBER_CON VARCHAR2(20),
MEMBER_REGDATE DATE NOT NULL,
MEMBER_DEL VARCHAR2(2) NOT NULL,
MEMBER_ROLE VARCHAR2(10) NOT NULL,
MEMBER_DAILY VARCHAR2(2) NOT NULL,
MENTO_NO NUMBER,

MEMBER_KEY VARCHAR(500),  

CONSTRAINT MEM_NIC UNIQUE(MEMBER_NIC),
CONSTRAINT MEN_NO FOREIGN KEY(MENTO_NO) REFERENCES MEMBER(MEMBER_NO)

);
DROP TABLE ORDER_DAILY;
DROP TABLE MULTI_CHAT; 

select * from multi_chat;
select * from ORDER_DAILY;
select * from member
insert into member
values(memberseq.nextval, 'user67', 'lala1', 'hfeeha2@QQ.com', 'user67', '010-2456-3715', 
       '20031228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'Y', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user683', 'ala2', 'hfeeh3a@QQ.com', 'user67', '010-2433-2315', 
       '20021228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'Y', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user672', 'b6', 'hfeeh4a@QQ.com', 'user67', '010-2416-5615', 
       '20011228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'Y', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user671', 'whynot', 'hfeeh5a@QQ.com', 'user69', '010-2452-8615', 
       '20001228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'Y', NULL, 'Y')       
update member
set member_role = 'MENTO' where member_no = 16
--일별 인원수 구하기 
SELECT COUNT(*) AS count, to_char(MEMBER_REGDATE, 'YYYYMMDD') as 가입일
FROM MEMBER
WHERE SUBSTR(MEMBER_REGDATE, 6, 2) = 18
GROUP BY to_char(MEMBER_REGDATE, 'YYYYMMDD')
ORDER BY to_char(MEMBER_REGDATE, 'YYYYMMDD')

SELECT COUNT(*) AS count
FROM MEMBER
WHERE SUBSTR(MEMBER_REGDATE, 7, 2) = 18
GROUP BY to_char(MEMBER_REGDATE, 'YYYYMMDD')

SELECT SUBSTR(MEMBER_REGDATE, 7, 2) FROM MEMBER 

--연령대 별 인원수 (이게 되는데, 지금 2000년 지나서 태어난 사람들의 나이가 오류가 생김)
select count(*) as cnt from (select floor((to_char(sysdate,'YYYY')-((substr(member_birth, 0, 2))+1900))/10)*10 as y
from member) o
where y = 30
group by y




--참고용 
select
count(*) as cnt
from
	(select
		floor((to_char(sysdate, 'YYYY') - substr(member_birth, 0, 4)) / 10) * 10 as y
	from
		m_member
	) o
where y = 30	
group by
	y

select * from member

insert into member
values(memberseq.nextval, 'user1', 'baezzang', 'aaa@aaaa.com', 'user1', '010-0000-0000', 
       '19901128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')

insert into member
values(memberseq.nextval, 'user2', 'BAE', 'BBB@BBBB.com', 'user2', '010-1111-1111', 
       '20021128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user3', 'zzang', 'CCC@CCCC.com', 'user3', '010-2200-2200', 
       '20041128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user4', 'BIGPIG', 'DDD@DDD.com', 'user4', '010-0022-0022', 
       '20021128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user5', 'JENNY', 'EEE@EE.com', 'user5', '010-2020-2020', 
       '20031128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user6', 'WENDY', 'FF@aFFa.com', 'user6', '010-2020-2020', 
       '20011128', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user7', 'IU', 'GGa@GGa.com', 'user7', '010-3300-3300', 
       '20101128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user8', 'ADEL', 'HHH@HHaa.com', 'user8', '010-3030-3030', 
       '19991128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user9', 'TAYLOR', 'IIa@III.com', 'user9', '010-4400-4400', 
       '19921128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user10', 'BIBBER', 'aJJ@JJaa.com', 'user10', '010-4004-0044', 
       '19871128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user11', 'JT', 'LLa@LLa.com', 'user11', '010-5500-0550', 
       '19601128', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user12', 'BUNNY', 'NN@NNaa.com', 'user12', '010-0055-0670', 
       '19761128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user13', 'RABIT', 'MMa@aMMa.com', 'user13', '010-0666-0660', 
       '19351128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
       insert into member
values(memberseq.nextval, 'user24', '짱', 'a@QQ.com', 'user24', '010-6363-3636', 
       '19881228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user14', 'superman', 'OO@OO.com', 'user14', '010-6600-6600', 
       '19651128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user15', 'hahaha', 'PPa@PPa.com', 'user15', '010-6066-6600', 
       '19781128', 'ANTARCTICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user16', 'ido', 'QQa@QQ.com', 'user16', '010-6060-0606', 
       '19881128', 'ANTARCTICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')

       insert into member
values(memberseq.nextval, 'user25', '이', 'hha@QQ.com', 'user26', '010-6566-5676', 
       '19771128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
       insert into member
values(memberseq.nextval, 'user26', 'gn', 'sdfha@QQ.com', 'user26', '010-2536-5645', 
       '20001128', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
       insert into member
values(memberseq.nextval, 'user27', 'lu', 'qweha@QQ.com', 'user27', '010-4436-5785', 
       '20021128', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')

insert into member
values(memberseq.nextval, 'user28', 'lala', 'hfeeha@QQ.com', 'user28', '010-2456-3715', 
       '19831228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user29', 'lla', 'wehfeeha@QQd.com', 'user29', '010-0246-3015', 
       '20031228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user30', '하하', 'ythfeeha@QQ.com', 'user30', '010-2561-3711', 
       '19671228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user31', '호호', 'hfeeha@QQ.com', 'user31', '010-2456-3715', 
       '19981228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')       
insert into member
values(memberseq.nextval, 'user32', '짱이3', 'hfeeha@QQ.com', 'user32', '010-2746-3115', 
       '19931228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user33', '베짱이', 'huwea@QQ.com', 'user33', '010-5246-5315', 
       '19971228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user34', 'lafla', 'mndeeha@QQ.com', 'user34', '010-2454-6716', 
       '19891228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user35', 'merong', 'kjeeha@QQ.com', 'user35', '010-2450-3705', 
       '19851228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user36', 'nubza', 'kqeeha@QQ.com', 'user36', '010-2786-5715', 
       '20001228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user37', 'mery', 'kieeha@QQ.com', 'user37', '010-2411-4715', 
       '20021228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user38', '돼지', 'h12fheha@QQ.com', 'user38', '010-2156-1715', 
       '2003128', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user39', '꾸질이', 'yeeha@QQ.com', 'user39', '010-2346-7895', 
       '19501228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user40', '함마', 'yreha@QQ.com', 'user40', '010-2400-3707', 
       '19551228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user41', 'rol', 'trfeeha@QQ.com', 'user41', '010-9956-8715', 
       '19991228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user42', 'wha', 'h21eha@QQ.com', 'user42', '010-2452-3125', 
       '20011228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user43', 'hing', 'hfeqwa@QQ.com', 'user43', '010-6556-7615', 
       '20031228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user44', 'zib', 'hfereeha@QQ.com', 'user44', '010-2411-3115', 
       '20001228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user45', 'cuwar', 'wqhfeeha@QQ.com', 'user45', '010-2426-0715', 
       '19981228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user46', 'huu', 'uyhfeeha@QQ.com', 'user46', '010-1456-9715', 
       '19971228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user47', 'sal', 'tihfeeha@QQ.com', 'user47', '010-2557-7715', 
       '19961228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user48', 'tal', 'yhfeeha@QQ.com', 'user48', '010-3456-6715', 
       '19901228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user49', 'zu', 'hfegteha@QQ.com', 'user49', '010-2451-3712', 
       '19911228', 'AUSTRALIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user50', 'lala', 'mjhfeeha@QQ.com', 'user50', '010-2456-3715', 
       '19941228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user51', 'lala', 'hfeeha@QQ.com', 'user51', '010-2456-3715', 
       '19951228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user52', 'lala', 'hfeeha@QQ.com', 'user52', '010-2456-3715', 
       '19941228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user53', 'lala', 'hfeeha@QQ.com', 'user53', '010-2456-3715', 
       '19951228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user54', 'lala', 'hfeeha@QQ.com', 'user54', '010-2456-3715', 
       '19971228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user55', 'lala', 'hfeeha@QQ.com', 'user55', '010-2456-3715', 
       '19961228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user56', 'lala', 'hfeeha@QQ.com', 'user56', '010-2456-3715', 
       '19881228', 'EUROPE', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user57', 'lala', 'hfeeha@QQ.com', 'user57', '010-2456-3715', 
       '19891228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user58', 'lala', 'hfeeha@QQ.com', 'user58', '010-2456-3715', 
       '19791228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user59', 'lala', 'hfeeha@QQ.com', 'user59', '010-2456-3715', 
       '19781228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user60', 'lala', 'hfeeha@QQ.com', 'user60', '010-2456-3715', 
       '19771228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user61', 'lala', 'hfeeha@QQ.com', 'user61', '010-2456-3715', 
       '19801228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user62', 'lala', 'hfeeha@QQ.com', 'user62', '010-2456-3715', 
       '19811228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user63', 'lala', 'hfeeha@QQ.com', 'user63', '010-2456-3715', 
       '19821228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user64', 'lala', 'hfeeha@QQ.com', 'user64', '010-2456-3715', 
       '19931228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user65', 'lala', 'hfeeha@QQ.com', 'user65', '010-2456-3715', 
       '19921228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user66', 'lala', 'hfeeha@QQ.com', 'user66', '010-2456-3715', 
       '20051228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user67', 'lala', 'hfeeha@QQ.com', 'user67', '010-2456-3715', 
       '20031228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user68', 'lala', 'hfeeha@QQ.com', 'user68', '010-2456-3715', 
       '19671228', 'NORTH AMERICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user69', 'lala', 'hfeeha@QQ.com', 'user69', '010-2456-3715', 
       '19661228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user70', 'lala', 'hfeeha@QQ.com', 'user70', '010-2456-3715', 
       '19651228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user71', 'lala', 'hfeeha@QQ.com', 'user71', '010-2456-3715', 
       '19561228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user72', 'lala', 'nhfeeha@QQ.com', 'user72', '010-2456-3715', 
       '19551228', 'ASIA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user73', 'lala', 'uhfeeha@QQ.com', 'user73', '010-2456-3715', 
       '20011228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user74', 'lala', 'yhfeeha@QQ.com', 'user74', '010-2456-3715', 
       '20001228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user75', 'lala', 'hfeeha@QQ.com', 'user75', '010-2456-3715', 
       '20021228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user76', 'lala', 'qhfeeha@QQ.com', 'user76', '010-2456-3715', 
       '20011228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user77', 'lala', 'whfeeha@QQ.com', 'user77', '010-2456-3715', 
       '20001228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
insert into member
values(memberseq.nextval, 'user78', 'lala', 'rhfeeha@QQ.com', 'user78', '010-2456-3715', 
       '19991228', 'AFRICA', SYSDATE, 'N', 'USER', 'N', NULL, 'Y')
       
       
SELECT COUNT(*) FROM MEMBER WHERE MEMBER_CON = 'ASIA'   
DELETE FROM MEMBER WHERE MEMBER_NIC = 'BIGPIG'


      