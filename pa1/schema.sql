-- Selecting best books based on their rating
-- For users to choose books, started from the best rated ones

SELECT title, rating
    FROM books
    ORDER BY rating DESC
    LIMIT 10;

-- #### Selecting the best authors based on the rating of their books
-- For users to be able to review the authors starting from those whose books' ratings are the highest.
-- Also we can show the best 10 authors based on the criteria, which may be used in some articles, or mailings.

SELECT a.name author, AVG(b.rating) average_rating FROM books b
    INNER JOIN book_authors ba ON b.id = ba.book_id
    INNER JOIN authors a ON a.id = ba.author_id
    GROUP BY a.id
    ORDER BY average_rating DESC
    LIMIT 10;

-- #### Selecting the most active customers based on the number of loans they have
-- May be used to provide monthly reviews or everyday leaderboards for users.

SELECT c.name customer, COUNT(DISTINCT l.id) loans_n, COUNT(DISTINCT b.id) books FROM customers c
    INNER JOIN loans l ON l.customer_id = c.id
    INNER JOIN loan_books lb ON lb.loan_id = l.id
    INNER JOIN books b ON b.id = lb.book_id
    GROUP BY c.id
    ORDER BY loans_n DESC
    LIMIT 10;

-- #### Selecting 10 most commonly borrowed books
-- May be used in advertising, articles, and in other ways. Helps promote, or popularize some books, or prompt customers to buy books.

SELECT COUNT(lb.loan_id) loans_number, b.title title FROM books b
    INNER JOIN loan_books lb ON lb.book_id = b.id
    GROUP BY b.id
    ORDER BY loans_number DESC
    LIMIT 10;

-- #### Selecting users with the highest number of non-returned loans
-- May be used for creating special lists of users that may need to be paid more attention, or require some additional notifications.

SELECT c.name customer, COUNT(DISTINCT l.id) loans_number, COUNT(DISTINCT b.id) non_returned_books FROM customers c
    LEFT JOIN loans l ON l.customer_id = c.id
    INNER JOIN loan_books lb ON lb.loan_id = l.id
    INNER JOIN books b ON b.id = lb.book_id
    GROUP BY c.id
    HAVING MAX(l.return_date) IS NULL
    ORDER BY non_returned_books DESC
    LIMIT 10;


-- #### Selecting users with the highest number of returned loans

SELECT c.name customer, COUNT(DISTINCT l.id) loans_returned, COUNT(DISTINCT b.id) book_read FROM customers c
    LEFT JOIN loans l ON l.customer_id = c.id
    INNER JOIN loan_books lb ON lb.loan_id = l.id
    INNER JOIN books b ON b.id = lb.book_id
    WHERE l.return_date IS NOT NULL
    GROUP BY c.id
    ORDER BY loans_returned DESC
    LIMIT 10;

-- ### Find the Most Popular Genre by Count of Books Sold:
-- This information can help bookstore owners or publishers understand which genres are in high demand among readers,
-- allowing them to make informed decisions about stocking inventory or publishing new books.

SELECT g.name AS genre, COUNT(*) AS loans_count
    FROM genres g
    JOIN book_genres bg ON g.id = bg.genre_id
    JOIN books b ON bg.book_id = b.id
    JOIN loan_books lb ON b.id = lb.book_id
    JOIN loans l ON lb.loan_id = l.id
    GROUP BY g.name
    ORDER BY loans_count DESC
    LIMIT 10;


-- ### Calculate the Average Loan Duration for Each Genre:
-- Librarians can use this information to optimize loan policies, such as setting appropriate due dates
-- or adjusting renewal options,based on the average loan duration for each genre

SELECT g.name AS genre, AVG(DATEDIFF(l.return_date, l.loan_date)) AS avg_loan_duration_days
    FROM genres g
    JOIN book_genres bg ON g.id = bg.genre_id
    JOIN books b ON bg.book_id = b.id
    JOIN loan_books lb ON b.id = lb.book_id
    JOIN loans l ON lb.loan_id = l.id
    WHERE l.return_date IS NOT NULL
    GROUP BY g.name;

-- ### Currently available books
-- Is needed for showing customers what books can be borrowed, and people who have the borrowed ones

SELECT 
    b.title AS book_title,
    CASE 
        WHEN l.return_date IS NOT NULL OR lb.book_id IS NULL THEN 'Available'
        ELSE '-'
    END AS availability,
    CASE 
        WHEN l.return_date IS NOT NULL THEN '-'
        ELSE COALESCE(c.name, '-')
    END AS borrower_name
        FROM  books b
        LEFT JOIN  loan_books lb ON b.id = lb.book_id
        LEFT JOIN  loans l ON lb.loan_id = l.id
        LEFT JOIN customers c ON l.customer_id = c.id
    ORDER BY b.title;
    