# Optimize Complex Queries:
## Before optimization:
```sql
SELECT *
FROM Bookings bk
JOIN Users u ON bk.user_id = u.user_id
JOIN Properties pr ON bk.property_id = pr.property_id
LEFT JOIN Payment py ON py.booking_id = bk.booking_id
ORDER BY bk.start_date;
```
## Results before optimization:
```sql
3	10	08:18:49	SELECT *
 FROM Bookings bk
 JOIN Users u ON bk.user_id = u.user_id
 JOIN Properties pr ON bk.property_id = pr.property_id
 LEFT JOIN Payment py ON py.booking_id = bk.booking_id
 ORDER BY bk.start_date
 LIMIT 0, 1000	3 row(s) returned	0.016 sec / 0.000 sec
 ```

## After optimization:
```sql
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
LEFT JOIN Payment py ON bk.booking_id = py.booking_id
WHERE bk.status = 'confirmed'
  AND pr.location = 'Kitengela';
```

## Result after optimization:
```sql
3	12	08:23:35	SELECT 
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
 LEFT JOIN Payment py ON bk.booking_id = py.booking_id
 WHERE bk.status = 'confirmed'
   AND pr.location = 'Kitengela'
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec
```
