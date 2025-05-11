---Include the salary range
---Order by salary
---In the UK

SELECT job_title_short, 
    count(job_id) AS job_count, 
    MIN(salary_year_avg) AS min_yearly_salary, 
    MAX(salary_year_avg) AS max_yearly_salary,
    ROUND(AVG(salary_year_avg), 1) AS average_yearly_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
        AND (job_location LIKE '%UK%' 
        OR job_location LIKE  '%United Kingdom%')
GROUP BY job_title_short
ORDER BY average_yearly_salary DESC;