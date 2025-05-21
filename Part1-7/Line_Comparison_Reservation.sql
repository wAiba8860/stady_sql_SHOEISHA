SELECT
    reserver,
    start_date,
    end_date
FROM
    Reservations R1
WHERE
    EXISTS (
        SELECT
            *
        FROM
            Reservations R2
        WHERE
            R1.reserver <> R2.reserver
            AND (
                R1.start_date BETWEEN R2.start_date AND R2.end_date
                OR R1.end_date BETWEEN R2.start_date AND R2.end_date
            )
    );

SELECT
    reserver,
    next_reserver
FROM
    (
        SELECT
            reserver,
            start_date,
            end_date,
            max(start_date) OVER (
                ORDER BY
                    start_date ROWS BETWEEN 1 following
                    AND 1 following
            ) AS next_start_date,
            max(reserver) OVER (
                ORDER BY
                    start_date ROWS BETWEEN 1 following
                    AND 1 following
            ) AS next_reserver
        FROM
            Reservations
    ) TMP
WHERE
    next_start_date BETWEEN start_date AND end_date;

SELECT
    reserver,
    start_date,
    end_date,
    max(start_date) OVER (
        ORDER BY
            start_date ROWS BETWEEN 1 following
            AND 1 following
    ) AS next_start_date,
    max(reserver) OVER (
        ORDER BY
            start_date ROWS BETWEEN 1 following
            AND 1 following
    ) AS next_reserver
FROM
    Reservations;