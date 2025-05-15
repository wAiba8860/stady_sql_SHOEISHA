SELECT
    course_name,
    CASE
        WHEN course_id IN (
            SELECT
                course_id
            FROM
                OpenCourses
            WHERE
                MONTH = 201806
        ) THEN '〇'
        ELSE '✕'
    END AS "6月",
    CASE
        WHEN course_id IN (
            SELECT
                course_id
            FROM
                OpenCourses
            WHERE
                MONTH = 201807
        ) THEN '〇'
        ELSE '✕'
    END AS "7月",
    CASE
        WHEN course_id IN (
            SELECT
                course_id
            FROM
                OpenCourses
            WHERE
                MONTH = 201808
        ) THEN '〇'
        ELSE '✕'
    END AS "8月"
FROM
    CourseMaster;

SELECT
    course_name,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                OpenCourses
            WHERE
                OpenCourses.month = 201806
                AND OpenCourses.course_id = CourseMaster.course_id
        ) THEN '〇'
        ELSE '✕'
    END AS "6月",
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                OpenCourses
            WHERE
                OpenCourses.month = 201807
                AND OpenCourses.course_id = CourseMaster.course_id
        ) THEN '〇'
        ELSE '✕'
    END AS "7月",
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                OpenCourses
            WHERE
                OpenCourses.month = 201808
                AND OpenCourses.course_id = CourseMaster.course_id
        ) THEN '〇'
        ELSE '✕'
    END AS "8月"
FROM
    CourseMaster;