
-- All Data Scientist jobs in the UK with or without the salary
---To perform the analysis I am using CTE
WITH all_DS_jobs AS (
    SELECT  job_id,
            job_title,
            job_title_short,
            job_location,
            name AS company_name,
            job_schedule_type,
            salary_year_avg,
            job_posted_date
    FROM job_postings_fact AS j
    LEFT JOIN company_dim AS c ON c.company_id = j.company_id
    WHERE   job_title LIKE '%Data Scientist%' 
        AND job_title_short = 'Data Scientist'
        AND (job_location LIKE '%UK%' 
        OR job_location LIKE  '%United Kingdom%')
---6662 posts
)
-- top 10 Skills required for data scientist jobs
SELECT
    skills, count(t.job_id) AS job_count
FROM
    all_DS_jobs AS t
	INNER JOIN
    skills_job_dim AS sj ON t.job_id = sj.job_id
	INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
GROUP BY skills
ORDER BY 2 DESC
LIMIT 10;
