-- Total bookings per user
SELECT 
    Users.user_id,
    Users.first_name,
    Users.last_name,
    COUNT(Bookings.booking_id) AS total_bookings
FROM Users 
LEFT JOIN Bookings
    ON Users.user_id = Bookings.user_id
GROUP BY Users.user_id, Users.first_name, Users.last_name
ORDER BY total_bookings DESC;
--ORDER BY total_bookings DESC;

-- Ranking properties by bookings made
SELECT 
    Properties.property_id,
    Properties.name,
    Properties.description,
    COUNT(Bookings.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Bookings.booking_id) DESC) AS booking_rank
FROM Properties
LEFT JOIN Bookings 
  ON Properties.property_id = Bookings.property_id
GROUP BY Properties.property_id, Properties.name, Properties.description
ORDER BY booking_rank;

-- Row number
SELECT 
    Properties.property_id,
    Properties.name,
    Properties.description,
    COUNT(Bookings.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(Bookings.booking_id) DESC) AS booking_rank
FROM Properties
LEFT JOIN Bookings ON Properties.property_id = Bookings.property_id
GROUP BY Properties.property_id, Properties.name, Properties.description
ORDER BY total_bookings DESC;
