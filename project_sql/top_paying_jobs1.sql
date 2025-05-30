/*
Question: What are the top paying jobs data analyst jobs?
- Identify the top 10 highest paying Data Analyst roles that are available remotely.
- Focuses on job postings with specific salaries (remove nulls).
- Why? Highlight the top paying opportunites for Data Analysts, offering insights into employment opportunities  
*/

SELECT
    job_id,
    name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10