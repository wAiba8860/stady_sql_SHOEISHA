--◯良い見本
SELECT
    col_1
FROM
    tbl_A A
    INNER JOIN tbl_B B ON A.col_3 = B.col_3
WHERE
    (
        A.col_1 >= 100
        OR A.col_2 IN ('a', 'b')
    );

--✕悪い例
/*
SELECT
col_1
FROM
tbl_A A
INNER JOIN tbl_B B ON A.col_3=B.col_3
WHERE
(
A.col_1>=100
OR A.col_2 IN ('a', 'b')
);
*/