# MySQL Project Documentation

## **Welcome to our Library Management System!**

Welcome aboard! 📚 Our Library Management System brings the enchanting experience of exploring a library to the digital realm!

### **What's This Project All About?**

Imagine you're enrolled in a course on relational databases, tasked with creating a robust system to manage a bustling library. This project is the culmination of your journey—a comprehensive Library Management System crafted with care and precision. From defining table schemas to optimizing database performance with indexes, every aspect has been meticulously crafted to deliver a seamless experience for librarians and bookworms alike.

## **Table of Contents**

- [Welcome to our Library Management System](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#welcome-to-our-library-management-system)
- [What's This Project All About](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#whats-this-project-all-about)
- [What's Inside? or Project Structure](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#whats-inside)
- [How to Deploy the Project](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#how-to-deploy-the-project)
- [Setup Your Database](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#setup-your-database)
- [Execute SQL Scripts](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#execute-sql-scripts)
- [Optimize Performance](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#optimize-performance)
- [CRUD Operations](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#crud-operations)
- [Procedures and Transactions](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#procedures-and-transactions)
- [Gain New Perspectives](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#gain-new-perspectives)
- [Ready to Launch?](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#ready-to-launch)
- [Bonus Task](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#bonus-task)
- [About the Author](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/README.md#about-the-author)

### **What's Inside?**

### pa1:

- **create_tables.sql**: SQL script for creating all the necessary database tables.
- **dummy_data.sql**: SQL script for inserting dummy data into the tables.
- **image.png**: PlanUML class diagram representing the database schema.
- **schema.sql**: SQL script containing a set of different queries for data manipulation.

### pa2:

- **indexes.sql**: SQL script for dropping and creating indexes on specific columns in the tables.

### pa3:

- **subqueries.sql**: SQL script containing CRUD queries with correlational and non-correlational subqueries.
- **crud_application.py**: Python script for performing CRUD operations on the database.
- **showcase-1.png**: Screenshot showcasing the functionality of the Python code.
- **showcase-2.png**: Another screenshot showcasing the functionality of the Python code.

### pa4:

- **procedures.sql**: SQL script containing stored procedures for various database operations, including transaction handling.
- **executions.sql**: SQL script for executing the stored procedures.

### pa5:

- **views.sql**: SQL script for creating views to retrieve specific data from the tables.
- **[bonus.md](http://bonus.md/)**: Documentation providing guidelines for contributing to the MySQL Project Libraries repository.

## How to Deploy the Project

1. Create a MySQL database instance.
2. Clone the repository to your local machine:
    
    ```bash
    git clone https://github.com/your-username/MySQL_project_libraries.git
    ```
    
3. Navigate to the project directory:
    
    ```bash
    cd MySQL_project_libraries
    ```
    
4. Run the SQL scripts in the respective **`pa1`**, **`pa2`**, **`pa3`**, **`pa4`**, and **`pa5`** directories to set up the database schema, indexes, procedures, views, and other artifacts.
5. Execute the Python CRUD application script **`crud_application.py`** in **`pa3`** directory to interact with the database.

## **Your Journey Begins Here!**

Here's a brief plan to guide you through launching our Library Management System on your own database:

1. **Setup Your Database**: Start by setting up a MySQL database on your local machine or preferred server. Make sure you have the necessary permissions to create tables, indexes, procedures, and views.
2. **Execute SQL Scripts**: Begin with pa1 and execute the SQL scripts provided in **`create_tables.sql`** and **`dummy_data.sql`** to create the tables and insert dummy data into your database.
3. **Optimize Performance**: Move on to pa2 and execute the SQL scripts in **`indexes.sql`** to optimize database performance with indexes.
4. **CRUD Operations**: Explore pa3 and run the Python CRUD application in **`crud_application.py`** to perform CRUD operations on your database, interacting with loans, customers, and more.
5. **Procedures and Transactions**: Next, dive into pa4 and execute the SQL scripts in **`procedures.sql`** to define procedures for managing loan returns, fetching customer data, and handling transactions.
6. **Gain New Perspectives**: Lastly, explore pa5 and execute the SQL scripts in **`views.sql`** to create views that offer unique insights into loaned books, available titles, and more.

## **Ready to Launch?**

Congratulations! You've embarked on an exciting journey to bring our Library Management System to life. By following these steps, you'll have your very own digital library ready to explore and manage. Happy exploring!

## **Bonus Task**

The [**`bonus.md`** file](https://github.com/LevkoBe/MySQL_project_libraries/blob/main/pa5/bonus.md) provides documentation on how to contribute to the MySQL Project Libraries repository. Follow the instructions outlined in the document to contribute to the project.

## **About the Author**

This project was developed by [Levko Beniakh](https://www.linkedin.com/in/levko-beniakh-91a2422b4/), a passionate software developer interested in database management and application development.

For any inquiries or assistance, feel free to contact the author at [lbeniakh@kse.org.ua](mailto:lbeniakh@kse.org.ua)
