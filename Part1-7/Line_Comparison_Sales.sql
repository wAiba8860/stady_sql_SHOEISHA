SELECT
    YEAR,
    sale
FROM
    Sales S1
WHERE
    sale = (
        SELECT
            sale
        FROM
            Sales S2
        WHERE
            S2.year = S1.year -1
    )
ORDER BY
    YEAR;

SELECT
    YEAR,
    current_sale,
    pre_sale
FROM
    (
        SELECT
            YEAR,
            sale AS current_sale,
            sum(sale) OVER (
                ORDER BY
                    YEAR RANGE BETWEEN 1 preceding
                    AND 1 preceding
            ) AS pre_sale
        FROM
            Sales
    ) TMP
WHERE
    current_sale = pre_sale
ORDER BY
    YEAR;

SELECT
    YEAR,
    sale AS current_sale,
    sum(sale) OVER (
        ORDER BY
            YEAR RANGE BETWEEN 1 preceding
            AND 1 preceding
    ) AS pre_sale
FROM
    Sales;

SELECT
    YEAR,
    current_sale AS sale,
    CASE
        WHEN current_sale = pre_sale THEN '→'
        WHEN current_sale > pre_sale THEN '↑'
        WHEN current_sale < pre_sale THEN '↓'
        ELSE '-'
    END AS var
FROM
    (
        SELECT
            YEAR,
            sale AS current_sale,
            (
                SELECT
                    sale
                FROM
                    Sales S2
                WHERE
                    S2.year = S1.year -1
            ) AS pre_sale
        FROM
            Sales S1
    ) TMP
ORDER BY
    YEAR;

SELECT
    YEAR,
    current_sale AS sale,
    CASE
        WHEN current_sale = pre_sale THEN '→'
        WHEN current_sale > pre_sale THEN '↑'
        WHEN current_sale < pre_sale THEN '↓'
        ELSE '-'
    END AS var
FROM
    (
        SELECT
            YEAR,
            sale AS current_sale,
            sum(sale) OVER (
                ORDER BY
                    YEAR RANGE BETWEEN 1 preceding
                    AND 1 preceding
            ) AS pre_sale
        FROM
            Sales
    ) TMP
ORDER BY
    YEAR;