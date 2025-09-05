-- PARTITIONING QUERY
CREATE TABLE Bookings_partition (
    booking_id char(36) NOT NULL,
    user_id char(36) NOT NULL,
    property_id char(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
	  total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (TO_DAYS(start_date)) (
  PARTITION p2024 VALUES LESS THAN (TO_DAYS('2025-01-01')),
  PARTITION p2025 VALUES LESS THAN (TO_DAYS('2026-01-01')),
  PARTITION pmax  VALUES LESS THAN MAXVALUE
);
