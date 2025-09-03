# Indexes for Optimazition

## High-usage columns:

### Users table:
  1. user_id: primary key, used in JOIN.
  2. email: used in WHERE clauses.

### Bookings table:
  1. booking_id: primary key, used with JOIN.
  2. user_id: foreign key, used mostly in JOINs with Users.
  3. property_id: foreign key, used mostly in JOINs with Properties.

### Properties table:
  1. property_id: primary key used in JOIN.
  2. host_id: foreign key, used in JOINs with the Users table.

# Before indexing:

  ```sql
    EXPLAIN
    SELECT *
    FROM Bookings 
    JOIN users 
      ON Bookings.user_id = Users.user_id
    WHERE Users.email = 'frank@gmail.com';
  ```
# After indexing:

```sql
    EXPLAIN
    SELECT *
    FROM Bookings 
    JOIN users 
      ON Bookings.user_id = Users.user_id
    WHERE Users.email = 'frank@gmail.com';
  ```

