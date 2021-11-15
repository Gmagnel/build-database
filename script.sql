SELECT * FROM parts limit 10;
ALTER TABLE parts ALTER COLUMN code SET NOT NULL;
ALTER TABLE parts ADD UNIQUE(code);
UPDATE parts
SET description = 'None Available'
WHERE  id=3;
ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;
UPDATE parts

ALTER TABLE reorder_options ALTER COLUMN price_usd SET NOT NULL;
ALTER TABLE reorder_options ALTER COLUMN  SET NOT NULL;
ALTER TABLE reorder_options
ADD CHECK (price_usd> 0 AND quantity > 0);
ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);
ALTER TABLE parts
ADD PRIMARY KEY (id);
ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts (id);
ALTER TABLE locations 
ADD CHECK (qty > 0); 
ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts (id);
ALTER TABLE parts
ADD FOREIGN KEY (id) REFERENCES manufacturers (id);
INSERT INTO manufacturers 
VALUES (11,'Pip-NNC Industrial' );
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (11,'Pip-NNC Industrial');