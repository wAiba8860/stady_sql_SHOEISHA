--無駄な中間テーブル
SELECT
    *
FROM
    (
        SELECT
            sale_date,
            max(quantity) AS max_qty
        FROM
            SalesHistory
        GROUP BY
            sale_date
    ) TMP
WHERE
    max_qty >= 10;

--Havingを使った代替案
SELECT
    sale_date,
    max(quantity)
FROM
    SalesHistory
GROUP BY
    sale_date
HAVING
    max(quantity) >= 10;