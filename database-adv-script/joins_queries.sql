--INNER JOIN
SELECT *
FROM Users
INNER JOIN Bookings
    ON Users.user_id = Bookings.user_id;

-- LEFT JOIN 
SELECT *
FROM Properties
LEFT JOIN Reviews
    ON Properties.property_id = Reviews.property_id

-- FULL OUTER JOIN 
SELECT * 
FROM Users
FULL OUTER JOIN Bookings
    ON Users.user_id = Bookings.user_id;

-- alternative for full outer join
SELECT * 
FROM Users
UNION
SELECT *
FROM Bookings
