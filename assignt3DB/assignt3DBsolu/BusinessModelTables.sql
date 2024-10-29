-- Create Store table
CREATE TABLE Store (
    IDstore INT PRIMARY KEY,
    storeName VARCHAR(255) NOT NULL,
    streetAddress VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip VARCHAR(10),
    storeNumber INT
);

-- Create Product table
CREATE TABLE Product (
    IDproduct INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    IDbrand INT,
    ManufacturerPartNumber VARCHAR(255),
    SKU VARCHAR(255),
    cost DECIMAL(10, 2),
    price DECIMAL(10, 2),
    ICategory INT,
    FOREIGN KEY (IDbrand) REFERENCES Brand(IDBrand),
    FOREIGN KEY (ICategory) REFERENCES Category(IDCategory)
);

-- Create Customer table
CREATE TABLE Customer (
    IDcustomer INT PRIMARY KEY,
    Firstname VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL
);

-- Create CustomerPhone table
CREATE TABLE CustomerPhone (
    IDPhoneType INT,
    IDCustomer INT,
    PRIMARY KEY (IDPhoneType, IDCustomer),
    FOREIGN KEY (IDPhoneType) REFERENCES RefPhone(IDPhoneType),
    FOREIGN KEY (IDCustomer) REFERENCES Customer(IDcustomer)
);

-- Create RefPhone table
CREATE TABLE RefPhone (
    IDPhoneType INT PRIMARY KEY,
    PhoneType VARCHAR(255) NOT NULL
);

-- Create Brand table
CREATE TABLE Brand (
    IDBrand INT PRIMARY KEY,
    BrandName VARCHAR(255) NOT NULL
);

-- Create Category table
CREATE TABLE Category (
    IDCategory INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

-- Create SubCategory table
CREATE TABLE SubCategory (
    IdSubcat INT PRIMARY KEY,
    IDCategory INT,
    SubCategoryName VARCHAR(255) NOT NULL,
    FOREIGN KEY (IDCategory) REFERENCES Category(IDCategory)
);

-- Create Stock table
CREATE TABLE Stock (
    IDstore INT,
    IDproduct INT,
    itemscount INT,
    PRIMARY KEY (IDstore, IDproduct),
    FOREIGN KEY (IDstore) REFERENCES Store(IDstore),
    FOREIGN KEY (IDproduct) REFERENCES Product(IDproduct)
);

--Create Transactions table
CREATE TABLE Transactions (
  idTransaction INT PRIMARY KEY,
  idStore INT NOT NULL,
  idProduct INT NOT NULL,
  IDcustomer INT,
  date DATE NOT NULL,
  quantity INT,
  unit_price DECIMAL(10,2),
  total_price DECIMAL(10,2) AS (quantity * unit_price),
  FOREIGN KEY (idStore) REFERENCES Store(IDstore),
  FOREIGN KEY (idProduct) REFERENCES Product(IDproduct),
  FOREIGN KEY (IDcustomer) REFERENCES Customer(IDcustomer)
);


