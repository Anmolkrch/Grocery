ALTER TABLE Tbl_Product
ADD CONSTRAINT CK_Product_Stock
CHECK (StockQuantity >= 0);