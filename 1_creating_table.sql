CREATE TABLE transactions (
    TransactionID VARCHAR PRIMARY KEY NOT NULL,
    Timestamp TIMESTAMP NOT NULL,
    CustomerID VARCHAR NOT NULL,
    Name VARCHAR NOT NULL,
    Surname VARCHAR NOT NULL,
    Shipping_State VARCHAR NOT NULL,
    Item VARCHAR NOT NULL,
    Description VARCHAR NOT NULL,
    Retail_Price FLOAT(2) NOT NULL,
    Loyalty_Discount FLOAT(2)
);
