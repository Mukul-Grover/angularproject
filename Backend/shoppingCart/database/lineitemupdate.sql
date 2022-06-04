ALTER TABLE lines_item DROP FOREIGN KEY lines_item_orders_fk;

ALTER TABLE lines_item
ADD CONSTRAINT lines_item_orders_fk
FOREIGN KEY (idorder) REFERENCES orders (idorder) ON UPDATE CASCADE ON DELETE RESTRICT;
