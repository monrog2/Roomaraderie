====================packages to install=====================
sudo apt-get install mysql-server
sudo apt-get install apache

sudo apt-get install python-pip
pip install -U pip
sudo apt-get install python-dev 
sudo apt-get install libmysqlclient-dev
pip install mysql-python

sudo apt-get install python-mysqldb



====================mysql setup===============================
The following is the syntax to be used to setup mysql database after it is installed via:

mysql>CREATE DATABASE roomdb;
mysql>USE roomdb;
mysql>SELECT User FROM mysql.user;
mysql>CREATE USER ‘roomaraderie’@’localhost’ IDENTIFIED BY ‘Capstone132’;

mysql>GRANT ALL PRIVILEGES ON roomdb.* TO 'roomaraderie'@'%' IDENTIFIED BY 'Capstone132';
///// If the above doesn't work try the below //////
mysql>GRANT ALL PRIVILEGES ON *.* TO ‘roomaraderie’@’localhost’;  

mysql>FLUSH PRIVILEGES;

to import db file to mysql db from bash:
> mysql -u roomaraderie -p -h localhost roomdb < Desktop/.../myRoomDB.sql


========================Checking db tables========================
login to mysql with:
mysql -u roomaraderie -p roomdb

and then enter the password.

======================Current Schema===========================

mysql> describe users;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| name     | varchar(100) | YES  |     | NULL    |                |
| gender   | varchar(2)   | YES  |     | NULL    |                |
| age      | int(11)      | YES  |     | NULL    |                |
| email    | varchar(100) | YES  |     | NULL    |                |
| password | varchar(100) | YES  |     | NULL    |                |
| owner    | bin          | YES  |     | NULL    |  //NOT_IMPL    |
| student  | bin          | YES  |     | NULL    |  //NOT_IMPL    |
+----------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> describe profiles;  ////NOT FOR FINAL VERSION
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| user_id | int(11)    | NO   | MUL | NULL    |       |
| drink   | varchar(2) | YES  |     | NULL    |       |
| party   | varchar(2) | YES  |     | NULL    |       |
| smoke   | varchar(2) | YES  |     | NULL    |       |
| clean   | varchar(2) | YES  |     | NULL    |       |
| pets    | varchar(2) | YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
6 rows in set (0.00 sec)


------NOT YET CREATED, CURRENTLY FOR LOGIC------

mysql> describe prof_questions;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| question | varchar(100) | YES  |     | NULL    |                |
| type     | varchar(2)   | YES  |     | NULL    |                |
| posans1  | varchar(100) | YES  |     | NULL    |                |
| posans2  | varchar(100) | YES  |     | NULL    |                |
| posans3  | varchar(100) | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> describe pref_questions;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| question | varchar(100) | YES  |     | NULL    |                |
| type     | varchar(2)   | YES  |     | NULL    |                |
| posans1  | varchar(50)  | YES  |     | NULL    |                |
| posans2  | varchar(50)  | YES  |     | NULL    |                |
| posans3  | varchar(50)  | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> describe house_listings;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| name     | varchar(100) | YES  |     | NULL    |                |
| addr     | varchar(2)   | YES  |     | NULL    |                |
| desc     | varchar(50)  | YES  |     | NULL    |                |
| price    | varchar(50)  | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> describe user_preferences;
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| user_id | int(11)    | NO   | MUL | NULL    |       |
| pref_id | int(11)    | YES  |     | NULL    |       |
| weight  | int(3)     | YES  |     | NULL    |       |
| answer  | varchar(50)| YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe user_profiles;
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| user_id | int(11)    | NO   | MUL | NULL    |       |
| prof_id | int(11)    | YES  |     | NULL    |       |
| weight  | int(3)     | YES  |     | NULL    |       |
| answer  | varchar(50)| YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe user_houses;
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| user_id | int(11)    | NO   | MUL | NULL    |       |
| house_id| int(11)    | YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe user_favs;
+---------+------------+------+-----+---------+-------+
| Field   | Type       | Null | Key | Default | Extra |
+---------+------------+------+-----+---------+-------+
| user_id | int(11)    | NO   | MUL | NULL    |       |
| house_id| int(11)    | YES  |     | NULL    |       |
+---------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


=====================Running test script======================
from your box, depending on location you can either CD to the containing folder or 
specify relative path to db_read.py.
Then run:
>python /.../db_read.py

It will ask you for your name then check it again the db. if it already exists, it 
will tell you so. if you are a new name, you will be added. Feel free to look at the script.
