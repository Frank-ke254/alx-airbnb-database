-- non-correlated subquery
SELECT *
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- correlated subquery
SELECT *
FROM Users
WHERE (
    SELECT COUNT(*)
    FROM Bookings
    WHERE Bookings.user_id = Users.user_id
) > 3;
