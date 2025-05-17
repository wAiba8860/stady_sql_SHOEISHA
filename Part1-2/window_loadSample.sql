SELECT
    sample_date AS cur_date,
    load_val AS cur_load,
    min(sample_date) OVER (
        ORDER BY
            sample_date ASC ROWS BETWEEN 1 preceding
            AND 1 preceding
    ) AS latest_date,
    min(load_val) OVER (
        ORDER BY
            sample_date ASC ROWS BETWEEN 1 preceding
            AND 1 preceding
    ) AS latest_load
FROM
    loadsample;

SELECT
    sample_date AS cur_date,
    load_val AS cur_load,
    min(sample_date) OVER W AS latest_date,
    min(load_val) OVER W AS latest_load
FROM
    loadsample
WINDOW
    W AS (
        ORDER BY
            sample_date ASC ROWS BETWEEN 1 preceding
            AND 1 preceding
    );

SELECT
    sample_date AS cur_date,
    load_val AS cur_load,
    min(sample_date) OVER W AS latest_date,
    min(load_val) OVER W AS latest_load
FROM
    loadsample
WINDOW
    W AS (
        ORDER BY
            sample_date ASC ROWS BETWEEN 1 following
            AND 1 following
    );

SELECT
    sample_date AS cur_date,
    load_val AS cur_load,
    min(sample_date) OVER (
        ORDER BY
            sample_date ASC RANGE BETWEEN interval '1' DAY preceding
            AND interval '1' DAY preceding
    ) AS day1_before,
    min(load_val) OVER (
        ORDER BY
            sample_date ASC RANGE BETWEEN interval '1' DAY preceding
            AND interval '1' DAY preceding
    ) AS load_day1_before
FROM
    loadsample;

SELECT
    sample_date AS cur_date,
    min(sample_date) OVER (
        ORDER BY
            sample_date ASC ROWS BETWEEN 1 preceding
            AND 1 preceding
    ) AS latest_1,
    min(sample_date) OVER (
        ORDER BY
            sample_date ASC ROWS BETWEEN 2 preceding
            AND 2 preceding
    ) AS latest_2,
    min(sample_date) OVER (
        ORDER BY
            sample_date ASC ROWS BETWEEN 3 preceding
            AND 3 preceding
    ) AS latest_3
FROM
    loadsample;