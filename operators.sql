
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 9.0.1 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use students
Database changed
mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| customer_table     |
| drink_info         |
| list_of_students   |
+--------------------+
3 rows in set (0.04 sec)

mysql> select * from customer_table;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
5 rows in set (0.03 sec)

mysql> SELECT * FROM customer_table
    -> WHERE Order_date BETWEEN "2019-11-8" AND "2019-11-22";
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                        | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy         | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy   | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07        | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
4 rows in set (0.00 sec)

mysql> WHERE  * FROM customer_table
    -> SELECT * FROM customer_table ^C
mysql> SELECT * FROM customer_table
    -> WHERE  Quantity IN (2,3);
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                        | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy         | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 128         | Steve  | 2,Deans road,Colombo 07        | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
+-------------+--------+--------------------------------+------------+---------------+--------------+----------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Delivery_date IN ('2019-12-08','2019-11-10');
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE %J;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '%J' at line 2
mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE J%;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '%' at line 2
mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE 'J%';
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name  | Address                      | Order_date | Delivery_date | Product_name | Quantity |
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
| 015         | Jane  | 22/2,Browns Road,Kandy       | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 037         | Jenny | Tree house,Katugastota,Kandy | 2019-11-19 | 2019-11-30    | Watch        |        4 |
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '___e';
+-------------+------+------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name | Address                | Order_date | Delivery_date | Product_name | Quantity |
+-------------+------+------------------------+------------+---------------+--------------+----------+
| 015         | Jane | 22/2,Browns Road,Kandy | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
+-------------+------+------------------------+------------+---------------+--------------+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '__n';
Empty set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '_n';
Empty set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '____';
+-------------+------+------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name | Address                | Order_date | Delivery_date | Product_name | Quantity |
+-------------+------+------------------------+------------+---------------+--------------+----------+
| 015         | Jane | 22/2,Browns Road,Kandy | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
+-------------+------+------------------------+------------+---------------+--------------+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '_____';
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name  | Address                      | Order_date | Delivery_date | Product_name | Quantity |
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
| 037         | Jenny | Tree house,Katugastota,Kandy | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve | 2,Deans road,Colombo 07      | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
+-------------+-------+------------------------------+------------+---------------+--------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE  Name LIKE '%e';
+-------------+-------+-------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name  | Address                 | Order_date | Delivery_date | Product_name | Quantity |
+-------------+-------+-------------------------+------------+---------------+--------------+----------+
| 015         | Jane  | 22/2,Browns Road,Kandy  | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 128         | Steve | 2,Deans road,Colombo 07 | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
+-------------+-------+-------------------------+------------+---------------+--------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM customer_table
    -> WHERE NOT  Quantity  IN (2,4);
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
3 rows in set (0.00 sec)

