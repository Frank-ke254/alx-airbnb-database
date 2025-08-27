INSERT INTO users(user_id,first_name,last_name,email,phone_number,password_hash,role) VALUES
(gen_random_uuid(), 'Frank', 'Kariuki', 'frank@gmail.com', '0788485843', 'passwordhashed001', 'host'),
(gen_random_uuid(), 'Lucy', 'Wambui', 'wambui@gmail.com', '0765372829', 'passwordhashed002', 'guest');
(gen_random_uuid(), 'Miranda', 'Cosgrove', 'miranda@gmail.com', '0763758999', 'passwordhashed003', 'guest');
(gen_random_uuid(), 'Jade', 'West', 'jade@gmail.com', '0721324545', 'passwordhashed005', 'guest');
(gen_random_uuid(), 'Jake', 'Spence', 'jake@gmail.com', '0798652132', 'passwordhashed004', 'admin');

INSERT INTO properties (property_id, host_id, name, description, location, pricepernight) VALUES
(gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'frank@gmail.com'), 'Paradise', 'A beautiful airbnb along the coast', 'Kilifi', 15000.00),
(gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'frank@gmail.com'), 'Villa Lodge', 'A beautiful airbnb', 'Kitengela', 25000.00);

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Paradise'), (SELECT user_id FROM users WHERE email = 'wambui@gmail.com'), '2025-08-10', '2025-08-15', 75000, 'confirmed');
(gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Villa Lodge'), (SELECT user_id FROM users WHERE email = 'miranda@gmail.com'), '2025-08-12', '2025-08-18', 75000, 'pending');
(gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Villa Lodge'), (SELECT user_id FROM users WHERE email = 'jade@gmail.com'), '2025-08-20', '2025-08-24', 60000, 'confirmed');

INSERT INTO payment (payment_id, booking_id, amount, payment_method) VALUES
(gen_random_uuid(), (SELECT booking_id FROM bookings WHERE status = 'confirmed'), 75000, 'stripe');
(gen_random_uuid(), (SELECT booking_id FROM bookings WHERE status = 'confirmed'), 60000, 'credit_card');

INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
(gen_random_uuid(), (SELECT property_id FROM properties WHERE = 'Paradise'), (SELECT user_id FROM users WHERE email = 'wambui@gmail.com'), 5, 'I had a really nice stay, I will certainly come back.');
(gen_random_uuid(), (SELECT property_id FROM properties WHERE = 'Villa Lodge'), (SELECT user_id FROM users WHERE email = 'jade@gmail.com'), 4, 'I had a really nice sta');

INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
(gen_random_uuid(), (SELECT user_id FROM users WHERE = 'wambui@gmail.com'), (SELECT user_id FROM users WHERE email = 'frank@gmail.com'), 'Good morning Frank, I appreciate you for having me. The experience was breath-taking.');
(gen_random_uuid(), (SELECT user_id FROM users WHERE = 'jade@gmail.com'), (SELECT user_id FROM users WHERE email = 'frank@gmail.com'), 'Good morning Frank, it was an overall good stay.');
