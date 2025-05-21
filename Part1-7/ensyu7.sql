SELECT
    prc_date,
    prc_amt,
    avg(prc_amt) OVER (
        ORDER BY
            prc_date ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    )
FROM
    Accounts;

SELECT
    prc_date,
    A1.prc_amt,
    (
        SELECT
            avg(prc_amt)
        FROM
            Accounts A2
        WHERE
            A1.prc_date >= A2.prc_date
            AND (
                SELECT
                    count(*)
                FROM
                    Accounts A3
                WHERE
                    A3.prc_date BETWEEN A2.prc_date AND A1.prc_date
            ) <= 3
    ) AS mvg_sum
FROM
    Accounts A1
ORDER BY
    prc_date;

SELECT
    A1.prc_date AS A1_date,
    A2.prc_date AS A2_date,
    A2.prc_amt AS amt
FROM
    Accounts A1,
    Accounts A2
WHERE
    A1.prc_date >= A2.prc_date
    AND (
        SELECT
            count(*)
        FROM
            Accounts A3
        WHERE
            A3.prc_date BETWEEN A2.prc_date AND A1.prc_date
    ) <= 3
ORDER BY
    A1_date,
    A2_date;

SELECT
    prc_date,
    prc_amt,
    CASE
        WHEN cnt < 3 THEN NULL
        ELSE mvg_avg
    END AS mvg_avg
FROM
    (
        SELECT
            prc_date,
            prc_amt,
            avg(prc_amt) OVER (
                ORDER BY
                    prc_date ROWS BETWEEN 2 preceding
                    AND CURRENT ROW
            ) AS mvg_avg,
            count(*) OVER (
                ORDER BY
                    prc_date ROWS BETWEEN 2 preceding
                    AND CURRENT ROW
            ) AS cnt
        FROM
            Accounts
    ) TMP;

SELECT
    prc_date,
    A1.prc_amt,
    (
        SELECT
            avg(prc_amt)
        FROM
            Accounts A2
        WHERE
            A1.prc_date >= A2.prc_date
            AND (
                SELECT
                    count(*)
                FROM
                    Accounts A3
                WHERE
                    A3.prc_date BETWEEN A2.prc_date AND A1.prc_date
            ) <= 3
        HAVING
            count(*) = 3
    ) AS mvg_sum
FROM
    Accounts A1
ORDER BY
    prc_date;