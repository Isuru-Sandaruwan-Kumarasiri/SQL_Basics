mysql> ######### AlteringTables
Query OK, 0 rows affected (0.00 sec)

mysql> ALTER TABLE drink_info
    -> CHANGE 
    -> Cost
    -> price
    -> AFTER Calories | FIRST;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AFTER Calories | FIRST' at line 5
mysql> ALTER TABLE drink_info
    -> CHANGE 
    -> Cost
    -> price
    -> AFTER Calories;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AFTER Calories' at line 5
mysql> ALTER TABLE drink_info
    -> CHANGE Cost price DECIMAL(10,2)
    -> AFTER Calories;
Query OK, 6 rows affected (0.13 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM drink_info;
+------------+--------+----------+-------+------+
| DrinkName  | Color  | Calories | price | Ice  |
+------------+--------+----------+-------+------+
| Fanta      | Orange |       33 | 50.00 | Y    |
| Mrinda     | Orange |       12 | 60.00 | N    |
| Coca Cola  | Red    |       50 | 55.00 | Y    |
| Necto      | Purple |       19 | 70.00 | Y    |
| Cream Soda | Yellow |       10 | 50.00 | Y    |
| Lemonade   | Yellow |       50 | 70.00 | N    |
+------------+--------+----------+-------+------+
6 rows in set (0.00 sec)

mysql> ALTER TABLE drink_info
    -> CHANGE 
    -> Cost
    -> ^C
mysql> ALTER TABLE drink_info
    -> CHANGE Cost Price DECIMAL(10,2)
    -> FIRST Calories;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Calories' at line 3
mysql> UPDATE drrink_info
    -> SET
    -> price=100
    -> WHERE 
    -> DrinkName='Fanta';
ERROR 1146 (42S02): Table 'students.drrink_info' doesn't exist
mysql> UPDATE drink_info
    -> SET
    -> price=100
    -> WHERE 
    -> DrinkName='Fanta';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM drink_info;
+------------+--------+----------+--------+------+
| DrinkName  | Color  | Calories | price  | Ice  |
+------------+--------+----------+--------+------+
| Fanta      | Orange |       33 | 100.00 | Y    |
| Mrinda     | Orange |       12 |  60.00 | N    |
| Coca Cola  | Red    |       50 |  55.00 | Y    |
| Necto      | Purple |       19 |  70.00 | Y    |
| Cream Soda | Yellow |       10 |  50.00 | Y    |
| Lemonade   | Yellow |       50 |  70.00 | N    |
+------------+--------+----------+--------+------+
6 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> ############# IF Statement
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT price,Color,
    -> IF(price>50,'More than 50','Less than 50')
    -> FROM drink_info;
+--------+--------+--------------------------------------------+
| price  | Color  | IF(price>50,'More than 50','Less than 50') |
+--------+--------+--------------------------------------------+
| 100.00 | Orange | More than 50                               |
|  60.00 | Orange | More than 50                               |
|  55.00 | Red    | More than 50                               |
|  70.00 | Purple | More than 50                               |
|  50.00 | Yellow | Less than 50                               |
|  70.00 | Yellow | More than 50                               |
+--------+--------+--------------------------------------------+
6 rows in set (0.00 sec)

mysql> UPDATE drink_info
    -> SET Ice
    -> CASE 
    -> WHEN Ice='Y'
    -> THEN 'yes'
    -> when Ice='N'
    -> THEN 'no'
    -> ELSE 
    -> "null"
    -> END;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE 
WHEN Ice='Y'
THEN 'yes'
when Ice='N'
THEN 'no'
ELSE 
"null"
END' at line 3
mysql> UPDATE drink_info
    -> SET Ice
    -> CASE 
    -> WHEN Ice='Y'
    -> THEN 'yes'
    -> WHEN Ice='N'
    -> THEN 'no'
    -> ELSE 
    -> 'null'
    -> END;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE 
WHEN Ice='Y'
THEN 'yes'
WHEN Ice='N'
THEN 'no'
ELSE 
'null'
END' at line 3
mysql> UPDATE drink_info
    -> SET Ice
    -> CASE =
    -> WHEN Ice='Y'
    -> THEN 'yes'
    -> WHEN Ice='N'
    -> THEN 'no'
    -> ELSE 
    -> 'null'
    -> END;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE =
WHEN Ice='Y'
THEN 'yes'
WHEN Ice='N'
THEN 'no'
ELSE 
'null'
END' at line 3
mysql> UPDATE drink_info
    -> SET Ice=
    -> CASE 
    -> WHEN Ice='Y'
    -> THEN 'yes'
    -> WHEN Ice='N'
    -> THEN 'no'
    -> ELSE 
    -> 'null'
    -> END;
ERROR 1265 (01000): Data truncated for column 'Ice' at row 1
mysql> ALTER TABLE drink_info MODIFY Ice VARCHAR(3);
Query OK, 6 rows affected (0.12 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> UPDATE drink_info
    -> SET Ice = 
    -> CASE
    ->     WHEN Ice = 'Y' THEN 'yes'
    ->     WHEN Ice = 'N' THEN 'no'
    ->     ELSE 'null'
    -> END;
Query OK, 6 rows affected (0.02 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> SET * FROM drink_info;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM drink_info' at line 1
mysql> SELECT * FROM drink_info;
+------------+--------+----------+--------+------+
| DrinkName  | Color  | Calories | price  | Ice  |
+------------+--------+----------+--------+------+
| Fanta      | Orange |       33 | 100.00 | yes  |
| Mrinda     | Orange |       12 |  60.00 | no   |
| Coca Cola  | Red    |       50 |  55.00 | yes  |
| Necto      | Purple |       19 |  70.00 | yes  |
| Cream Soda | Yellow |       10 |  50.00 | yes  |
| Lemonade   | Yellow |       50 |  70.00 | no   |
+------------+--------+----------+--------+------+
6 rows in set (0.00 sec)

mysql> SELECT LEFT("CSC204- DBMS PRACTICAL",5);
+----------------------------------+
| LEFT("CSC204- DBMS PRACTICAL",5) |
+----------------------------------+
| CSC20                            |
+----------------------------------+
1 row in set (0.00 sec)

mysql> SELECT RIGHT("CSC204- DBMS PRACTICAL",5);
+-----------------------------------+
| RIGHT("CSC204- DBMS PRACTICAL",5) |
+-----------------------------------+
| TICAL                             |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING("CSC204- DBMS PRACTICAL",5,6);
+-----------------------------------------+
| SUBSTRING("CSC204- DBMS PRACTICAL",5,6) |
+-----------------------------------------+
| 04- DB                                  |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING("CSC204- DBMS PRACTICAL",-3);
+----------------------------------------+
| SUBSTRING("CSC204- DBMS PRACTICAL",-3) |
+----------------------------------------+
| CAL                                    |
+----------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING("CSC204- DBMS PRACTICAL",-5,3);
+------------------------------------------+
| SUBSTRING("CSC204- DBMS PRACTICAL",-5,3) |
+------------------------------------------+
| TIC                                      |
+------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING("CSC204- DBMS","PRACTICAL");
+---------------------------------------+
| SUBSTRING("CSC204- DBMS","PRACTICAL") |
+---------------------------------------+
|                                       |
+---------------------------------------+
1 row in set, 2 warnings (0.00 sec)

mysql> SELECT CONCAT("CSC204- DBMS","PRACTICAL");
+------------------------------------+
| CONCAT("CSC204- DBMS","PRACTICAL") |
+------------------------------------+
| CSC204- DBMSPRACTICAL              |
+------------------------------------+
1 row in set (0.00 sec)

mysql> Terminal close -- exit!
