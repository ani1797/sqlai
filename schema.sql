-- Create customers table with primary key constraint on customerID
CREATE TABLE customers (
  customerID TEXT PRIMARY KEY,
  firstName TEXT,
  lastName TEXT,
  birthDay date
);

-- Create orders table with primary key constraint on orderID and foreign key constraint referencing customers.customerID
CREATE TABLE orders (
  orderID TEXT PRIMARY KEY,
  customerID TEXT FOREIGN KEY REFERENCES customers(customerID),
  orderDate date
);

-- Create products table with primary key constraint on productID
CREATE TABLE products (
  productID TEXT PRIMARY KEY,
  productName TEXT,
  catagory TEXT,
  itemPrice number
);

-- Create order_items table with primary key constraint on orderID and productID and foreign key constraints referencing orders and products
CREATE TABLE order_items (
  orderID TEXT,
  productID TEXT,
  itemCount number,
  salePrice number,
  PRIMARY KEY (orderID, productID),
  FOREIGN KEY REFERENCES orders(orderID),
  FOREIGN KEY REFERENCES products(productID)
);

-- Insert data into customers table
INSERT INTO customers (customerID, firstName, lastName, birthDay)
VALUES ('1', 'John', 'Smith', '1990-01-01'),
       ('2', 'Jane', 'Doe', '1995-02-02'),
       ('3', 'Bob', 'Jones', '1985-03-03'),
       ('4', 'Mary', 'Johnson', '1980-04-04'),
       ('5', 'James', 'Williams', '1975-05-05');

-- Insert data into orders table
INSERT INTO orders (orderID, customerID, orderDate)
VALUES ('1', '1', '2019-01-01'),
       ('2', '2', '2019-02-02'),
       ('3', '3', '2019-03-03'),
       ('4', '4', '2019-04-04'),
       ('5', '5', '2019-05-05');

-- Insert data into products table
INSERT INTO products (productID, productName, catagory, itemPrice)
VALUES ('1', 'Apple', 'Fruit', '1.00'),
       ('2', 'Banana', 'Fruit', '1.00'),
       ('3', 'Orange', 'Fruit', '1.00'),
       ('4', 'Milk', 'Dairy', '2.00'),
       ('5', 'Eggs', 'Dairy', '3.00'),
       ('6', 'Bread', 'Bakery', '2.00'),
       ('7', 'Cake', 'Bakery', '5.00'),
       ('8', 'Chicken', 'Meat', '5.00'),
       ('9', 'Beef', 'Meat', '5.00'),
       ('10', 'Pork', 'Meat', '5.00'),
       ('11', 'Carrots', 'Vegetable', '1.00'),
       ('12', 'Broccoli', 'Vegetable', '1.00'),
       ('13', 'Lettuce', 'Vegetable', '1.00'),
       ('14', 'Tomato', 'Vegetable', '1.00'),
       ('15', 'Potato', 'Vegetable', '1.00');

-- Insert data into order_items table
INSERT INTO order_items (orderID, productID, itemCount, salePrice)
VALUES ('1', '1', '1', '1.00'),
       ('1', '2', '1', '1.00'),
       ('1', '3', '1', '1.00'),
       ('1', '4', '1', '2.00'),
       ('1', '5', '1', '3.00'),
       ('2', '6', '1', '2.00'),
       ('2', '7', '1', '5.00'),
       ('2', '8', '1', '5.00'),
       ('2', '9', '1', '5.00'),
       ('2', '10', '1', '5.00'),
       ('3', '11', '1', '1.00'),
       ('3', '12', '1', '1.00'),
       ('3', '13', '1', '1.00'),
       ('3', '14', '1', '1.00'),
       ('3', '15', '1', '1.00'),
       ('4', '1', '1', '1.00'),
       ('4', '2', '1', '1.00'),
       ('4', '3', '1', '1.00'),
       ('4', '4', '1', '2.00'),
       ('4', '5', '1', '3.00'),
       ('5', '6', '1', '2.00'),
       ('5', '7', '1', '5.00'),
       ('5', '8', '1', '5.00'),
       ('5', '9', '1', '5.00'),
       ('5', '10', '1', '5.00');
