SELECT * from customer;

SELECT firstname From customer;

SELECT * FROM customer WHERE customerid = 1;

UPDATE customer
SET firstname = 'Lerato', lastname = 'Mabitso'
WHERE customerid = 1;

DELETE FROM customer
WHERE customerid = 2;

SELECT count(status) FROM orders;

SELECT MAX(amount) FROM payments;

SELECT * FROM customer ORDER BY country ASC;

SELECT * FROM products WHERE buyprice BETWEEN '100' AND '600';

SELECT * FROM customer WHERE country ='Germany' and city ='Berlin';

SELECT * FROM customer WHERE city ='Cape Town' OR city ='Durban';

SELECT * FROM products WHERE buyprice > '500';

SELECT sum(amount) FROM payments;

SELECT count( * ) FROM orders WHERE status = 'Shipped';

SELECT AVG(buyprice / 12) as Dollar, AVG(buyprice) as rand FROM products;

SELECT customer.customerid,payments.paymentid FROM customer inner join payments on customer.customerid = payments.paymentid; 

SELECT * FROM products WHERE description like 'Turnable front wheels%';


