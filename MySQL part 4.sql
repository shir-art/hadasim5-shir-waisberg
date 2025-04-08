CREATE DATABASE IF NOT EXISTS DB;
USE DB;

CREATE TABLE companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    supplier_name VARCHAR(255),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    product_name VARCHAR(255) NOT NULL,
    price_per_item DECIMAL(10,2) NOT NULL,
    min_quantity INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

INSERT INTO orders (store_owner_id, id, status) VALUES (1, 80, 'בתהליך');
INSERT INTO order_items (order_id, product_id, quantity) VALUES (50, 5, 8);

CREATE TABLE store_owners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    store_owner_id INT,
    supplier_id INT,
    status ENUM('ממתינה', 'בתהליך', 'הושלמה') DEFAULT 'ממתינה',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (store_owner_id) REFERENCES store_owners(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);


CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

SELECT p.product_name, p.price_per_item FROM order_items oi  JOIN products p ON oi.product_id = p.id  WHERE oi.order_id = 11;

SELECT p.product_name, p.price_per_item, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 11;

SELECT p.product_name, p.price_per_item 
FROM order_items oi 
JOIN products p ON oi.product_id = p.id 
WHERE oi.order_id = 11;


SELECT * FROM orders;
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(11, 1, 20),
(11, 2, 10),
(12, 3, 15),
(12, 4, 12),
(13, 5, 30),
(14, 6, 7),
(15, 7, 14),
(16, 8, 6),
(12, 9, 10),
(12, 10, 4),
(25, 11, 25),
(20, 12, 16);


SELECT p.product_name, p.price_per_item FROM order_items oi  JOIN products p ON oi.product_id = p.id  WHERE oi.order_id = 1;

SELECT * FROM suppliers;

INSERT INTO companies (company_name) VALUES 
('איכות טרייה'), ('סחורה ובזול'), ('משק ברק'), ('יבואני הטעם'), ('פירות פלוס'),
('משק גבעות'), ('טעמים מהשדה'), ('ספקות'), ('אספקה מהירה'), ('חקלאות מובחרת');

INSERT INTO suppliers (company_name, phone, supplier_name, company_id) VALUES 
('איכות טרייה', '0501234567', 'אורית כהן', 1),
('סחורה ובזול', '0527654321', 'יניב לוי', 2),
('משק ברק', '0539876543', 'ברק ניסים', 3),
('יבואני הטעם', '0541239876', 'שירה דן', 4),
('פירות פלוס', '0554567890', 'תמר אזולאי', 5),
('משק גבעות', '0562345678', 'גיל גבע', 6),
('טעמים מהשדה', '0578765432', 'אלעד שמש', 7),
('ספקות', '0581112233', 'נועה מזרחי', 8),
('אספקה מהירה', '0594445566', 'טל סולומון', 9),
('חקלאות מובחרת', '0509988776', 'איילת שחר', 10),
('ירקות אורגניים', '0501122334', 'רונית לוי', 1),
('משק איתן', '0512233445', 'איתן רז', 3),
('שפע טעמים', '0523344556', 'דני כהן', 3),
('הספק המרכזי', '0534455667', 'שרה בר', 5),
('אספקה שופ', '0545566778', 'עידו גל', 2);

SELECT p.product_name, p.price_per_item 
FROM products p
JOIN suppliers s ON p.supplier_id = s.id
WHERE s.supplier_name = 'יניב לוי';  -- החלף בשם הספק
SELECT p.product_name, p.price_per_item FROM products p   JOIN suppliers s ON p.supplier_id = s.id WHERE s.supplier_name = 'שיר';

INSERT INTO products (supplier_id, product_name, price_per_item, min_quantity) VALUES 
(1, 'עגבניות', 3.50, 10),
(1, 'מלפפונים', 4.00, 5),
(2, 'גזר', 2.80, 8),
(2, 'תפוח אדמה', 3.00, 10),
(3, 'בצל יבש', 1.50, 15),
(4, 'קישוא', 3.70, 7),
(5, 'חלב 3%', 5.20, 12),
(6, 'גבינה צהובה', 7.80, 5),
(7, 'יוגורט טבעי', 4.90, 6),
(8, 'עוף קפוא', 21.00, 3),
(9, 'אורז בסמטי', 6.40, 10),
(10, 'סוכר', 3.30, 8);

INSERT INTO store_owners (username, password) VALUES 
('david123', 'pass123');


INSERT INTO orders (store_owner_id, supplier_id, status) VALUES 
(1, 1, 'ממתינה'),
(1, 2, 'בתהליך'),
(1, 3, 'הושלמה'),
(1, 4, 'ממתינה'),
(1, 5, 'בתהליך'),
(1, 6, 'ממתינה'),
(1, 7, 'הושלמה'),
(1, 8, 'בתהליך'),
(1, 9, 'ממתינה'),
(1, 10, 'הושלמה');


INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 1, 20),
(1, 2, 10),
(2, 3, 15),
(2, 4, 12),
(3, 5, 30),
(4, 6, 7),
(5, 7, 14),
(6, 8, 6),
(7, 9, 10),
(8, 10, 4),
(9, 11, 25),
(10, 12, 16);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ahruhxcrd!1463';
FLUSH PRIVILEGES;
