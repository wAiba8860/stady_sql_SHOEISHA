SELECT
    deal_date,
    price,
    CASE SIGN (
            price - MAX(price) OVER (
                ORDER BY
                    deal_date ROWS BETWEEN 1 preceding
                    AND 1 preceding
            )
        )
        WHEN 1 THEN 'up'
        WHEN 0 THEN 'stay'
        WHEN -1 THEN 'down'
        ELSE NULL
    END AS price_order
FROM
    MyStock;

CREATE VIEW MyStockUpSeq (deal_date, price, row_num) AS
SELECT
    deal_date,
    price,
    row_num
FROM
    (
        SELECT
            deal_date,
            price,
            CASE SIGN (
                    price - MAX(price) OVER (
                        ORDER BY
                            deal_date ROWS BETWEEN 1 preceding
                            AND 1 preceding
                    )
                )
                WHEN 1 THEN 'up'
                WHEN 0 THEN 'stay'
                WHEN -1 THEN 'down'
                ELSE NULL
            END AS diff,
            row_number() OVER (
                ORDER BY
                    deal_date
            ) AS row_num
        FROM
            MyStock
    ) TMP
WHERE
    diff = 'up';

SELECT
    min(deal_date) AS start_date,
    '~',
    max(deal_date) AS end_date
FROM
    (
        SELECT
            M1.deal_date,
            count(M2.row_num) - min(M1.row_num) AS gap
        FROM
            MyStockUpSeq M1
            INNER JOIN MyStockUpSeq M2 ON M2.row_num <= M1.row_num
        GROUP BY
            M1.deal_date
    ) TMP
GROUP BY
    gap;

SELECT
    M1.deal_date,
    count(M2.row_num) cnt,
    min(M1.row_num) min_row_num,
    count(M2.row_num) - min(M1.row_num) AS gap
FROM
    MyStockUpSeq M1
    INNER JOIN MyStockUpSeq M2 ON M2.row_num <= M1.row_num
GROUP BY
    M1.deal_date;