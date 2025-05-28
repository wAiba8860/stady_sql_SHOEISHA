--◯良い例
SELECT
    col_1,
    col_2,
    col_3,
    count(*)
FROM
    tbl_A
WHERE
    col_1 = 'a'
    AND col_2 = (
        SELECT
            max(col_2)
        FROM
            tbl_B
        WHERE
            col_3 = 100
    )
GROUP BY
    col_1,
    col_2,
    col_3;

--悪い例
'SELECT col_1,col_2,col_3,COUNT(*)
FROM tbl_A
WHERE col_1 = ' a '
AND col_2 = (SELECT MAX(col_2)
FROM tbl_B
WHERE col_3 = 100)
GROUP BY col_1,col_2,col_3;'