# Normalization Principles:
1NF: Every attribute must be atomic.
2NF: Every attribute in the table should be fully dependent on the primary key.
3NF: The table must be free from transitive dependency for non-prime attributes.

# AirBnB Database
In the case of our tables in the Airbnb database all pass the three normalization principles hence no need to alter any of them.

##Users table/relation:
user_id | first_name | last_name | email | password_hash | phone_number | role | created_at

All fields in the table are atomic.
All fields in the table are fully dependent on the user_id.
The table is free from transitive dependencies.

##Property table/relation:
property_id | host_id | name | description | location | pricepernight | created_at | updated at

All fields in the table are atomic.
All fields in the table are fully dependent on the property_id.
The table is free from transitive dependencies.

## Booking table:
booking_id | property_id | user_id | start_date | end_date | total_price | status | created_at

All fields in the table are atomic.
All fields in the table are fully dependent on the booking_id.
The table is free from transitive dependencies.

## Payment table:
payment_id | booking_id | amount | payment_date | payment_method

All fields in the table are atomic.
All fields in the table are fully dependent on the payment_id.
The table is free from transitive dependencies.

## Review table:
review_id | property_id | user_id | rating | comment | created_at

All fields in the table are atomic.
All fields in the table are fully dependent on the review_id.
The table is free from transitive dependencies.

## Message table:
message_id | sender_id | recipient_id | message_body | sent_at

All fields in the table are atomic.
All fields in the table are fully dependent on the message_id.
The table is free from transitive dependencies.
