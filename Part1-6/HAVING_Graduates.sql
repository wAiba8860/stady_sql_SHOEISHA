SELECT
    income,
    count(*) AS cnt
FROM
    Graduates
GROUP BY
    income
HAVING
    count(*) >= (
        SELECT
            max(cnt)
        FROM
            (
                SELECT
                    count(*) AS cnt
                FROM
                    Graduates
                GROUP BY
                    income
            ) TMP
    );