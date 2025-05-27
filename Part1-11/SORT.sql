SELECT
    *
FROM
    Class_A
UNION
SELECT
    *
FROM
    Class_B
ORDER BY
    id;

SELECT
    *
FROM
    Class_A
UNION ALL
SELECT
    *
FROM
    Class_B;

----------------------------------------------------
SELECT
    (DISTINCT) I.item_no
FROM
    Items I
    INNER JOIN SalesHistory SH ON I.item_no = SH.item_no;

SELECT
    item_no
FROM
    Items I
WHERE
    EXISTS (
        SELECT
            *
        FROM
            SalesHistory SH
        WHERE
            I.item_no = SH.item_no
    );

------------------------------------------
SELECT
    sale_date,
    sum(quantity)
FROM
    SalesHistory
GROUP BY
    sale_date
HAVING
    sale_date = '2018-10-01';

SELECT
    sale_date,
    sum(quantity)
FROM
    SalesHistory
WHERE
    sale_date = '2018-10-01'
GROUP BY
    sale_date;