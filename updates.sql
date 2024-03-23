
UPDATE loans
SET return_date = CURRENT_TIMESTAMP
WHERE id IN (1, 3, 15, 16, 19);