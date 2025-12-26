WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    WHERE
        job_title_short = '%Data Analyst%'
    GROUP BY
        company_id
)

SELECT
    cd.name AS company_name,
    cjc.total_jobs
FROM company_dim AS cd
LEFT JOIN company_job_count AS cjc ON cjc.company_id = cd.company_id
WHERE
    cjc.total_jobs IS NOT NULL
ORDER BY
    total_jobs DESC;