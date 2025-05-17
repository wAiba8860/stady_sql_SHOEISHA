CREATE TABLE RankedProducts AS (
    SELECT
        name,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY
                name,
                price
            ORDER BY
                name ASC
        ) AS rn
    FROM
        Products
);

-- DELETE FROM RankedProducts
-- WHERE
--     rn > 1;
