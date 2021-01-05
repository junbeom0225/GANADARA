DROP SEQUENCE CALSEQ;
DROP TABLE CALENDAR;

CREATE SEQUENCE CALSEQ;

CREATE TABLE CALENDAR(
	CAL_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBERT FOREIGN KEY,
	CAL_TITLE VARCHAR2(500) NOT NULL,
	CAL_CONTENT VARCHAR2(4000),
	CAL_MDATE DATE NOT NULL,
	CAL_REGDATE DATE NOT NULL
);