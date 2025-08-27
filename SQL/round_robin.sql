CREATE TABLE Sales (
    SaleID INT,
    ProductID INT,
    Amount DECIMAL(10,2)
)
WITH (
    DISTRIBUTION = ROUND_ROBIN
);
