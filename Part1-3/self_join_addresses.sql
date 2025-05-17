SELECT DISTINCT
    A1.name,
    A1.address
FROM
    addresses A1
    INNER JOIN addresses A2 ON A1.family_id = A2.family_id
    AND A1.address <> A2.address;