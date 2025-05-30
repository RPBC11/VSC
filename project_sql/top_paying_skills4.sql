/* 
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analysy postitions
- Focus on roles with specific salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
helps identifies the most financially rewarding skills to acquire and improve on
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25