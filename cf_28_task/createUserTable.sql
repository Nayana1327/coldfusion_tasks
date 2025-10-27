CREATE TABLE [user] (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(50) CHECK (role IN ('admin', 'editor', 'user'))
);