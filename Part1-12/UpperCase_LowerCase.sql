--◯メリハリがあって読みやすい
SELECT
    col_1,
    col_2,
    col_3,
    COUNT(*)
FROM
    tbl_A
WHERE
    col_1 = 'a'
    AND col_2 = (
        SELECT
            MAX(col_2)
        FROM
            tbl_B
        WHERE
            col_3 = 100
    )
GROUP BY
    col_1,
    col_2,
    col_3;

--✕平坦で読みにくい:オール小文字
'select
    col_1,
    col_2,
    col_3,
    count(*)
from
    tbl_A
where
    col_1 = ' a '
    and col_2 = (
        select
            max(col_2)
        from
            tbl_B
        where
            col_3 = 100
    )
group by
    col_1,
    col_2,
    col_3;'
--✕平坦で読みにくい:オール大文字
SELECT
    COL_1,
    COL_2,
    COL_3,
    COUNT(*)
FROM
    TBL_A
WHERE
    COL_1 = 'a'
    AND COL_2 = (
        SELECT
            MAX(COL_2)
        FROM
            TBL_B
        WHERE
            COL_3 = 100
    )
GROUP BY
    COL_1,
    COL_2,
    COL_3;