---Count the most common job titles in the database in the UK

SELECT     job_title_short, count(job_id) AS job_count
FROM       job_postings_fact
WHERE      job_location LIKE '%UK%' 
        OR job_location LIKE  '%United Kingdom%'
GROUP BY   job_title_short
ORDER BY 2 DESC;