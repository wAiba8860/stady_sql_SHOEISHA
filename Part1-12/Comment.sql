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