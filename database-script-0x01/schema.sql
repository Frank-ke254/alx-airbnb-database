create table users (
    user_id UUID primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(50) unique not null,
    phone_number varchar(20) null,
    password_hash varchar(255) not null,
    role ENUM('guest','admin','host') not null,
    created_at timestamp default current_timestamp
);

create table properties (
    property_id primary key UUID,
    host_id UUID,
    name varchar(50) not null,
    description text not null,
    location varchar(50) not null,
    pricepernight decimal(10, 2) not null,
    created_at timestamp default current_timestamp,
    foreign key (host_id) references users(user_id)
);

create table bookings (
    booking_id primary key UUID,
    property_id UUID,
    user_id UUID,
    start_date date not null,
    end_date date not null,
    total_price decimal(10,2) not null,
    status ENUM ('pending', 'confirmed', 'cancelled') not null,
    created_at timestamp default current_timestamp,
    foreign key (property_id) references properties(property_id),
    foreign key (user_id) references users(user_id)
);

create table payment (
    payment_id primary key UUID,
    booking_id UUID,
    amount decimal(10,2) not null,
    payment_date timestamp default current_timestamp,
    payment_method ENUM('credit_card', 'paypal', 'stripe') not null,
    foreign key (booking_id) references bookings(booking_id)
);

create table reviews (
    review_id UUID primary key,
    property_id UUID,
    user_id UUID,
    rating int check (rating >=1 and rating <= 5) not null,
    comment text not null,
    created_at timestamp default current_timestamp,
    foreign key (property_id) references properties(property_id),
    foreign key (user_id) references users(user_id)
);

create table messages (
    message_id UUID primary key,
    sender_id UUID,
    recipient_id UUID,
    message_body text not null,
    sent_at timestamp default current_timestamp,
    foreign key (sender_id) references users(user_id),
    foreign key (recipient_id) references users(user_id)
)
