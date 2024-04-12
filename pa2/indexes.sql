
-- dropping indexes
DROP INDEX idx_authors_name ON authors;
DROP INDEX idx_books_title ON books;
DROP INDEX idx_publishers_name ON publishers;
DROP INDEX idx_loans_return_date ON loans;
DROP INDEX idx_books_year_published ON books;
DROP INDEX idx_loans_due_date ON loans;

-- creating indexes
CREATE INDEX idx_books_title ON books (title);
CREATE INDEX idx_authors_name ON authors (name);
CREATE INDEX idx_publishers_name ON publishers (name);
CREATE INDEX idx_loans_return_date ON loans (return_date);
CREATE INDEX idx_books_year_published ON books (year_published);
CREATE INDEX idx_loans_due_date ON loans (due_date);

