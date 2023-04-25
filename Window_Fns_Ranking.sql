SELECT Emp_ID, Emp_Name, Dept_ID, Salary, 
ROW_NUMBER() OVER(ORDER BY Salary DESC, Emp_Name ASC) AS Row_Num_Rank, /*continuous ranking, no repeats*/
RANK() OVER(ORDER BY Salary DESC, Emp_Name ASC) AS Rank_Rank /*repeats and skips*/,
DENSE_RANK() OVER(ORDER BY Salary DESC, Emp_Name ASC) AS Dense_Rank_Rank /*repeats and no skips*/,
NTILE(4) OVER(ORDER BY Salary DESC, Emp_Name ASC) AS Qrt
FROM emp;

/*Department wise ranking */
SELECT Emp_ID, Emp_Name, Dept_ID, Salary, 
ROW_NUMBER() OVER(PARTITION BY Dept_ID ORDER BY Salary DESC, Emp_Name ASC) AS Row_Num_Rank,
RANK() OVER(PARTITION BY Dept_ID ORDER BY Salary DESC, Emp_Name ASC) AS Rank_Rank,
DENSE_RANK() OVER(PARTITION BY Dept_ID ORDER BY Salary DESC, Emp_Name ASC) AS Dense_Rank_Rank,
NTILE(4) OVER(PARTITION BY Dept_ID ORDER BY Salary DESC, Emp_Name ASC) AS Qrt
FROM emp;
