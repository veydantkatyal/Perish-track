-- Insert Sample Data into Supplier Table
INSERT INTO Supplier (Supplier_Name, Contact_Info) VALUES 
('Supplier A', 'supplierA@example.com'),
('Supplier B', 'supplierB@example.com');

-- Insert Sample Data into Goods Table
INSERT INTO Goods (Name, Category, Quantity, Expiration_Date, Cost_Price, Supplier_ID) VALUES
('Milk', 'Dairy', 100, '2024-09-30', 1.50, 1),
('Eggs', 'Dairy', 200, '2024-09-20', 0.20, 1),
('Apples', 'Fruit', 150, '2024-10-10', 0.50, 2);

-- Insert Sales Data
INSERT INTO Sales (Goods_ID, Quantity_Sold, Selling_Price) VALUES
(1, 10, 1.75),
(2, 50, 0.30);

-- Insert Waste Data
INSERT INTO Waste (Goods_ID, Quantity_Wasted) VALUES
(3, 5);
