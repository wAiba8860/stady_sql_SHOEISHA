SELECT
    project_id
FROM
    Projects
GROUP BY
    project_id
HAVING
    count(*) = sum(
        CASE
            WHEN step_nbr <= 1
            AND status = '完了' THEN 1
            WHEN step_nbr > 1
            AND status = '待機' THEN 1
            ELSE 0
        END
    );

SELECT
    *
FROM
    Projects P1
WHERE
    NOT EXISTS (
        SELECT
            status
        FROM
            Projects P2
        WHERE
            P1.project_id = P2.project_id
            AND status <> CASE
                WHEN step_nbr <= 1 THEN '完了'
                ELSE '待機'
            END
    );