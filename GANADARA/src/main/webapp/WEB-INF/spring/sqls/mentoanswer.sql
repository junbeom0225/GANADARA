DROP SEQUENCE MENTOANSWERSEQ
DROP TABLE MENTO_ANSWER

CREATE SEQUENCE MENTOANSWERSEQ;

CREATE TABLE MENTO_ANSWER(
	MA_NO NUMBER NOT NULL,
	DB_NO NUMBER NOT NULL,
	MA_WRITER VARCHAR2(500) NOT NULL,
	MA_CONTENT VARCHAR2(4000) NOT NULL,
	MA_DATE DATE NOT NULL,
	
	CONSTRAINT MA_NO_PK PRIMARY KEY(MA_NO),
	CONSTRAINT DAILY_FK_DB_NO FOREIGN KEY(DB_NO)
		REFERENCES DAILY_BOARD(DB_NO) ON DELETE CASCADE
)

CREATE TABLE MENTO_ANSWER(
	MA_NO NUMBER NOT NULL,
	DB_NO NUMBER NOT NULL,
	MEMBER_NIC VARCHAR2(20) NOT NULL,
	MA_CONTENT VARCHAR2(4000) NOT NULL,
	MA_DATE DATE NOT NULL,
	
	CONSTRAINT MA_NO_PK PRIMARY KEY(MA_NO),
	CONSTRAINT DAILY_FK_DB_NO FOREIGN KEY(DB_NO)
		REFERENCES DAILY_BOARD(DB_NO) ON DELETE CASCADE,
	CONSTRAINT MEMBER_NIC_FK FOREIGN KEY(MEMBER_NIC)
		REFERENCES MEMBER(MEMBER_NIC) ON DELETE CASCADE,
		CONSTRAINT MEMBER_FK_NO FOREIGN KEY(MEMBER_NO)
		REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE
)
SELECT * FROM MENTO_ANSWER

INSERT INTO MENTO_ANSWER
VALUES(MENTOANSWERSEQ.NEXTVAL, 2, 'MENTO_TEST', 'mento_TEST',1, SYSDATE)

INSERT INTO MENTO_ANSWER(MA_NO, DB_NO, MEMBER_NO, MA_CONTENT, MA_DATE)
VALUES(MENTOANSWERSEQ.NEXTVAL, 2, 'USER_TEST', 'USER_TEST', SYSDATE)

INSERT INTO MENTO_ANSWER
VALUES(MENTOANSWERSEQ.NEXTVAL, 2, 'USER_TEST', 'USER_TEST',1, SYSDATE)