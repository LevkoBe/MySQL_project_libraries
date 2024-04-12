
# Imagine a situation that a customer comes to the library and wants to return some of the books and take some other.
# Reasonably enough, we're going to prompt the customer to provide their full name, to find the record.CALL get_customers_with_name_sproc('John Doe');

CALL get_customers_with_name_sproc('John Doe');

# When the id of the customer is known, we can take a look at the loans they did not return:
CALL get_loans_of_customer_with_id_sproc(1);

# And when the customer selected the loan, books for which they brought with them, we can mark the loan as "returned",
# and the books as "Available", so that we knew that everything's all right, and the customer is allowed to take other books.
SET @loan_id = 9;
CALL return_loan_with_id_sproc(@loan_id);
SELECT @loan_id AS returned_loan_id;

# And the final step left is to take some new books. For this the customer tells books of which genre 
# are the most interesting for them, and we provide the corresponding list of the books.

CALL get_books_of_genre_sproc("Fiction", @books_of_the_genre);
SELECT @books_of_the_genre;
