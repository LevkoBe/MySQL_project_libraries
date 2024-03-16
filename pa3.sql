-- Active: 1710152672434@@127.0.0.1@3306@first_db

-----------------------------------------------------------
-- = with non-correlated subqueries result ----------------
-----------------------------------------------------------
-- selection of the most commonly borrowed book
SELECT b.title book FROM books b
    WHERE b.id = (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        ORDER BY COUNT(1) DESC
        LIMIT 1);
-- selecting genre of the best-rated book
SELECT g.name FROM genres g
    INNER JOIN book_genres bg ON bg.genre_id = g.id
    WHERE bg.book_id = (
        SELECT b.id FROM books b
        ORDER BY b.rating DESC
        LIMIT 1
    );
-- add page "nomination 'Best Book Of The Year'"
UPDATE books b
    SET b.pages = b.pages + 1
    WHERE b.id = (
        SELECT id FROM (
            SELECT bk.id 
            FROM books bk
            ORDER BY bk.rating DESC
            LIMIT 1
        ) AS temp
    );
-- delete the least borrowed book
DELETE FROM books
WHERE id = (
    SELECT lb.book_id
    FROM loan_books lb
    GROUP BY lb.book_id
    ORDER BY COUNT(1) ASC
    LIMIT 1
);

--------------------------------------------------------
-- IN with non-correlated subqueries result ------------
--------------------------------------------------------
-- books borrowed more than once
SELECT b.title book FROM books b
    WHERE b.id IN (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        HAVING COUNT(1) > 1
    );
-- marking books as Borrowed
UPDATE books b
    SET b.status = 'Borrowed'
    WHERE b.id IN (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON lb.loan_id = l.id
        WHERE l.return_date IS NULL)
    AND b.status = 'Available';
-- delete overused books
DELETE FROM books
WHERE id IN (
    SELECT lb.book_id
    FROM loan_books lb
    GROUP BY lb.book_id
    HAVING COUNT(1) > 10
);

----------------------------------------------------------------
-- NOT IN with non-correlated subqueries result ----------------
----------------------------------------------------------------
 -- available books
SELECT b.title book FROM books b
    WHERE b.id NOT IN (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON l.id = lb.loan_id
        WHERE l.return_date IS NULL)
    ORDER BY b.title;
-- discount on the non-borrowed books that are in the library more than a year, and have the price of more than $10
UPDATE books b
    SET b.price = b.price / 2
    WHERE b.id NOT IN (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id)
    AND b.price > 10
    AND b.year_published < YEAR(NOW()) - 1;
-- delete the returned book as though they are disposable
DELETE FROM books
WHERE id NOT IN (
    SELECT lb.book_id
    FROM loan_books lb
    INNER JOIN loans l ON l.id = lb.loan_id
    WHERE l.return_date IS NULL
);

----------------------------------------------------------------
-- EXISTS with non-correlated subqueries result ----------------
----------------------------------------------------------------
-- [all] books, if there exist currently unanvailable books
SELECT b.title book FROM books b
    WHERE EXISTS (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON l.id = lb.loan_id
        WHERE l.return_date IS NULL);
-- update [all] customers, if there exist books which were not loaned
UPDATE customers c
    SET c.address = REVERSE(c.address)
    WHERE EXISTS (
        SELECT 1 FROM books b
        LEFT JOIN loan_books lb ON lb.book_id = b.id
        WHERE lb.loan_id IS NULL);
-- delete [all] customers if someone did not return a book in time
DELETE FROM customers
WHERE EXISTS (
    SELECT lb.book_id
    FROM loan_books lb
    INNER JOIN loans l ON l.id = lb.loan_id
    WHERE l.return_date IS NULL
    AND l.due_date > NOW()
);


----------------------------------------------------------------
-- NOT EXISTS with non-correlated subqueries result ------------
----------------------------------------------------------------
-- [all] customers, if there are no customers with more than 6 loans
SELECT c.name customer FROM customers c
    WHERE NOT EXISTS (SELECT 1 FROM loans l GROUP BY l.customer_id HAVING COUNT(1) > 6);
-- update [all] genres, if there is no books with 5 genres
UPDATE genres g
    SET g.description = REVERSE(g.description)
    WHERE NOT EXISTS (
        SELECT 1 FROM books b
        INNER JOIN book_genres bg ON bg.book_id = b.id
        GROUP BY bg.book_id HAVING COUNT(1) > 5);
-- delete [all] authors if there are no books with less than 66 authors
DELETE FROM authors
WHERE NOT EXISTS (
    SELECT b.id
    FROM books b
    INNER JOIN book_authors ba ON ba.book_id = b.id
    GROUP BY ba.book_id HAVING COUNT(1) < 66);

-------------------------------------------------------
-- = with correlated subqueries result ----------------
-------------------------------------------------------
-- books with one author
SELECT b.title book FROM books b
    WHERE (
        SELECT COUNT(1) FROM book_authors ba
        WHERE ba.book_id = b.id
    ) = 1;

UPDATE authors a
    SET a.biography = CONCAT('Fruitful ', a.biography)
    WHERE (
        SELECT COUNT(1) FROM book_authors ba
        WHERE ba.author_id = a.id
    ) >= 2;
-- delete suspicious authors
DELETE FROM authors
WHERE (
    SELECT COUNT(1)
    FROM book_authors ba
    WHERE ba.book_id = authors.id
) = 13;

