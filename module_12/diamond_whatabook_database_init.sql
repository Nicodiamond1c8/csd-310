DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('123 Main St, Phoenix, AZ 85041');

INSERT INTO book(book_name, author, details)
    VALUES('The Lightning Thief', 'Rick Riordan', 'Book 1 in the Percy Jackson Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Sea of Monsters', 'Rick Riordan', 'Book 2 in the Percy Jackson Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Battle of the Labyrinth', 'Rick Riordan', 'Book 3 in the Percy Jackson Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Titans Curse', 'Rick Riordan', 'Book 4 in the Percy Jackson Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Last Olympian', 'Rick Riordan', 'Book 5 in the Percy Jackson Series');

INSERT INTO book(book_name, author, details)
    VALUES('The Hardy Boys: The Tower Treasure', 'Franklin W. Dixon', 'The first book in the Hardy Boys mystery series.');

INSERT INTO book(book_name, author, details)
    VALUES('The Hardy Boys: The House on the Cliff', 'Franklin W. Dixon', 'The second book in the Hardy Boys mystery series.');

INSERT INTO book(book_name, author, details)
    VALUES('The Hardy Boys: The Secret of the Old Mill', 'Franklin W. Dixon', 'The third book in the Hardy Boys mystery series.');

INSERT INTO book(book_name, author, details)
    VALUES('The Hardy Boys: The Missing Chums', 'Franklin W. Dixon', 'The fourth book in the Hardy Boys mystery series.');

INSERT INTO user(first_name, last_name) 
    VALUES('Nico', 'Diamond');

INSERT INTO user(first_name, last_name)
    VALUES('Amy', 'Roach');

INSERT INTO user(first_name, last_name)
    VALUES('Brian', 'Flint');

INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Nico'), 
        (SELECT book_id FROM book WHERE book_name = 'The Lightning Thief')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Amy'),
        (SELECT book_id FROM book WHERE book_name = 'The Last Olympian')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Brian'),
        (SELECT book_id FROM book WHERE book_name = 'The Hardy Boys: The Tower Treasure')
    );