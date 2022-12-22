USE hr;
SELECT first_name as "First Name",last_name as "Last Name"
FROM employees;

SELECT DISTINCT department_id 
FROM employees;

SELECT * 
FROM employees 
ORDER BY first_name DESC;

SELECT first_name, last_name, salary, salary*.15 PF 
FROM employees;

SELECT employee_id, first_name, last_name, salary 
FROM employees
ORDER BY salary;

/*---Q6 : Write a query to get the total salaries --- Ans : 691400 */
SELECT SUM(salary) 
FROM employees; 

/*---Q7 : Write a query to get the maximum and minimum salaries  ---  Ans : MAX(SALARY)=(24000),MIN(SALARY)=(2100)*/
SELECT MAX(salary), MIN(salary) 
FROM employees;

/*---Q8 : Write a query to get the average salary and number of employees --- Ans : AVG(salary)=6461.68 , number of employee=107*/
SELECT AVG(salary),count(*)
FROM employees;

/*---Q9 : Write a query to get the number of employees working with the company --- Ans : 107 */
SELECT COUNT(*) 
FROM employees;

/*---Q10 : Write a query to get the number of jobs available in the employees table --- Ans : 19 */
SELECT COUNT(DISTINCT job_id) 
FROM employees;

SELECT UPPER(first_name) 
FROM employees;   

SELECT SUBSTRING(first_name,1,3) 
FROM employees; 

SELECT TRIM(first_name) 
FROM employees;

SELECT first_name,last_name, LENGTH(first_name)+LENGTH(last_name)  
FROM employees;

SELECT * 
FROM employees 
WHERE  first_name REGEXP  '[0-9]';
 
SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000 ;

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY  department_id  ASC;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000 
AND department_id IN (30, 100); 
 
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE YEAR(hire_date)  LIKE '1987%';

SELECT first_name
FROM employees
WHERE first_name LIKE '%b%'
AND first_name LIKE '%c%';

SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('IT_PROG', 'SH_CLERK')
AND salary NOT IN (4500,10000, 15000);

SELECT last_name 
FROM employees
WHERE last_name LIKE '______'

SELECT last_name
FROM employees
WHERE last_name LIKE '__e%';

SELECT job_id, GROUP_CONCAT(employee_id, ' ')  'Employees ID' 
FROM employees GROUP BY job_id;

UPDATE employees 
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

SELECT * 
FROM employees
WHERE LENGTH(first_name) >= 8;
   
UPDATE employees  
SET email = CONCAT(email, '@example.com');

SELECT RIGHT(phone_number, 4) as 'Ph.No.' 
FROM employees;

SELECT location_id, street_address, 
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1) 
AS 'Last--word-of-street_address' 
FROM locations;

SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);

SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1)
FROM jobs;

SELECT first_name, last_name
FROM employees WHERE INSTR(last_name,'C') > 2;

SELECT first_name "Name",
LENGTH(first_name) "Length"
FROM employees
WHERE first_name LIKE 'J%'
OR first_name LIKE 'M%'
OR first_name LIKE 'A%'
ORDER BY first_name ;

SELECT first_name,
LPAD(salary, 10, '$') SALARY
FROM employees;

SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000)) 
'SALARY($)', salary
FROM employees
ORDER BY salary DESC;

SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;
   