-- 1.	Display the records of job clerk and manager for deptno 20.--
SELECT 
    *
FROM
    emp
WHERE
    (job = 'CLERK' OR job = 'MANAGER')
        AND deptno = 20;

-- 2.	Display the records for the employees, which have the last character as R or H in their name.
SELECT 
    *
FROM
    emp
WHERE
    (ename LIKE '%R') OR (ename LIKE '%H');

-- 3.	Display the records of the employees earning sal less than 1000 and there is no comm provided.-- 
SELECT 
    *
FROM
    emp
WHERE
    sal < 1000 AND comm IS NULL;

-- 4.	Produce the following output:
SELECT 
    CONCAT(UPPER(ename),
            'is from the deptno',
            deptno,
            ', earns salary',
            sal) AS Details
FROM
    emp;
 
--  5.	Display the ename, sal, comm,  sal+comm. For the null value of commission 10% of sal should be used.
	SELECT 
    CONCAT(UPPER(ename),
            'is from the deptno',
            deptno,
            ', earns salary',
            sal) AS Details
FROM
    emp;
    
    -- 6.	Display the names, sal, job, deptno and raise in the salary.
SELECT 
    ename,
    sal,
    job,
    deptno,
    CASE
        WHEN deptno = 20 AND job = 'CLERK' THEN sal * 0.3
        WHEN deptno = 20 AND job = 'ANALYST' THEN sal * 0.5
        WHEN deptno = 30 AND job = 'MANAGER' THEN sal * 0.6
        WHEN deptno = 30 AND job = 'SALESMAN' THEN sal * 0.7
        WHEN deptno = 10 AND job = 'CLERK' THEN sal * 0.1
        ELSE 500
    END AS 'raise'
FROM
    emp;

-- Display the records of employees from the job Clerk earning salary above 1000 as well as all Managers earning salary above 2900.
SELECT 
    *
FROM
    emp
WHERE
    (job = 'CLERK' AND sal > 1000)
        OR (job = 'MANAGER' AND sal > 2900);

-- Display the records sorted as per the job. Make sure that within each job the records are sorted as per the highest to lowest commissions.
SELECT 
    *
FROM
    emp
ORDER BY job , sal DESC;

-- 	Display name, salary, 30% of salary as tax and salary – tax as take home salary for records of employee table working in deptno 20.
SELECT 
    *
FROM
    emp
WHERE
    job = 'SALESMAN' AND deptno = 20

-- 	Display records from emp table of all Salesman from deptno 20 only.
SELECT 
    *
FROM
    emp
WHERE
    job = 'SALESMAN' AND deptno = 20

-- 	Display records from emp table of all those employees who are not reporting to anyone.	
SELECT 
    *
FROM
    emp
WHERE
    MGR IS NULL

--  Display records from emp table of those employees who are earning salary less than or equal to 2000. Records should be sorted as per deptno, and within deptno as per their salaries highest to lowest.
	SELECT 
    *
FROM
    emp
WHERE
    sal <= 2000
ORDER BY deptno , sal DESC

-- Display Name, Salary, Commission and Total as Salary + 30% of Commission for all those employees whose difference between Salary and Commission is less than or equal to 1200.
SELECT 
    ename, sal, comm, sal + 0.3 * comm AS 'Total'
FROM
    emp
WHERE
    (sal - comm) <= 1200

-- 	Produce the exact same output as shown below
SELECT 
    CONCAT(SUBSTRING(ename, 1, 1),
            LOWER(SUBSTRING(ename, 2)),
            '\'s salary is',
            sal) AS 'Salary Details'
FROM
    emp