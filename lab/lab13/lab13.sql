.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price 
    FROM products
      GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) 
    FROM inventory 
      GROUP BY item;

-- helper table:
CREATE TABLE best_deals AS
  SELECT name AS best_deal, min(MSRP * 1.0 / rating) 
    FROM products
      GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT a.best_deal, b.store 
    FROM best_deals AS a, lowest_prices AS b
      WHERE a.best_deal = b.item;

CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) 
    FROM shopping_list AS a, stores AS b 
      WHERE a.store = b.store;

