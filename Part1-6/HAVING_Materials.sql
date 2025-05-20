SELECT
    center
FROM
    Materials
GROUP BY
    center
HAVING
    count(material) <> count(DISTINCT material);

SELECT
    center,
    CASE
        WHEN count(material) <> count(DISTINCT material) THEN 'ダブり有り'
        ELSE 'ダブりなし'
    END AS status
FROM
    Materials
GROUP BY
    center;

SELECT
    center,
    material
FROM
    Materials M1
WHERE
    EXISTS (
        SELECT
            *
        FROM
            Materials M2
        WHERE
            M1.center = M2.center
            AND M1.receive_date <> M2.receive_date
            AND M1.material = M2.material
    );