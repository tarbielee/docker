SELECT * from customer

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

SELECT * FROM products WHERE buyprice BETWEEN 'R100' AND 'R600';

SELECT * FROM customer WHERE country ='Germany' and city ='Berlin';

SELECT * FROM customer WHERE city ='Cape Town' OR city ='Durban';

SELECT * FROM products WHERE buyprice > 'R500';

SELECT count( * ) FROM orders WHERE status = 'Shipped';