mysql> insert into values
-> ('158','Andrew','58 C, Second cross street,Pettah','2019-11-24','2019-11-10',' Watch',1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values
('158','Andrew','58 C, Second cross street,Pettah','2019-11-24','2019-11-' at line 1
mysql> insert into  customer_table values
    -> ('158','Andrew','58 C, Second cross street,Pettah','2019-11-24','2019-11-10',' Watch',1);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM  customer_table;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT Name FROM  customer_table;
+--------+
| Name   |
+--------+
| Jane   |
| Steven |
| Jenny  |
| Steve  |
| Andrew |
+--------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM  customer_table;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT  Customer_ID,Name,Address, Order_date,Delivery_date,Product_name,Quantity FROM  customer_table;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT  Customer_ID,Name,Address, Order_date,Delivery_date,Quantity FROM  customer_table;
+-------------+--------+----------------------------------+------------+---------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Quantity |
+-------------+--------+----------------------------------+------------+---------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |        1 |
+-------------+--------+----------------------------------+------------+---------------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM  customer_table;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM  customer_table ORDER BY Quantity;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.01 sec)

mysql> SELECT * FROM  customer_table ORDER BY Quantity ASC;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM  customer_table ORDER BY Quantity DESC;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM  customer_table ORDER BY Order_date,Quantity DESC;
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| Customer_ID | Name   | Address                          | Order_date | Delivery_date | Product_name | Quantity |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
| 018         | Steven | 98B,New Town,Galaha,Peradeniya   | 2019-11-08 | 2019-12-30    | Shoes        |        3 |
| 015         | Jane   | 22/2,Browns Road,Kandy           | 2019-11-08 | 2019-12-08    | Backpack     |        2 |
| 037         | Jenny  | Tree house,Katugastota,Kandy     | 2019-11-19 | 2019-11-30    | Watch        |        4 |
| 128         | Steve  | 2,Deans road,Colombo 07          | 2019-11-22 | 2019-11-10    | Slippers     |        3 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    | Watch        |        1 |
| 158         | Andrew | 58 C, Second cross street,Pettah | 2019-11-24 | 2019-11-10    |  Watch       |        1 |
+-------------+--------+----------------------------------+------------+---------------+--------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT Name,Address,Order_date,Delivery_date,Product_name,Quantity FROM customer_table GROUP
    -> ^C
mysql> SELECT Name,Product_name,Quantity FROM customer_table GROUP BY Name;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'students.customer_table.Product_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT Name,Product_name,Quantity FROM  customer_table GROUP BY Name;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'students.customer_table.Product_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT Name,SUM(Quantity) FROM  customer_table GROUP BY Name;
+--------+---------------+
| Name   | SUM(Quantity) |
+--------+---------------+
| Jane   |             2 |
| Steven |             3 |
| Jenny  |             4 |
| Steve  |             3 |
| Andrew |             2 |
+--------+---------------+
5 rows in set (0.01 sec)

mysql> show tables;
+--------------------+
| Tables_in_students |
+--------------------+
| customer_table     |
| drink_info         |
| list_of_students   |
+--------------------+
3 rows in set (0.00 sec)

mysql> create table cookie_sales(
    -> ID VARCHAR(20),
    -> f_name VARCHAR(20),
    -> sales FLOTE(5,2),
    -> sale_date DATE);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FLOTE(5,2),
sale_date DATE)' at line 4
mysql> create table cookie_sales(
    -> ID VARCHAR(20),
    -> f_name VARCHAR(20),
    -> sales FLOAT(5,2),
    -> sale_date DATE);
Query OK, 0 rows affected, 1 warning (0.09 sec)

mysql> insert into  cookie_sales values
    -> ('E001','Linda','1000.00','2016-01-30');
ERROR 1264 (22003): Out of range value for column 'sales' at row 1
mysql> insert into  cookie_sales values
    -> ('E001','Linda','1000.0','2016-01-30');
