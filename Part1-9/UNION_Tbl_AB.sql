SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            tbl_A
        UNION
        SELECT
            *
        FROM
            tbl_B
    ) TMP;

SELECT
    CASE
        WHEN count(*) = 0 THEN '等しい'
        ELSE '異なる'
    END AS RESULT
FROM
    (
        (
            SELECT
                *
            FROM
                tbl_A
            UNION
            SELECT
                *
            FROM
                tbl_B
        )
        EXCEPT
        (
            SELECT
                *
            FROM
                tbl_A
            INTERSECT
            SELECT
                *
            FROM
                tbl_B
        )
    ) TMP;

(
    SELECT
        *
    FROM
        tbl_A
    EXCEPT
    SELECT
        *
    FROM
        tbl_B
)
UNION ALL
(
    SELECT
        *
    FROM
        tbl_B
    EXCEPT
    SELECT
        *
    FROM
        tbl_A
);
