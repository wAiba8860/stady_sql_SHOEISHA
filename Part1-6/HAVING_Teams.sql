SELECT
    team_id,
    MEMBER
FROM
    Teams T1
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            Teams T2
        WHERE
            T1.team_id = T2.team_id
            AND T2.status <> '待機'
    );

SELECT
    team_id
FROM
    Teams
GROUP BY
    team_id
HAVING
    count(*) = sum(
        CASE
            WHEN status = '待機' THEN 1
            ELSE 0
        END
    );

SELECT
    team_id
FROM
    Teams
GROUP BY
    team_id
HAVING
    max(status) = '待機'
    AND min(status) = '待機';

SELECT
    team_id,
    CASE
        WHEN max(status) = '待機'
        AND min(status) = '待機' THEN '総員スタンバイ'
        ELSE 'メンバーが足りません'
    END
FROM
    Teams
GROUP BY
    team_id;
