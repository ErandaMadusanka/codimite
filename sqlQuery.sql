CREATE TABLE customers (
    customerID int,
    customerName varchar(255),
)


CREATE TABLE orders (
    orderID int,
    customerID int,
    orderAmount decimal,
    PRIMARY KEY (orderID),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
)


-- QUERY TASK 1

SELECT c.customerName, o.OrderAmount as totalSpent
FROM customers c
INNER JOIN orders o ON c.customerId = o.customerId
GROUP BY c.customerId, c.customerName
HAVING COUNT(DISTINCT o.orderID)>1

