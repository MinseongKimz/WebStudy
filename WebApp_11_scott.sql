SELECT USER
FROM DUAL;


SELECT USER
FROM DUAL;


--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.





--�� ����Ʈ ��ȸ ������ ����
--  (��ȣ, �̸�, ��������, ��������, ��������, ����, ���)
SELECT SID, NAME, KOR, ENG, MAT
     , (KOR+ENG+MAT) AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
FROM TBL_SCORE
ORDER BY SID;
--> ���� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID
;

--�� ������ �Է� ������ ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '������', 90,80,70 );
-- ���� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 90,80,70 )
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�Ӽҹ�', 80,70,60 )
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�����', 70,60,50 )
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT*
FROM TBL_SCORE;
/*
1	������	90	80	70
2	�Ӽҹ�	80	70	60
3	�����	70	60	50
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;

