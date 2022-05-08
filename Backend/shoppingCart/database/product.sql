INSERT INTO `categories` (`idcategory`, `description`) VALUES (1, '1 Segment Best 108MP Quad Camera Setup with exciting features like Single Take, Object Eraser, \r\nand Photo Remaster  Super AMOLED Plus Display, FHD resolution, pixels with 120Hz Refresh Rate');

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (1,'Samsung Galaxy M53 5G (Deep Ocean Blue, 8GB, 128GB Storage)',28499,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (2,'Samsung Galaxy M33 5G (Mystique Green, 8GB, 128GB Storage)',19499,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (3,'realme narzo 50i (Mint Green, 4GB RAM+64GB Storage)',8999,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (4,'OnePlus Nord CE 2 Lite 5G (Blue Tide, 8GB RAM, 128GB Storage)',21999,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (5,'Redmi 9A Sport (Coral Green, 2GB RAM, 32GB Storage)',6999,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (6,'Samsung Galaxy S20 FE 5G (Cloud Navy, 8GB RAM, 128GB Storage)',34990,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (7,'Vivo X60 (Shimmer Blue, 8GB RAM, 128GB Storage) Without Offers',35090,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (8,'realme 8s 5G (Universe Blue, 8GB RAM, 128GB Storage), Medium',18851,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (9,'realme narzo 50i (Carbon Black, 4GB RAM+64GB Storage)',8999,1);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (10,'OPPO A31 (Mystery Black, 6GB RAM, 128GB Storage)',12989,1);


INSERT INTO `categories` (`idcategory`, `description`) VALUES (2, 'Featuring newly developed diaphragm that is 80% thinner than the he400 series resulting in a wider frequency response, faster and more detailed');

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (11,'HiFiMAN Sundara Wired Over The Ear Headphone Without Mic (Black)',24999,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (12,'ANT AUDIO W56 Wired in Ear Earphone with Mic (Black)',618,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (13,'boAt Rockerz 510 Over Ear Bluetooth Headphones with Upto 20 Hours Playback',1199,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (14,'pTron Pride Lite HBE (High Bass Earphones) in-Ear Wired Headphones with in-line Mic',149,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (15,'boAt Rockerz 400 Bluetooth On Ear Headphones with upto 8 Hours',1299,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (16,'JBL Tune 500BT by Harman Powerful Bass Wireless On-Ear Headphones',2899,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (17,'Skullcandy Crusher Wireless Bluetooth Over The Ear Headphone',8095,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (18,'boAt Bassheads 100 in Ear Wired Earphones(Mint Green)',349,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (19,'boAt Rockerz 450 On Ear Bluetooth Headphones',899,2);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (20,'boAt Rockerz 450 On Ear Bluetooth Headphones',899,2);

INSERT INTO `categories` (`idcategory`, `description`) VALUES (3, 'Processor:AMD Ryzen 5 5625U (up to 4.3 GHz max boost clock(2i),16 MB L3 cache, 6 cores, 12 threads)|Memory & Storage: 8 GB DDR4-3200 SDRAM (2 x 4 GB), Upto 16 GB DDR4-3200 SDRAM (2 x 8 GB)| Storage: 512 GB PCIe NVMe M.2 SSD');

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (21,'HP Pavilion 14, Ryzen 5-5625U, 8GB RAM/512GB SSD 14 inch(35.6 cm) Laptop',53990,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (22,'HP 15s- Ryzen 5- 8GB RAM/512GB SSD 15.6 Inches FHD, Micro-Edge, Anti-Glare Display',47490,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (23,'Acer Aspire Thin and Light Laptop, 15.6" FHD Display, Intel Celeron Dual-Core N4500 Processor',62074,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (24,'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020',26990,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (25,'Lenovo ThinkPad E14 Intel Core i3',42750,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (26,'ASUS ZenBook 14 (2020) Intel Core i5',73499,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (27,'Acer Acer One Intel Pentium Gold',30490,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (28,'HP 15s-11th Gen Intel Core i3 15.6 Inches Laptop',42899,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (29,'HP 15- AMD Ryzen 3-3250 15.6 inch(39.6 cm) FHD,Thin & Light Laptop',39990,3);

INSERT INTO products (idproduct,description, price, idcategory)
VALUES (30,'ASUS VivoBook 14 (2021), Intel Core i3-1115G4 11th Gen',33990,3);

ALTER TABLE categories
  ADD pname varchar(40) NOT NULL
    AFTER idcategory;
    
UPDATE categories SET pname='Mobile' WHERE idcategory=1

UPDATE categories SET pname='Headphone' WHERE idcategory=2

UPDATE categories SET pname='Laptop' WHERE idcategory=3