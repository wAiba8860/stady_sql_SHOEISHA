SELECT
    std_id,
    max(club_id) AS main_club
FROM
    StudentClub
GROUP BY
    std_id
HAVING
    count(*) = 1;

SELECT
    std_id,
    club_id AS main_club
FROM
    StudentClub
WHERE
    main_club_flg = 'Y';

SELECT
    std_id,
    CASE
        WHEN count(*) = 1 THEN max(club_id)
        ELSE max(
            CASE
                WHEN main_club_flg = 'Y' THEN club_id
                ELSE NULL
            END
        )
    END AS main_club
FROM
    StudentClub
GROUP BY
    std_id;