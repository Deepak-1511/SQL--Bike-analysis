CREATE DATABASE IRON_MOTORS;
USE IRON_MOTORS;

-- CREATING THE TABLES 

-- BIKES TABLE
 CREATE TABLE BIKES(BIKE_ID INT PRIMARY KEY,MODEL VARCHAR(100),BRAND VARCHAR(100),PRICE INT,STOCK INT);

-- CUSTOMER TABLE
CREATE TABLE CUSTOMERS(CUSTOMER_ID INT PRIMARY KEY,FIRST_NAME VARCHAR(50),LAST_NAME VARCHAR(50),LOCATION VARCHAR(50),EMAIL VARCHAR(50));

-- ORDER TABLE
CREATE TABLE ORDERS(ORDER_ID INT PRIMARY KEY,CUSTOMER_ID INT,ORDER_DATE DATE,TOTAL_AMOUNT INT,FOREIGN KEY (CUSTOMER_ID)
REFERENCES CUSTOMERS(CUSTOMER_ID));

-- ORDERS DETAILS TABLE
CREATE TABLE ORDERS_DETAILS(ORDER_DETAILS_ID INT PRIMARY KEY,ORDER_ID INT,BIKE_ID INT,QUATITY INT,PRICE INT,FOREIGN KEY (ORDER_ID)
REFERENCES ORDERS(ORDER_ID),FOREIGN KEY (BIKE_ID) REFERENCES BIKES(BIKE_ID));


-- DATA INSERTION

-- INSERTING INTO BIKES TABLE
INSERT INTO BIKES()VALUES(1,"DUKE 200","KTM",230000,5),(2,"HUNTER 350","ROYAL ENFIELD",210000,3),(3,"SPLENDOR X-TECH","HERO",95000,7),
(4,"RONIN-225","TVS",175000,4);

-- INSERTING INTO CUSTOMERS TABLE
INSERT INTO CUSTOMERS()VALUES(101,"JAI","KRISHNA","CHENNAI","JAIKRISHNA@GMAIL.COM"),(102,"DILIP","KUMAR","MUMBAI","DILIP@GMAIL.COM"),
(103,"SAI","KRISHNA","PUNJAB","SAI12@GMAIL.COM"),(104,"SARATH","BABU","VIZAG","SARATH123@GMAIL.COM");

-- INSERTING INTO ORDERS TABLE
INSERT INTO ORDERS()VALUES(001,101,'2021-05-01',230000),(002,102,'2024-05-02',210000),(003,104,'2024-05-03',175000);

-- INSERTING INTO ORDERS_DETAILS TABLE
INSERT INTO ORDERS_DETAILS()VALUES(201,001,1,1,230000),(202,002,2,1,210000),(203,003,3,1,175000);


-- QUERIES

-- LISTING ALL BIKES AVAILABLE IN THE STORE
SELECT*FROM BIKES;

-- LISTING ALL THE CUSTOMERS
SELECT*FROM CUSTOMERS;

-- RETRIEVE ALL ORDERS
SELECT*FROM ORDERS;

-- RETRIEVE ALL ORDER DETAILS
SELECT*FROM ORDERS_DETAILS;

-- FIND A CUSTOMER BY ID
SELECT*FROM CUSTOMERS WHERE CUSTOMER_ID=101;

-- FIND A BIKE BY ID
SELECT*FROM BIKES WHERE BIKE_ID=2;

-- GET THE TOTAL NUMBER OF BIKES IN STOCK
SELECT SUM(STOCK) AS TOTAL_BIKES_IN_STOCK FROM BIKES;

-- GET TOTAL SALES FOR A SPECIFIC ORDER
SELECT TOTAL_AMOUNT FROM ORDERS WHERE ORDER_ID=003;

-- LIST ALL CUSTOMERS FULL NAMES
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)AS FULL_NAME FROM CUSTOMERS;

-- FIND THE NUMBER OF ORDERS PLACED BY EACH CUSTOMER
SELECT CUSTOMER_ID, COUNT(*) AS ORDER_COUNT FROM ORDERS GROUP BY CUSTOMER_ID;

-- FIND TOTAL QUANTITY OF EACH BIKE SOLD
SELECT BIKE_ID, SUM(QUANTITY) AS TOTAL_SOLD FROM ORDERS_DETAILS GROUP BY BIKE_ID;

-- FIND THE MOST EXPENSIVE BIKE
SELECT MODEL,PRICE FROM BIKES ORDER BY PRICE DESC LIMIT 1;

-- RENAMING A COLUMN & TABLE
ALTER TABLE ORDERS_DETAILS RENAME COLUMN QUATITY TO QUANTITY;
SELECT*FROM ORDERS_DETAILS;

ALTER TABLE CUSTOMERS RENAME TO CLIENTS;
SELECT*FROM CLIENTS;

-- ADD A DEFAULT VALUE 
ALTER TABLE BIKES MODIFY COLUMN STOCK INT DEFAULT 0;
SELECT*FROM BIKES;



    