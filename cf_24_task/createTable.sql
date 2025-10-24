CREATE TABLE subscribers (
    id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(100),
    email VARCHAR(150) UNIQUE
);