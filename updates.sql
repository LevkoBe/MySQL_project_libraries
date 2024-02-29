
UPDATE loans
SET return_date = CURRENT_TIMESTAMP
WHERE id IN (1, 2, 3, 8, 9);