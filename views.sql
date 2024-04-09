-- Active: 1710152672434@@127.0.0.1@3306@first_db

-- all available books
CREATE VIEW available_books_all_info AS
    SELECT b.edition, b.isbn, b.year_published, b.price, b.pages, b.rating, b.status, b.reviews,
    GROUP_CONCAT(a.name) authors, GROUP_CONCAT(g.name) genres, COUNT(lb.book_id) loans
        FROM books b
        LEFT JOIN book_authors ba ON b.id = ba.book_id
        LEFT JOIN authors a ON ba.author_id = a.id
        INNER JOIN book_genres bg ON b.id = bg.book_id
        INNER JOIN genres g ON bg.genre_id = g.id
        LEFT JOIN loan_books lb ON b.id = lb.book_id
            WHERE b.id NOT IN (
                SELECT lb.book_id FROM loan_books lb
                INNER JOIN loans l ON lb.loan_id = l.id
                WHERE l.return_date IS NULL)
            GROUP BY b.id;

SELECT * FROM available_books_all_info;


-- all unavailable books
CREATE VIEW unavailable_books_all_info AS
    SELECT b.edition, b.isbn, b.year_published, b.price, b.pages, b.rating, b.status, b.reviews,
    GROUP_CONCAT(a.name) authors, GROUP_CONCAT(g.name) genres, COUNT(lb.book_id) loans
        FROM books b
        LEFT JOIN book_authors ba ON b.id = ba.book_id
        LEFT JOIN authors a ON ba.author_id = a.id
        INNER JOIN book_genres bg ON b.id = bg.book_id
        INNER JOIN genres g ON bg.genre_id = g.id
        LEFT JOIN loan_books lb ON b.id = lb.book_id
            WHERE b.id IN (
                SELECT lb.book_id FROM loan_books lb
                INNER JOIN loans l ON lb.loan_id = l.id
                WHERE l.return_date IS NULL)
            GROUP BY b.id;

SELECT * FROM unavailable_books_all_info;
