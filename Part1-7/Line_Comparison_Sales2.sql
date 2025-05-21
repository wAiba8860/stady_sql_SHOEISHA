SELECT
    YEAR,
    sale
FROM
    Sales2 S1
WHERE
    sale = (
        SELECT
            sale
        FROM
            Sales2 S2
        WHERE
            S2.year = (
                SELECT
                    max(YEAR)
                FROM
                    Sales2 S3
                WHERE
                    S1.year > S3.year
            )
    )
ORDER BY
    YEAR;

SELECT
    YEAR,
    current_sale
FROM
    (
        SELECT
            YEAR,
            sale AS current_sale,
            sum(sale) OVER (
                ORDER BY
                    YEAR ROWS BETWEEN 1 preceding
                    AND 1 preceding
            ) AS pre_sale
        FROM
            Sales2
    ) TMP
WHERE
    current_sale = pre_sale
ORDER BY
    YEAR;
