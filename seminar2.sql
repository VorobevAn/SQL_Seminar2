
-- 1. создайте табличку “sales”. Заполните ее данными

drop table sales;
CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    bucket INT NOT NULL
); 

INSERT INTO sales(order_date, bucket) VALUES
('2023-05-23', 280),
('2023-05-22', 50),
('2023-05-21', 150),
('2023-05-23', 200),
('2023-05-23', 350);

SELECT * FROM sales;

-- Сгруппируйте 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT*,
CASE
	WHEN bucket > 300 THEN 'Большой заказ'
	WHEN bucket > 100 THEN 'Средний заказ'
    WHEN bucket <= 300 AND bucket >= 100 THEN 'Маленький заказ'
END AS orders
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями.

DROP TABLE orders;

CREATE TABLE orders
(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(30) NOT NULL,
    amount DECIMAL(8,2) DEFAULT(0.00),
    order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (employeeid, amount, order_status) VALUES 
('E03', 15.00, 'OPEN'),
('E01', 25.50, 'OPEN'),
('E05', 100.70, 'CLOSED'),
('E02', 22.18, 'OPEN'),
('E04', 9.50, 'CANCELLED'),
('E04', 99.99, 'OPEN');

SELECT * FROM orders;

-- Покажите “полный” статус заказа, используя оператор CASE

SELECT order_id, order_status, 
CASE 
	WHEN order_status = 'OPEN' THEN 'Order is in open state.'
	WHEN order_status = 'CLOSED' THEN 'Order is closed.'
	WHEN order_status = 'CANCELLED' THEN 'Order is cancelled.'
    ELSE 'Status unknown'
    END AS order_summary
FROM orders;

