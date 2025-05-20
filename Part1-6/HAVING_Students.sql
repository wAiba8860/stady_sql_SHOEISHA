SELECT
    dpt
FROM
    Students
GROUP BY
    dpt
HAVING
    count(*) = count(sbmt_date);

SELECT
    dpt
FROM
    Students
GROUP BY
    dpt
HAVING
    count(*) = sum(
        CASE
            WHEN sbmt_date IS NOT NULL THEN 1
            ELSE 0
        END
    );