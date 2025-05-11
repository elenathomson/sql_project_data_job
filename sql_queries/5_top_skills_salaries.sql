---average salary for the skills needed for Data Scientist in the UK
---also add limits on lower counts such as min appearance 3 times

SELECT
    skills, count(j.job_id) AS job_count, ROUND(AVG(j.salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact AS j
	INNER JOIN
    skills_job_dim AS sj ON j.job_id = sj.job_id
	INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE   job_title LIKE '%Data Scientist%' 
        AND job_title_short = 'Data Scientist'
        AND (job_location LIKE '%UK%' OR job_location LIKE  '%United Kingdom%')
        AND j.salary_year_avg IS NOT NULL 
GROUP BY skills
HAVING count(j.job_id) > 2
ORDER BY 3 DESC
LIMIT 20;