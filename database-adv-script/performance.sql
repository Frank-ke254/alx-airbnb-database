SELECT 
    bk.booking_id,
    bk.start_date,
    bk.end_date,
    bk.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    pr.property_id,
    pr.name AS property_name,
    pr.location,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM Bookings bk
JOIN Users u ON bk.user_id = u.user_id
JOIN Properties pr ON bk.property_id = pr.property_id
LEFT JOIN Payments py ON bk.booking_id = py.booking_id
WHERE bk.status = 'confirmed'
  AND pr.location = 'Kitengela';

-- EXPLAIN QUERY
EXPLAIN ANALYZE
SELECT 
    bk.booking_id,
    bk.start_date,
    bk.end_date,
    bk.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    pr.property_id,
    pr.name AS property_name,
    pr.location,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM Bookings bk
JOIN Users u ON bk.user_id = u.user_id
JOIN Properties pr ON bk.property_id = pr.property_id
LEFT JOIN Payments py ON bk.booking_id = py.booking_id
WHERE bk.status = 'confirmed'
  AND pr.location = 'Kitengela';

-- After Refactoring
SELECT 
    bk.booking_id,
    bk.start_date,
    bk.end_date,
    bk.total_price,
    u.first_name,
    u.last_name,
    pr.name AS property_name,
    py.amount
FROM Bookings bk
JOIN Users u ON bk.user_id = u.user_id
JOIN Properties pr ON bk.property_id = pr.property_id
LEFT JOIN Payments py ON bk.booking_id = py.booking_id
WHERE bk.status = 'confirmed'
  AND pr.location = 'Kitengela';
