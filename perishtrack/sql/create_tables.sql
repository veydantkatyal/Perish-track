-- Supplier Table
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Info VARCHAR(255) UNIQUE NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Goods Table
CREATE TABLE Goods (
    Goods_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Quantity INT CHECK (Quantity >= 0),
    Expiration_Date DATE NOT NULL,
    Cost_Price DECIMAL(10, 2) CHECK (Cost_Price > 0),
    Supplier_ID INT NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Indexing for Performance
CREATE INDEX idx_goods_expiration ON Goods (Expiration_Date);
CREATE INDEX idx_goods_quantity ON Goods (Quantity);

-- Sales Table
CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    Goods_ID INT NOT NULL,
    Quantity_Sold INT CHECK (Quantity_Sold > 0),
    Sale_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Selling_Price DECIMAL(10, 2) CHECK (Selling_Price > 0),
    FOREIGN KEY (Goods_ID) REFERENCES Goods(Goods_ID)
);

-- Waste Table
CREATE TABLE Waste (
    Waste_ID INT PRIMARY KEY AUTO_INCREMENT,
    Goods_ID INT NOT NULL,
    Quantity_Wasted INT CHECK (Quantity_Wasted > 0),
    Waste_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Goods_ID) REFERENCES Goods(Goods_ID)
);

-- Error Log Table
CREATE TABLE Error_Log (
    Error_ID INT PRIMARY KEY AUTO_INCREMENT,
    ErrorMessage TEXT NOT NULL,
    ErrorDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
