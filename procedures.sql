######################################## PROCEDURE 1 ########################################
#############################################################################################
# Imagine a situation that a customer comes to the library and wants to return some of the books and take some other.
# Reasonably enough, we're going to prompt the customer to provide their full name, to find the record.

# get all customers with 'name'
DELIMITER //
CREATE PROCEDURE get_customers_with_name (IN customer_name VARCHAR(100))
BEGIN
    SELECT id, name, email FROM customers
    WHERE customer_name = name;
END;
DELIMITER ;

CALL `get_customers_with_name`('John Doe');

######################################## PROCEDURE 2 ########################################
#############################################################################################
# When the id of the customer is known, we can take a look at the loans they did not return:

# get all the loans of customer 'id'
DELIMITER //
CREATE PROCEDURE get_loans_of_customer_with_id (IN c_id INT)
BEGIN
    SELECT l.id loan_id, b.title book_title FROM customers c
    INNER JOIN loans l ON l.customer_id = c.id
    INNER JOIN loan_books lb ON lb.loan_id = l.id
    INNER JOIN books b ON b.id = lb.book_id
    WHERE c.id = c_id AND l.return_date IS NULL;
END;
DELIMITER ;

CALL get_loans_of_customer_with_id(1);

######################################## PROCEDURE 3 ########################################
#############################################################################################
# And when the customer selected the loan, books for which they brought with them, we can mark the loan as "returned",
# and the books as "Available", so that we knew that everything's all right, and the customer is allowed to take other books.

# *return* loan with 'id'

DELIMITER //
CREATE PROCEDURE return_loan_with_id (INOUT l_id INT)
BEGIN
    DECLARE continue_handler INT DEFAULT FALSE;
    DECLARE affected_rows INT;
    DECLARE loan_not_found CONDITION FOR SQLSTATE '45000';

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SET continue_handler = TRUE;

    START TRANSACTION;

    UPDATE books b
        INNER JOIN loan_books lb ON b.id = lb.book_id
        SET b.status = 'Available'
        WHERE lb.loan_id = l_id
        AND b.status != 'Available';

    UPDATE loans
        SET return_date = CURRENT_TIMESTAMP
        WHERE id = l_id
        AND return_date IS NULL;

    SELECT ROW_COUNT() INTO affected_rows;

    IF continue_handler OR affected_rows = 0 THEN
        ROLLBACK;
        SET l_id = -1;
    ELSE
        COMMIT;
    END IF;
END//
DELIMITER ;
SET @loan_id = 10;
################################## TRANSACTION NOTE ##################################
# if we choose the id received from the previous query, the procedure should work fine.
# but if we call it once again, it'll return "-1", as we do not update any data further.
CALL return_loan_with_id(@loan_id);
SELECT @loan_id AS returned_loan_id;

######################################## PROCEDURE 4 ########################################
#############################################################################################
# And the final step left is to take some new books. For this the customer tells books of which genre 
# are the most interesting for them, and we provide the corresponding list of the books.

# books of 'genre'
DELIMITER //
CREATE PROCEDURE get_books_of_genre (IN gnr VARCHAR(100), OUT books_of_the_genre TEXT)
BEGIN
    SELECT GROUP_CONCAT(' ', b.title) INTO books_of_the_genre FROM books b
        INNER JOIN book_genres bg ON bg.book_id = b.id
        INNER JOIN genres g ON g.id = bg.genre_id
        WHERE g.name = gnr;
END//
DELIMITER ;

CALL get_books_of_genre("Fiction", @books_of_the_genre);
SELECT @books_of_the_genre;
