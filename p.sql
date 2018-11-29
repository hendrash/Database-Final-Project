SPOOL project.out
SET ECHO ON

DELETE FROM Customers;
DELETE FROM CreditCards;
DELETE FROM Orders;
DELETE FROM Product;
DELETE FROM ProductsInOrder;
DELETE FROM Review;
DELETE FROM Seller;
DELETE FROM Shipping;


DROP TABLE Customers;
DROP TABLE CreditCards;
DROP TABLE Orders;
DROP TABLE Product;
DROP TABLE ProductsInOrder;
DROP TABLE Review;
DROP TABLE Seller;
DROP TABLE Shipping;

CREATE TABLE Customers (
  custEmail VARCHAR(20) PRIMARY KEY,
  cName VARCHAR(20) NOT NULL,
  cAddress VARCHAR(20) NOT NULL,
  cCardNum VARCHAR(16) NOT NULL
);


CREATE TABLE CreditCards (
  cardNumber INTEGER PRIMARY KEY,
  securityCode INTEGER NOT NULL,
  expDate CHAR(7) NOT NULL
);


-- --------------------------------------------------------

--
-- Table structure for table Orders
--

CREATE TABLE Orders (
  oID INTEGER PRIMARY KEY,
  oEmail VARCHAR(20) NOT NULL,
  oShipID INTEGER NOT NULL,
  oDate CHAR(10)
);

-- --------------------------------------------------------

--
-- Table structure for table Product
--

CREATE TABLE Product (
  productID INTEGER PRIMARY KEY,
  pName CHAR(15) NOT NULL,
  price INTEGER NOT NULL,
  onSale CHAR(1) DEFAULT 'N',
  salePrice DECIMAL(10,0) NOT NULL,
  quantity INTEGER NOT NULL,
  description VARCHAR(20) NOT NULL,
  imgURL VARCHAR(20) NOT NULL,
  sCompany CHAR(20) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table ProductsInOrder
--

CREATE TABLE ProductsInOrder (
  orderID INTEGER NOT NULL,
  productID INTEGER NOT NULL,
  quantity INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table Review
--

CREATE TABLE Review (
  custEmail VARCHAR(20),
  pID INTEGER,
  rating CHAR(1) NOT NULL,
  description VARCHAR(20) NOT NULL,
  rDate CHAR(10),
  PRIMARY KEY(custEmail, pID)
);

-- --------------------------------------------------------

--
-- Table structure for table Seller
--

CREATE TABLE Seller (
  email VARCHAR(20) PRIMARY KEY,
  companyName VARCHAR(20) NOT NULL,
  address VARCHAR(20),
  phoneNum VARCHAR(16) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table Shipping
--

CREATE TABLE Shipping (
  shipID INTEGER PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  sPrice INTEGER NOT NULL
);

-------------------------------------------------------------------------
-- Insert data
-------------------------------------------------------------------------
insert into Customers values('tom@mail.com','tom','t street','00001');
insert into Customers values('jim@mail.com','jim','j street','00002');
insert into Customers values('bob@mail.com','Bob','c street','00003');
insert into Customers values('cam@mail.com','cam','c street','00004');
insert into Customers values('thm@mail.com','tom','b street','00005');
insert into Customers values('max@mail.com','max','c street','00002');
insert into Customers values('jan@mail.com','jan','j street','00001');

insert into CreditCards values ('00001','001','1/11');
insert into CreditCards values ('00002','001','1/11');
insert into CreditCards values ('00003','002','1/11');
insert into CreditCards values ('00004','002','1/12');
insert into CreditCards values ('00005','001','1/12');

insert into Orders values ('0001','tom@mail.com','01','12/01');
insert into Orders values ('0003','tom@mail.com','02','12/01');
insert into Orders values ('0005','thm@mail.com','03','12/01');
insert into Orders values ('0006','thm@mail.com','03','11/30');
insert into Orders values ('0007','max@mail.com','01','11/30');
insert into Orders values ('0008','max@mail.com','01','11/31');
insert into Orders values ('0009','bob@mail.com','01','11/31');
insert into Orders values ('0002','jan@mail.com','01','12/01');

insert into Product values('101','hat','3','Y','2','1','hat.com','walmart','where on head');
insert into Product values('102','hat','1','N','1','5','hat.com','walmart','where on head');
insert into Product values('103','bat','2','N','2','1','bat.com','dunhams','play baseball');
insert into Product values('104','axe','3','Y','2','1','axe.com','dunhams','chop somthing');
insert into Product values('106','axe','4','Y','3','2','axe.com','dunhams','chop somthing');
insert into Product values('105','mat','1','N','1','4','mat.com','walmart','keep on floor');

insert into ProductsInOrder values('0001','101','1');
insert into ProductsInOrder values('0002','105','1');
insert into ProductsInOrder values('0003','106','1');
insert into ProductsInOrder values('0004','104','2');
insert into ProductsInOrder values('0005','102','1');
insert into ProductsInOrder values('0006','103','1');
insert into ProductsInOrder values('0007','101','5');
insert into ProductsInOrder values('0008','104','9');
insert into ProductsInOrder values('0009','101','4');
insert into ProductsInOrder values('0002','101','1');
insert into ProductsInOrder values('0007','105','1');
insert into ProductsInOrder values('0007','106','1');

insert into Review values('tom@mail.com','101','0','hat is bad ','01/01');
insert into Review values('thm@mail.com','101','5','hat is good','01/02');
insert into Review values('tom@mail.com','102','0','hat is bad ','01/02');
insert into Review values('max@mail.com','104','3','axe alright','01/03');
insert into Review values('tom@mail.com','105','2','mat is mhhh','01/03');
insert into Review values('jan@mail.com','105','4','mat is cool','01/01');
insert into Review values('tom@mail.com','106','5','axe is bad ','01/01');

insert into Shipping values('01','1 Day','5');
insert into Shipping values('02','5 Day','4');
insert into Shipping values('105','9 Day','0');

insert into Seller values('walmart','a street','(616)333-3333','walmart.com');
insert into Seller values('dunhams','b street','(517)111-1111','dunhams.com');




SPOOL OFF
