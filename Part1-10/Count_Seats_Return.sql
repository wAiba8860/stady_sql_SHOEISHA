SELECT
    S1.seat AS start_seat,
    '~',
    S2.seat AS end_seat
FROM
    Seats2 S1,
    Seats S2
WHERE
    S2.seat = S1.seat + (':head_cnt' - 1)
    AND NOT EXISTS (
        SELECT
            *
        FROM
            Seats2 S3
        WHERE
            S3.seat BETWEEN S1.seat AND S2.seat
            AND (
                S3.status <> '空'
                OR S3.line_id <> S1.line_id
            )
    );

SELECT
    seat,
    '~',
    seat + (':head_cnt' -1)
FROM
    (
        SELECT
            seat,
            max(seat) OVER (
                PARTITION BY
                    line_id
                ORDER BY
                    seat ROWS BETWEEN (':head_cnt' -1) following
                    AND (':head_cnt' -1) following
            ) AS end_seat
        FROM
            Seats2
        WHERE
            status = '空'
    ) TMP
WHERE
    end_seat - seat = (':head_cnt' -1);