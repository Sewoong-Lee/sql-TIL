--SQL
--DML : ������ ���۾�
-- ���ڿ� ��������, ���� ������ ����
--��ȸ
SELECT COUNTRY_NAME, COUNTRY_ID  
FROM COUNTRIES
WHERE COUNTRY_ID = 'CA';

SELECT * FROM JOBS
WHERE MIN_SALARY <= 5000
OR MAX_SALARY > 20000
ORDER BY MAX_SALARY ;  --��������

--�ǽ�) EMPLOYEES���̺��� ��� ID�� �̸��� ��� ��ȸ
-- ����� 10000�̻��� �����
-- ����� ������������ ����

SELECT employee_id, FIRST_NAME , SALARY
FROM EMPLIYEES  
WHERE SALARY > 10000  --���� �� �̻�  --����
ORDER BY SALARY DESC; --�������� ����


-- EMPLOYEES���̺��� �� ���̵� PROG�� ����� ��ȸ
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';  -- =���ٸ�


-- EMPLOYEES ���̺��� EMPLOYEE_ID�� 200 �̻��� ���
-- EMPLOYEE_ID�� ������������ ����
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID > 200
ORDER BY EMPLOYEE_ID;  --��������

--�ؼ�
SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 200
ORDER BY EMPLOYEE_ID;  --��������


-- EMPLOYEES ���̺��� EMPLOYEE_ID,  HIRE_DATE ��ȸ
-- ����Ʈ�� ���� FROM�� �ʼ�
-- TO_CHAR()�Լ��� �̿��Ͽ� ��¥ ���� ���� (���ڿ��� ����)
-- 2005�� 1�� 1�� ���� �Ի�,  SALARY�� 8000 ���� �� ���

SELECT EMPLOYEE_ID, TO_CHAR(HIRE_DATE,'YYYY-MM-DD') 
FROM EMPLOYEES
WHERE HIRE_DATE > '2005-01-01'  --���ڿ��� �Է��ص� �˾Ƽ� �ҷ���
AND SALARY <= 8000 ; --WHERE ���ǹ� ���� �׸���(AND)�� ���� ���ǹ�


-- EMPLOYEES ���̺��� EMPLOYEE_ID, MANAGER_ID ��ȸ
-- MANAGER_ID�� 147�� �� ���
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 147;


--���̺� ���� Ȯ��
DESC EMPLOYEES; 


-- EMPLOYEES ���̺��� MANAGER_ID  147���� ����� ��
-- COUNT(*) : ���� �Լ�, �Ǽ�   (���� ���� ����� �˷���)
SELECT COUNT(*) AS CNT  -- CNT��� �ʵ���� �������
FROM EMPLOYEES
WHERE MANAGER_ID = 147;


-- EMPLOYEES ���̺��� SALARY�� 10000 �̻� �̰ų� 5000 ������ ����� ��
SELECT COUNT(*) SAL  -- SAL��� �ʵ���� ������� / AS ���� ����
FROM EMPLOYEES
WHERE SALARY >= 10000
OR SALARY <= 5000;


-- EMPLOYEES ���̺��� JOB_ID�� IT_PROG�� SALARY�� �հ�, ����� ��, ���, ������ ���� ū ����, ���� ���� ����
-- SUM : �����Լ� : �հ�, AVG (���) , MAX(�ִ밪), MIN(�ּҰ�)
--��� ���ϴ� 2���� ��� : SUM(SALARY) / COUNT(*) , AVG (SALARY)
SELECT SUM(SALARY) , COUNT(*) , SUM(SALARY) / COUNT(*) , AVG (SALARY) , MAX(salary), MIN(salary)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';


--�ǽ�) DEPARTMENTS ���̺��� ���� ����
SELECT COUNT(*)
FROM DEPARTMENTS;

--�ǽ�) JOBS ���̺��� MIN_SLARY�� 5000 �̸��� ��
SELECT COUNT(*)
FROM JOBS
WHERE MIN_SALARY <5000;

--�ǽ�) EMPLOYEES ���̺��� HIRE_DATE �� '20050101' �����̰� SALARY�� 10000 �̻� 20000������ ����� ��
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '20050101'
AND SALARY BETWEEN 10000 AND 20000;  --BETWEEN ���̰�


-- EMPLOYEES ���̺��� EMPLOYEE_ID, JOB_ID ��ȸ ����
-- JOB_ID �� 'IT_PROG'�� ����� ��
--�׷��� ���� ���μ� ī��Ʈ�� �Բ� ���
SELECT JOB_ID, COUNT(*) CNT
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%'  -- ����ũ ���ǹ� (S�� �����ϴ�)
GROUP BY JOB_ID  --�׷��� �����߸� ī��Ʈ �տ� ���� �� �ִ�.
HAVING COUNT(*) >= 5  -- �׷������ ����� ���� ���ǹ�  (����� CNT �ȵ�)
ORDER BY CNT;



--������ �д� ����
SELECT JOB_ID, COUNT(*) CNT  --4, �̸� ���� 6��
FROM EMPLOYEES  --1��
WHERE JOB_ID LIKE 'S%' --2��
GROUP BY JOB_ID  --3��
HAVING COUNT(*) >= 5  --5��
ORDER BY CNT;  --7��






















