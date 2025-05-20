SELECT
    *
FROM
    TestResults
GROUP BY
    class
HAVING
    count(*) * 0.75 <= sum(
        CASE
            WHEN score >= 80 THEN 1
            ELSE 0
        END
    );

SELECT
    class
FROM
    TestResults
GROUP BY
    class
HAVING
    sum(
        CASE
            WHEN sex = '男'
            AND score >= 50 THEN 1
            ELSE 0
        END
    ) > sum(
        CASE
            WHEN sex = '女'
            AND score >= 50 THEN 1
            ELSE 0
        END
    );

SELECT
    class
FROM
    TestResults
GROUP BY
    class
HAVING
    AVG(
        CASE
            WHEN sex = '男' THEN score
            ELSE NULL
        END
    ) < AVG(
        CASE
            WHEN sex = '女' THEN score
            ELSE NULL
        END
    );
