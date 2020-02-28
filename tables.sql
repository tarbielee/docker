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

INSERT INTO "customer" ("customerid", "firstname", "lastname", "gender", "address", "phone", "email", "city", "country") VALUES
(1,	'John',	'Hibert',	'Male',	'284 chaucer st',	'84789657',	'john@gmail.com',	'Johannesburg',	'South Africa'),
(2,	'Thando',	'Sithole',	'Female',	'240 Sect 1',	'794445584',	'thando@gmail.com',	'Cape Town',	'South Africa'),
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd,Gillits',	'820832830',	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	'44856872553',	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	'448672445058',	'Js234@yahoo.com',	'Frankfurt',	'Germany');


CREATE TABLE "public"."employee" (
    "employeeid" integer DEFAULT nextval('employee_employeeid_seq') NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employee_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);

INSERT INTO "employee" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');


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

INSERT INTO "orders" ("orderid", "productid", "paymentid", "fulfilledbyemployeeid", "daterequired", "dateshipped", "status") VALUES
(1,	1,	1,	2,	'05-09-2018',	NULL,	'Not shipped'),
(2,	1,	2,	2,	'04-09-2018',	'03-09-2018',	'Shipped'),
(3,	3,	3,	3,	'06-09-2018',	NULL,	'Not shipped');


CREATE TABLE "public"."payments" (
    "customerid" integer DEFAULT nextval('payments_customerid_seq') NOT NULL,
    "paymentid" integer,
    "paymentdate" character varying,
    "amount" character varying,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("customerid")
) WITH (oids = false);

INSERT INTO "payments" ("customerid", "paymentid", "paymentdate", "amount") VALUES
(1,	1,	'01-09-2018',	'R150.75'),
(5,	2,	'03-09-2018',	'R150.75'),
(4,	3,	'03-09-2018',	'R700.60');



CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" character varying,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
) WITH (oids = false);

INSERT INTO "products" ("productid", "productname", "description", "buyprice") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	'R150.75'),
(2,	'Classic Car',	'Turnable front wheels, steering function',	'R550.75'),
(3,	'Sports car',	'Turnable front wheels, steering function',	'R700.60');