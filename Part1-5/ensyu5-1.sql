SELECT DISTINCT
    KE
FROM
    ArrayTbl2 AT1
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            ArrayTbl2 AT2
        WHERE
            AT1.KE = AT2.KE
            AND (
                AT2.val <> 1
                OR AT2.val IS NULL
            )
    );

SELECT
    *
FROM
    Projects P1
WHERE
    '〇' = ALL (
        SELECT
            CASE
                WHEN step_nbr <= 1
                AND status = '完了' THEN '〇'
                WHEN step_nbr > 1
                AND status = '待機' THEN '〇'
                ELSE '✕'
            END AS check_result
        FROM
            Projects P2
        WHERE
            P1.project_id = P2.project_id
    );

SELECT
    num
FROM
    Numbers N1
WHERE
    num > 1
    AND NOT EXISTS (
        SELECT
            *
        FROM
            Numbers N2
        WHERE
            N2.num > 1
            AND N2.num < N1.num
            AND mod(N1.num, N2.num) = 0
    );