CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought;

#mengeluarkan item paling banyak dibeli
SELECT item
FROM item_bought
GROUP BY item
ORDER BY COUNT(*) DESC
LIMIT 1;

#mengeluarkan item paling sedikit dibeli
SELECT item
FROM item_bought
GROUP BY item
ORDER BY COUNT(*) ASC
LIMIT 1;

#mengeluarkan item kecuali yang paling sedikit dibeli atau paling banyak dibeli
SELECT item 
FROM item_bought 
GROUP BY item 
Having COUNT(*) NOT IN (
  SELECT COUNT(*) 
  FROM item_bought 
  GROUP BY item 
  ORDER BY COUNT(*) DESC 
  LIMIT 1) 
AND COUNT(*) NOt IN (
  SELECT COUNT(*) 
  FROM item_bought 
  GROUP BY item 
  ORDER BY COUNT(*) ASC 
  LIMIT 1);