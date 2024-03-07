
UPDATE loans
SET return_date = CURRENT_TIMESTAMP
WHERE id IN (4, 5, 13, 14, 17);