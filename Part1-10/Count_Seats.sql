--:head_cntは実際に座りたい人数に書き換える
SELECT
    S1.seat AS start_seat,
    '~',
    S2.seat AS end_seat
FROM
    Seats S1,
    Seats S2
WHERE
    S2.seat = S1.seat + (':head_cnt' -1)
    AND NOT EXISTS (
        SELECT
            *
        FROM
            Seats S3
        WHERE
            S3.seat BETWEEN S1.seat AND S2.seat
            AND S3.status <> '空'
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
                ORDER BY
                    seat ROWS BETWEEN (':head_cnt' - 1) following
                    AND (':head_cnt' -1) following
            ) AS end_seat
        FROM
            Seats
        WHERE
            status = '空'
    ) TMP
WHERE
    end_seat - seat = (':head_cnt' -1);