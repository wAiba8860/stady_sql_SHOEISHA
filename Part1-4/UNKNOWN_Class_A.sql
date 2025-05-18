SELECT
    *
FROM
    Class_A
WHERE
    age NOT IN (
        SELECT
            age
        FROM
            Class_B
        WHERE
            city = '東京 '
    );

SELECT
    *
FROM
    Class_A A
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            Class_B B
        WHERE
            A.age = B.age
            AND B.city = '東京'
    );

SELECT
    *
FROM
    Class_A
WHERE
    age < ALL (
        SELECT
            age
        FROM
            Class_B
        WHERE
            city = '東京 '
    );

SELECT
    *
FROM
    Class_A
WHERE
    age < (
        SELECT
            MIN(age)
        FROM
            Class_B
        WHERE
            city = '東京'
    );