--------------------------------------------------------
-- IN with correlated subqueries result ----------------
--------------------------------------------------------
-- books borrowed in the last 12 months
SELECT b.title AS book
    FROM books b
    WHERE b.id IN (
        SELECT lb.book_id
        FROM loan_books lb
        JOIN loans l ON l.id = lb.loan_id
        WHERE lb.book_id = b.id
        AND l.loan_date >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
    );

-- increasing reviews number for books with authors who have blogs
UPDATE books b
    SET b.reviews = b.reviews * 2
    WHERE b.id IN (
        SELECT ba.book_id FROM book_authors ba
        INNER JOIN authors a ON a.id = ba.author_id
        WHERE ba.book_id = b.id
        AND a.blog IS NOT NULL);
-- delete books that will probably not be returned
DELETE FROM books
WHERE id IN (
    SELECT lb.book_id
    FROM loan_books lb
    JOIN loans l ON l.id = lb.loan_id
    WHERE lb.book_id = books.id
    AND l.return_date IS NULL
    AND l.loan_date <= DATE_SUB(NOW(), INTERVAL 1 YEAR)
);

------------------------------------------------------------
-- NOT IN with correlated subqueries result ----------------
------------------------------------------------------------
SELECT * FROM books b
    WHERE b.id NOT IN (
        SELECT lb.book_id
        FROM loan_books lb
        WHERE lb.book_id = b.id
    );

UPDATE authors a
    SET a.biography = CONCAT(a.biography, " Does not write books with more than 500 pages!")
    WHERE a.id NOT IN (
        SELECT ba.author_id FROM book_authors ba
        INNER JOIN books b ON b.id = ba.book_id
        WHERE ba.author_id = a.id
        AND b.pages > 500
    );
-- delete books that no one wants to take
DELETE FROM books
WHERE id NOT IN (
    SELECT lb.book_id
    FROM loan_books lb
    WHERE lb.book_id = books.id
);

------------------------------------------------------------
-- EXISTS with correlated subqueries result ----------------
------------------------------------------------------------
-- publishers who have some books
SELECT p.name publisher
    FROM publishers p
    WHERE EXISTS (
        SELECT 1 FROM books b
        WHERE b.publisher_id = p.id
    );
-- authors, writing in more than 5 genres
UPDATE authors a
    SET biography = CONCAT(biography, " Writes in numerous genres.")
    WHERE EXISTS (
        SELECT 1 FROM book_authors ba
        INNER JOIN books b ON b.id = ba.book_id
        INNER JOIN book_genres bg ON b.id = bg.book_id
        WHERE a.id = ba.author_id
        GROUP BY ba.author_id
        HAVING COUNT(bg.genre_id) > 5
    );
-- delete a customer who did not return a book
DELETE FROM customers
    WHERE EXISTS (
        SELECT 1 FROM loans l
        WHERE l.customer_id = customers.id
        AND l.return_date IS NULL
    );
----------------------------------------------------------------
-- NOT EXISTS with correlated subqueries result ----------------
----------------------------------------------------------------
-- not borrowed books
SELECT b.title FROM books b
    WHERE NOT EXISTS (
        SELECT 1 FROM loan_books lb
        WHERE lb.book_id = b.id
    );
-- genres used by more than 10 authors
UPDATE genres g
    SET g.description = CONCAT(g.description, ' Is used by more than 3 authors.')
    WHERE EXISTS (
        SELECT 1 FROM book_genres bg
        INNER JOIN books b ON b.id = bg.book_id
        INNER JOIN book_authors ba ON b.id = ba.book_id
        WHERE g.id = bg.genre_id
        GROUP BY bg.genre_id
        HAVING COUNT(DISTINCT ba.author_id) > 3
    );
-- delete all publishers that didn't write a book
DELETE FROM publishers
WHERE NOT EXISTS (
    SELECT 1
    FROM books
    WHERE publisher_id = publishers.id
);


-- Selecting the customers who have read books with the lowest and the highest ratings
SELECT DISTINCT c.name 
    FROM customers c
    INNER JOIN loans l ON l.customer_id = c.id
    INNER JOIN loan_books lb ON lb.loan_id = l.id
    INNER JOIN (
        (SELECT bo.id FROM books bo ORDER BY bo.rating DESC LIMIT 3)
        UNION 
        (SELECT boo.id FROM books boo ORDER BY boo.rating ASC LIMIT 3)
    ) AS books_union
    ON books_union.id = lb.book_id;

-- getting some statistics on books, borrowed more than once, and available
SELECT title, 'Borrowed More Than Once' AS status FROM books WHERE id IN (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        HAVING COUNT(1) > 1)
UNION ALL
    SELECT title, 'Available' AS status FROM books WHERE id NOT IN (
        SELECT lb.book_id FROM loan_books lb
        INNER JOIN loans l ON lb.loan_id = l.id
        WHERE l.return_date IS NULL);

-- selecting books borrowed more than once, having with authors with blogs
SELECT b.title AS book FROM books b
    INNER JOIN book_authors ba ON b.id = ba.book_id
    INNER JOIN authors a ON ba.author_id = a.id
    WHERE a.blog IS NOT NULL
INTERSECT
    SELECT title FROM books WHERE id IN (
        SELECT lb.book_id FROM loan_books lb
        GROUP BY lb.book_id
        HAVING COUNT(1) > 1
    );

-- selecting available books but not the horrors or Thrillers
SELECT title FROM books WHERE status = 'Available'
    EXCEPT
SELECT title FROM books
    WHERE books.id IN (
        SELECT bg.book_id FROM book_genres bg
        INNER JOIN genres g ON bg.genre_id = g.id
        WHERE g.name IN ('Thriller', 'Horror')
    );
