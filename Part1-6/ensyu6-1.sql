SELECT
    CASE
        WHEN count(*) <> MAX(seq) THEN '歯抜けあり'
        ELSE '歯抜けなし'
    END AS gap
FROM
    SeqTbl;

SELECT
    dpt
FROM
    Students
GROUP BY
    dpt
HAVING
    count(*) = sum(
        CASE
            WHEN sbmt_date BETWEEN '2018-09-01' AND '2018-09-30'  THEN 1
            ELSE 0
        END
    );

SELECT
    dpt
FROM
    Students
GROUP BY
    dpt
HAVING
    count(*) = sum(
        CASE
            WHEN extract(
                YEAR
                FROM
                    sbmt_date
            ) = 2018
            AND EXTRACT(
                MONTH
                FROM
                    sbmt_date
            ) = 09 THEN 1
            ELSE 0
        END
    );

--inner joinでも可
SELECT
    shop,
    count(I.item) AS my_item_cnt,
    (
        SELECT
            count(item)
        FROM
            Items
    ) - count(I.item) AS duff_cnt
FROM
    ShopItems SI
    LEFT JOIN Items I ON SI.item = I.item
GROUP BY
    SI.shop;
