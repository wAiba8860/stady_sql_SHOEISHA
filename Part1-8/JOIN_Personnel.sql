SELECT
    employee,
    child_1 AS child
FROM
    Personnel
UNION ALL
SELECT
    employee,
    child_2 AS child
FROM
    Personnel
UNION ALL
SELECT
    employee,
    child_3 AS child
FROM
    Personnel
ORDER BY
    employee;

SELECT
    *
FROM
    Personnel EMP
    LEFT OUTER JOIN Children ON Children.child IN (EMP.child_1, EMP.child_2, EMP.child_3);