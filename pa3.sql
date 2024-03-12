-- Active: 1710152672434@@127.0.0.1@3306@first_db
-- = with non-correlated subqueries result
SELECT b.title book FROM books b
    WHERE b.id = (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        ORDER BY COUNT(1) DESC
        LIMIT 1);
SELECT g.name FROM genres g
    INNER JOIN book_genres bg ON bg.genre_id = g.id
    WHERE bg.book_id = (
        SELECT b.id FROM books b
        ORDER BY b.rating DESC
        LIMIT 1
    );

-- IN with non-correlated subqueries result
SELECT b.title book FROM books b
    WHERE b.id IN (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        HAVING COUNT(1) > 0
    );

-- NOT IN with non-correlated subqueries result
SELECT b.title book FROM books b
    WHERE b.id NOT IN (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON l.id = lb.loan_id
        WHERE l.return_date IS NOT NULL)
    ORDER BY b.title;

-- EXISTS with non-correlated subqueries result
SELECT b.title book FROM books b
    WHERE EXISTS (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON l.id = lb.loan_id
        WHERE l.return_date IS NULL);
-- NOT EXISTS with non-correlated subqueries result
SELECT c.name customer FROM customers c
    WHERE NOT EXISTS (SELECT l.customer_id FROM loans l); -- todo: check by giving loans from customer A to customer B

-- = with correlated subqueries result
SELECT b.title book
FROM books b
WHERE (
    SELECT COUNT(1) FROM book_authors ba
    WHERE ba.book_id = b.id
) = 1;


-- IN with correlated subqueries result
SELECT *
FROM books b
WHERE b.id IN (
    SELECT lb.book_id
    FROM loan_books lb
    WHERE lb.book_id = b.id
);

-- NOT IN with correlated subqueries result
SELECT *
FROM books b
WHERE b.id NOT IN (
    SELECT lb.book_id
    FROM loan_books lb
    WHERE lb.book_id = b.id
);

-- EXISTS with correlated subqueries result
SELECT p.name publisher
FROM publishers p
WHERE EXISTS (
    SELECT 1 FROM books b
    WHERE b.publisher_id = p.id
);

-- NOT EXISTS with correlated subqueries result
SELECT b.title
FROM books b
WHERE NOT EXISTS (
    SELECT 1 FROM loan_books lb
    WHERE lb.book_id = b.id
);

