CREATE TABLE application_details (
    id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_id VARCHAR(50) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    relocate VARCHAR(10) NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    portfolio VARCHAR(50) NULL,
    salary VARCHAR(50) NULL,
    resume VARCHAR(50) NULL
);
  

        