SELECT * FROM books WHERE release_date >=2010 AND type = "new" ORDER BY title;
SELECT * FROM books WHERE release_date <=1970 AND type = "used" AND price <=20 ORDER BY title, price, type;
SELECT count(*) as "Tellimuste arv" , year(order_date) as "aasta" FROM orders where order_date group by year(order_date);
SELECT ROUND(SUM(price),2) as "ÜMARDATUD" FROM orders LEFT JOIN books ON orders.book_id = books.id GROUP BY YEAR(order_date);
SELECT count(*), SUM(books.price) FROM orders LEFT JOIN books ON orders.book_id = books.id WHERE YEAR(order_date) = 2017;
SELECT  count(*), SUM(books.price), clients.username FROM clients LEFT JOIN orders ON orders.client_id = clients.id LEFT JOIN books ON orders.book_id = books.id WHERE year(orders.order_date) = 2017 GROUP BY clients.id ORDER BY SUM(books.price) DESC;
