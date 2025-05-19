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