ERROR 1264 (22003): Out of range value for column 'sales' at row 1
mysql> ALTER TABLE cookie_sales MODIFY sales FLOAT(7,2);
Query OK, 0 rows affected, 1 warning (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> insert into  cookie_sales values
    -> ('E001','Linda','1000.00','2016-01-30');
Query OK, 1 row affected (0.01 sec)

mysql> insert into  cookie_sales values
    -> ('E002','Sally','750.00','2016-01-30'),
    -> ('E003','Zindy','500.00','2016-01-30'),
    -> ('E001','Linda','150.00','2016-02-01'),
    -> ('E001','Linda','5000.00','2016-02-01'),
    -> ('E002','Sally','250.00','2016-02-01'),
    -> ('E001','Linda','250.00','2016-02-02'),
    -> ('E002','Sally','150.00','2016-02-02'),
    -> ('E003','Zindy','50.00','2016-02-02');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from cookie_sales;
+------+--------+---------+------------+
| ID   | f_name | sales   | sale_date  |
+------+--------+---------+------------+
| E001 | Linda  | 1000.00 | 2016-01-30 |
| E002 | Sally  |  750.00 | 2016-01-30 |
| E003 | Zindy  |  500.00 | 2016-01-30 |
| E001 | Linda  |  150.00 | 2016-02-01 |
| E001 | Linda  | 5000.00 | 2016-02-01 |
| E002 | Sally  |  250.00 | 2016-02-01 |
| E001 | Linda  |  250.00 | 2016-02-02 |
| E002 | Sally  |  150.00 | 2016-02-02 |
| E003 | Zindy  |   50.00 | 2016-02-02 |
+------+--------+---------+------------+
9 rows in set (0.00 sec)

mysql> SELECT sale_date,COUNT(*) FROM cookie_sales
    -> GROUP BY sale_date;
+------------+----------+
| sale_date  | COUNT(*) |
+------------+----------+
| 2016-01-30 |        3 |
| 2016-02-01 |        3 |
| 2016-02-02 |        3 |
+------------+----------+
3 rows in set (0.01 sec)

mysql> SELECT f_name ,SUM(sales) as sum_of_the_sales FROM cookie_sales
    -> WHERE f_name='Linda'
    -> GROUP BY f_name;
+--------+------------------+
| f_name | sum_of_the_sales |
+--------+------------------+
| Linda  |          6400.00 |
+--------+------------------+
1 row in set (0.01 sec)

mysql> SELECT f_name ,SUM(sales) as sum_of_the_sales FROM cookie_sales
    -> WHERE f_name='Linda'
    -> GROUP BY f_name;
+--------+------------------+
| f_name | sum_of_the_sales |
+--------+------------------+
| Linda  |          6400.00 |
+--------+------------------+
1 row in set (0.00 sec)

mysql> SELECT f_name ,AVG(sales) as sum_of_the_sales FROM cookie_sales
    -> WHERE f_name='Linda'
    -> GROUP BY f_name;
+--------+------------------+
| f_name | sum_of_the_sales |
+--------+------------------+
| Linda  |      1600.000000 |
+--------+------------------+
1 row in set (0.00 sec)

mysql> SELECT sale_date ,MIN(sales) as minimum_of_the_sales FROM cookie_sales
    -> WHERE sale_date='2016-01-30'
    -> GROUP sale_date;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sale_date' at line 3
mysql> SELECT sale_date ,MIN(sales) as minimum_of_the_sales FROM cookie_sales
    -> WHERE sale_date='2016-01-30'
    -> GROUP BY sale_date;
+------------+----------------------+
| sale_date  | minimum_of_the_sales |
+------------+----------------------+
| 2016-01-30 |               500.00 |
+------------+----------------------+
1 row in set (0.00 sec)

mysql> SELECT sale_date ,MAX(sales) as minimum_of_the_sales FROM cookie_sales
    -> WHERE sale_date='2016-01-30'
    -> GROUP BY sale_date;
+------------+----------------------+
| sale_date  | minimum_of_the_sales |
+------------+----------------------+
| 2016-01-30 |              1000.00 |
+------------+----------------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT f_name) AS total_sales_girls
    -> FROM cookie_sales;
+-------------------+
| total_sales_girls |
+-------------------+
|                 3 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM
    -> cookie_sales LIMIT 4;
+------+--------+---------+------------+
| ID   | f_name | sales   | sale_date  |
+------+--------+---------+------------+
| E001 | Linda  | 1000.00 | 2016-01-30 |
| E002 | Sally  |  750.00 | 2016-01-30 |
| E003 | Zindy  |  500.00 | 2016-01-30 |
| E001 | Linda  |  150.00 | 2016-02-01 |
+------+--------+---------+------------+
4 rows in set (0.00 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_students |
+--------------------+
| cookie_sales       |
| customer_table     |
| drink_info         |
| list_of_students   |
+--------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM drink_info;
+------------+------+--------+----------+------+
| DrinkName  | Cost | Color  | Calories | Ice  |
+------------+------+--------+----------+------+
| Fanta      |   50 | Orange |       33 | Y    |
| Mrinda     |   60 | Orange |       12 | N    |
| Coca Cola  |   55 | Red    |       50 | Y    |
| Necto      |   70 | Purple |       19 | Y    |
| Cream Soda |   50 | Yellow |       10 | Y    |
| Lemonade   |   70 | Yellow |       50 | N    |
+------------+------+--------+----------+------+
6 rows in set (0.02 sec)

mysql> SELECT Color,SUM(Cost) FROM drink_info
    -> WHERE calories >=10
    -> GROUP BY Color HAVING SUM(Cost)>40;
+--------+-----------+
| Color  | SUM(Cost) |
+--------+-----------+
| Orange |       110 |
| Red    |        55 |
| Purple |        70 |
| Yellow |       120 |
+--------+-----------+
4 rows in set (0.01 sec)