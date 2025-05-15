SELECT
    pref_name,
    population
FROM
    Poptbl2
WHERE
    sex = '1';

SELECT
    pref_name,
    population
FROM
    Poptbl2
WHERE
    sex = '2';

SELECT
    pref_name,
    sum(
        CASE
            WHEN sex = '1' THEN population
            ELSE 0
        END
    ) AS cnt_m,
    sum(
        CASE
            WHEN sex = '2' THEN population
            ELSE 0
        END
    ) AS cnt_f
FROM
    Poptbl2
GROUP BY
    pref_name;

SELECT
    pref_name,
    CASE
        WHEN sex = '1' THEN population
        ELSE 0
    END AS cnt_m,
    CASE
        WHEN sex = '2' THEN population
        ELSE 0
    END AS cnt_f
FROM
    Poptbl2;