DROP TABLE IF EXISTS "customer";
DROP SEQUENCE IF EXISTS customer_customerid_seq;
CREATE SEQUENCE customer_customerid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 10 CACHE 1;

CREATE TABLE "public"."customer" (
    "customerid" integer DEFAULT nextval('customer_customerid_seq') NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "gender" character varying,
    "address" character varying(200),
    "phone" character varying,
    "email" character varying(100),
    "city" character varying(20),
    "country" character varying(50),
    CONSTRAINT "customer_pkey" PRIMARY KEY ("customerid")
) WITH (oids = false);

TRUNCATE "customer";
INSERT INTO "customer" ("customerid", "firstname", "lastname", "gender", "address", "phone", "email", "city", "country") VALUES
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd,Gillits',	'820832830',	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	'44856872553',	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	'448672445058',	'Js234@yahoo.com',	'Frankfurt',	'Germany'),
(1,	'Lerato',	'Mabitso',	'Male',	'284 chaucer st',	'84789657',	'john@gmail.com',	'Johannesburg',	'South Africa');

DROP TABLE IF EXISTS "employee";
DROP SEQUENCE IF EXISTS employee_employeeid_seq;
CREATE SEQUENCE employee_employeeid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."employee" (
    "employeeid" integer DEFAULT nextval('employee_employeeid_seq') NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employee_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);

TRUNCATE "employee";
INSERT INTO "employee" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_orderid_seq;
CREATE SEQUENCE orders_orderid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."orders" (
    "orderid" integer DEFAULT nextval('orders_orderid_seq') NOT NULL,
    "productid" integer,
    "paymentid" integer,
    "fulfilledbyemployeeid" integer,
    "daterequired" character varying,
    "dateshipped" character varying,
    "status" character varying(20),
    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid")
) WITH (oids = false);

TRUNCATE "orders";
INSERT INTO "orders" ("orderid", "productid", "paymentid", "fulfilledbyemployeeid", "daterequired", "dateshipped", "status") VALUES
(1,	1,	1,	2,	'05-09-2018',	NULL,	'Not shipped'),
(2,	1,	2,	2,	'04-09-2018',	'03-09-2018',	'Shipped'),
(3,	3,	3,	3,	'06-09-2018',	NULL,	'Not shipped');

DROP TABLE IF EXISTS "payments";
DROP SEQUENCE IF EXISTS payments_paymentid_seq;
CREATE SEQUENCE payments_paymentid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."payments" (
    "customerid" integer,
    "paymentid" integer DEFAULT nextval('payments_paymentid_seq') NOT NULL,
    "paymentdate" date NOT NULL,
    "amount" numeric NOT NULL,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid"),
    CONSTRAINT "payments_customerid_fkey" FOREIGN KEY (customerid) REFERENCES customer(customerid) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "payments";
INSERT INTO "payments" ("customerid", "paymentid", "paymentdate", "amount") VALUES
(1,	1,	'2018-01-09',	150.75),
(5,	2,	'2018-03-09',	150.75),
(4,	3,	'2018-03-09',	700.60);

DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_productid_seq;
CREATE SEQUENCE products_productid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" decimal,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
) WITH (oids = false);

TRUNCATE "products";
INSERT INTO "products" ("productid", "productname", "description", "buyprice") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	'150.75'),
(2,	'Classic Car',	'Turnable front wheels, steering function',	'550.75'),
(3,	'Sports car',	'Turnable front wheels, steering function',	'700.60');