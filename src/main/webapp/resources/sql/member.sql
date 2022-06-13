DROP TABLE MEMBER_LOG;
DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
    MEMBER_NO NUMBER PRIMARY KEY,
    ID VARCHAR2(32 BYTE) NOT NULL UNIQUE,
    NAME VARCHAR2(100 BYTE),
    GENDER VARCHAR2(1 BYTE),
    ADDRESS VARCHAR2(1OO BYTE)
);

DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ NOCACHE;