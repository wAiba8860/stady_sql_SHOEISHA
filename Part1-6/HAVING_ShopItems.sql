SELECT DISTINCT
    shop
FROM
    ShopItems
WHERE
    item IN (
        SELECT
            item
        FROM
            Items
    );

SELECT
    SI.shop
FROM
    ShopItems SI
    INNER JOIN Items I ON SI.item = I.item
GROUP BY
    SI.shop
HAVING
    count(SI.item) = (
        SELECT
            count(item)
        FROM
            Items
    );

SELECT
    SI.shop,
    count(SI.item),
    count(I.item)
FROM
    ShopItems SI
    INNER JOIN Items I ON SI.item = I.item
GROUP BY
    SI.shop;

SELECT
    SI.shop
FROM
    ShopItems SI
    LEFT OUTER JOIN Items I ON SI.item = I.item
GROUP BY
    SI.shop
HAVING
    count(SI.item) = (
        SELECT
            count(item)
        FROM
            Items
    )
    AND count(I.item) = (
        SELECT
            count(item)
        FROM
            Items
    );