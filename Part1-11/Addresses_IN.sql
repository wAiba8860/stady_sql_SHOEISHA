SELECT
    id,
    state,
    city
FROM
    Addresses1 A1
WHERE
    state IN (
        SELECT
            state
        FROM
            Addresses2 A2
        WHERE
            A1.id = A2.id
    )
    AND city IN (
        SELECT
            city
        FROM
            Addresses2 A2
        WHERE
            A1.di = A2.di
    );

SELECT
    *
FROM
    Addresses1 A1
WHERE
    id || state || city IN (
        SELECT
            id || state || city
        FROM
            Addresses2 A2
    );

SELECT
    *
FROM
    Addresses1 A1
WHERE
    (id, state, city) IN (
        SELECT
            id,
            state,
            city
        FROM
            Addresses2 A2
    );