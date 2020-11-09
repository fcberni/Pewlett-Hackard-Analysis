--Mod 7 Challenge 

--Deliverable 1

--Creating titles_info table
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.titles,
    t.from_date,
    t.to_date
INTO titles_info
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
    
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (t.emp_no) t.emp_no,
	t.first_name,
	t.last_name,
	t.titles
INTO unique_titles
FROM titles_info as t
ORDER BY emp_no, titles DESC;

Select * from unique_titles
Select COUNT (titles) from unique_titles

--Retireving number of employees by their most recent job title
SELECT COUNT(ut.titles), ut.titles
INTO retirement_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY COUNT DESC;

--Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
	t.titles
INTO mentors_info
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (de.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no