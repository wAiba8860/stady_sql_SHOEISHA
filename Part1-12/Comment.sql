--1行コメント
--SomeTableからcol_1を選択するよ
SELECT
    col_1
FROM
    SomeTable;

/*
複数行コメント
SomeTableからcol_1を選択するよ */
SELECT
    col_1
FROM
    SomeTable;

SELECT
    col_1
FROM
    SomeTable
WHERE
    col_1 = 'a'
    AND col_2 = 'b'
    --以下の条件はcol_3が'c','d'のいずれかであることを指定します
    AND col_3 IN ('c', 'd');

SELECT
    col_1 --SomeTableからcol_1を選択するよ
FROM
    SomeTable;

--カンマ
'SELECT
    col_1
    ,col_2
    ,col_3
    ,col_4
FROM
    tbl_A;
'
--ワイルドカードは使わない
--×
SELECT
    *
FROM
    SomeTable;

--〇
SELECT
    col_1,
    col_2,
    col_3,
    col_some
FROM
    SomeTable;

--order byで列番号は使わない
--✕
SELECT
    col_1,
    col_2
FROM
    SomeTable
ORDER BY
    1,
    2;

--〇
SELECT
    col_1,
    col_2
FROM
    SomeTable
ORDER BY
    col_1,
    col_2;