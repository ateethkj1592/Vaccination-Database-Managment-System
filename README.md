# Vaccination-Database-Managment-System
The World Vaccination Database project is a SQL-based database management system that stores and manages global vaccination statistics.

# World Vaccination Database
This is a database management system project on world vaccination database, implemented using SQL language. The database contains information on various vaccines, their manufacturers, countries, and the number of vaccinations administered.

### Getting Started
To get started with the project, you'll need to have an SQL database management system installed on your machine. You can use any system of your choice, such as MySQL, PostgreSQL, or SQLite.

Once you have the database management system installed, you can clone this repository to your local machine using the following command:

git clone https://github.com/ateethkj1592/Vaccination-Database-Management-System.git

### Database Structure
The world vaccination database contains the following tables:

#### Vaccines
This table contains information on various vaccines, including their names, manufacturers, and the diseases they protect against.

#### countries
This table contains information on various countries, including their names and populations.

#### vaccinations
This table contains information on the number of vaccinations administered in each country for each vaccine.

## Sample Queries
Here are some sample queries that you can run on the world vaccination database:

### Query 1: Get the name and manufacturer of all vaccines in the database
SELECT name, manufacturer FROM vaccines;

### Query 2: Get the name and population of all countries in the database
SELECT name, population FROM countries;


## Conclusion
This project demonstrates how an SQL database management system can be used to store and manage information on the world vaccination database. You can use this project as a starting point to build more complex systems that can provide valuable insights into vaccination trends and patterns around the world.



