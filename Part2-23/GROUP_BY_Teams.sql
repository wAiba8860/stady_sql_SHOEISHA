SELECT
    team,
    ROUND(AVG(age), 2)
FROM
    Teams
GROUP BY
    team
ORDER BY
    team;

--エラー
SELECT
    team,
    ROUND(AVG(age), 2),
    age
FROM
    Teams
GROUP BY
    team
ORDER BY
    team;

--エラー
SELECT
    team,
    AVG(age),
    MEMBER
FROM
    Teams
GROUP BY
    team;

--正しい
SELECT
    team,
    AVG(age),
    MAX(MEMBER)
FROM
    Teams
GROUP BY
    team;

--チームで最高齢の年齢の人物
SELECT
    team,
    MAX(age),
    (
        SELECT
            MAX(MEMBER)
        FROM
            Teams T2
        WHERE
            T2.team = T1.team
            AND T2.age = MAX(T1.age)
    ) AS oldest
FROM
    Teams T1
GROUP BY
    team
ORDER BY
    team;