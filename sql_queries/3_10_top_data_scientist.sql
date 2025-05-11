---10 Top paid jobs posts for Data Scientist in the UK

SELECT      job_title,
            job_location,
            name AS company_name,
            job_schedule_type,
            salary_year_avg,
FROM        job_postings_fact AS j
LEFT JOIN   company_dim AS c ON c.company_id = j.company_id
WHERE       job_title LIKE '%Data Scientist%' 
        AND job_title_short = 'Data Scientist'
        AND (job_location LIKE '%UK%' 
        OR  job_location LIKE  '%United Kingdom%')
        AND salary_year_avg IS NOT NULL
ORDER BY    salary_year_avg DESC
LIMIT 10