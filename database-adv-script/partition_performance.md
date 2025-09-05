# Testing the performance of queries:
## Before partitioning:
```sql
  EXPLAIN ANALYZE
  SELECT *
  FROM Bookings
  WHERE start_date BETWEEN '2025-01-01' AND '2026-01-01';
```
## Results:
```sql
  3	17	09:15:09	EXPLAIN ANALYZE
   SELECT *
   FROM Bookings
   WHERE start_date BETWEEN '2025-01-01' AND '2026-01-01'	1 row(s) returned	0.015 sec / 0.000 sec
```

## After partitioning:
```sql
  EXPLAIN ANALYZE
  SELECT *
  FROM Bookings_partition
  WHERE start_date BETWEEN '2025-01-01' AND '2026-01-01';
```

## Results:
```sql
  3	18	09:17:26	EXPLAIN ANALYZE
   SELECT *
   FROM Bookings_partition
   WHERE start_date BETWEEN '2025-01-01' AND '2026-01-01'	1 row(s) returned	0.016 sec / 0.000 sec
```

# Reports:
<ol>
  <li>No measuurable gain was observed.</li>
  <li>Both were competing at 0.015 seconds and 0.016 seconds.</li>
</ol>

## Reasons:
<ol>
  <li>The test table was small.</li>
  <li>Partitioning becomes benficial with scale.</li>
</ol>
