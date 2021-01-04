CREATE SEQUENCE DSNOSEQ;
CREATE TABLE DAILY_SERVICE(
	DS_NO NUMBER PRIMARY KEY,
	DS_NAME VARCHAR2(500) NOT NULL,
	DS_PRICE NUMBER NOT NULL,
	DS_TERM NUMBER NOT NULL

);

INSERT INTO DAILY_SERVICE
VALUES(DSNOSEQ.NEXTVAL, '1개월 첨삭 서비스', '1000', '30');