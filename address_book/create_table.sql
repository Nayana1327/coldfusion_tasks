CREATE TABLE address_book (
    id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100),
    email NVARCHAR(150) UNIQUE,
    username NVARCHAR(100) UNIQUE,
    password_hash NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE()
);
