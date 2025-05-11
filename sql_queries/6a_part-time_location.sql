---I want to know more about location
  -- All Data Scientist jobs in the UK with or without salary
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


----SELECT all part time job
SELECT job_location, count(job_id)
FROM all_DS_jobs AS t
WHERE job_schedule_type ILIKE ('%part%')
GROUP BY job_location
ORDER BY 2 DESC
LIMIT 20;