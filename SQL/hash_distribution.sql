CREATE TABLE Sales (
    SaleID INT,
    CustomerID INT,
    Amount DECIMAL(10,2)
)
WITH (
    DISTRIBUTION = HASH(CustomerID)
);
