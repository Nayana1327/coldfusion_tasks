ALTER TABLE contacts ADD user_id INT NULL;
UPDATE contacts SET user_id = 1;
ALTER TABLE contacts ALTER COLUMN user_id INT NOT NULL;
ALTER TABLE contacts
ADD CONSTRAINT FK_Contacts_User
FOREIGN KEY (user_id) REFERENCES address_book(id);

