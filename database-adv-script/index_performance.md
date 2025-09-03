# Indexes for Optimazition

## High-usage columns:

### Users table:
user_id: primary key, used in JOIN.
email: used in WHERE clauses.

### Bookings table:
booking_id: primary key, used with JOIN.
user_id: foreign key, used mostly in JOINs with Users.
property_id: foreign key, used mostly in JOINs with Properties.

### Properties table:
property_id: primary key used in JOIN.
host_id: foreign key, used in JOINs with the Users table.
