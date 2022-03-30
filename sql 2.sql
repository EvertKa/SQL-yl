SELECT title, count(*) FROM d110072_raamatud.orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR (order_date) = 2017 GROUP BY books.id ORDER BY count(*) desc LIMIT 10;

SELECT * FROM d110072_raamatud.books WHERE price > ALL(SELECT avg(price) FROM books);

SELECT sum(stock_saldo*price) FROM d110072_raamatud.books;

SELECT  min(price) as koige_odavam, max(price) as koige_kallim, avg(price) as keskmine_hind from d110072_raamatud.books;

SELECT max(price) as koige_kallim FROM d110072_raamatud.books WHERE type = "used";

SELECT CASE when type = "new" then "uus"  WHEN type = "used" then "kasutatud" WHEN type = "ebook" then "eraamat" END as Tüüp, round(avg(price),2) as Keskmine_hind, COUNT(*) as HULK FROM d110072_raamatud.books GROUP BY type;

SELECT * FROM d110072_raamatud.books WHERE type = "used" AND price > (SELECT avg(price) FROM d110072_raamatud.books WHERE type = "new" );

SELECT * FROM d110072_raamatud.books WHERE price > (SELECT avg(price) FROM d110072_raamatud.authors LEFT JOIN book_authors ON book_authors.author_id = authors.id LEFT JOIN books ON books.id  = book_authors.book_id LEFT JOIN orders ON orders.book_id = books.id GROUP BY authors.id ORDER BY count(*) desc LIMIT 1);

SELECT * FROM d110072_raamatud.books WHERE release_date % 2 = 0;

SELECT count(*), language FROM d110072_raamatud.books GROUP BY language ORDER BY count(*) desc LIMIT 3;
INSERT INTO clients ( username, first_name, last_name, email, address)
Values ("epsu", "Evert", "Kärp", "evert.karp@ametikool.ee", "Tehnika 1-64");

UPDATE books SET language = "Eesti" WHERE id = 1;

DELETE FROM orders WHERE id = 2300;

INSERT INTO clients ( username, first_name, last_name, email, address)
values
("jams", "Mark", "Neer", "markk@gmail.com", "Noorsoo"),
("ramos", "Valdis", "Joss", "valdisj@gmail.com", "paldisk"),
("juur", "Raido", "Libe", "liberaido@gmail.com", "pikk"),
("naos", "Toomas", "Tuurik", "tuurikt@gmail.com", "kevade"),
("pensora", "Roomet", "Rool", "roometr@gmail.com", "smuuli");

INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)
VALUES
("5423 Juhan Smuuli", "2017-9-11", "sent",
(SELECT id FROM d110072_raamatud.clients WHERE username = "mcage1o"),
(SELECT id FROM d110072_raamatud.books WHERE title = "Vendetta"));

UPDATE d110072_raamatud.books
set price = price * 1.05, pages = pages - 5  where id > 0;

DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL);


