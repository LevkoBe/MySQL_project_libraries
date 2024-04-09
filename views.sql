-- Active: 1710152672434@@127.0.0.1@3306@first_db


-- loaned books brief info
CREATE VIEW loaned_books_brief_info AS
SELECT b.title AS book, 
        GROUP_CONCAT(DISTINCT a.name SEPARATOR ", ") AS authors, 
        CONCAT(p.name, ' (', b.year_published, ')') AS published,
        DATE_FORMAT(MAX(l.loan_date), '%b, %d %Y') AS loan_date, 
        CONCAT(DATEDIFF(MAX(l.due_date), NOW()), " days") AS days_until_end_term
    FROM books b
    LEFT JOIN book_authors ba ON b.id = ba.book_id
    LEFT JOIN authors a ON ba.author_id = a.id
    LEFT JOIN publishers p ON b.publisher_id = p.id
    INNER JOIN loan_books lb ON b.id = lb.book_id
    INNER JOIN loans l ON lb.loan_id = l.id
    WHERE l.return_date IS NULL
    GROUP BY b.id, b.title;

SELECT * FROM loaned_books_brief_info;


-- all available books info
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


-- all unavailable books info
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
