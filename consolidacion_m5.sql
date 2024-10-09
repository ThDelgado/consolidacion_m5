INSERT INTO customer (store_id,first_name,last_name, email, address_id, activebool, create_date, active)
VALUES (1, 'Julio', 'Torres', 'j.torres@loqsea.com', 1, true, CURRENT_DATE,1);

SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;.
SELECT * FROM store;
SELECT * FROM staff;



INSERT INTO address (address, address2, district, city_id, postal_code, phone ) VALUES
('Bandera 1245','', 'Santiago', 601, 9330000,94578781236), -- address staff
('Chiloe 3564','','Chiloe',602, 9440000,9457800245);

INSERT INTO city (city, country_id) VALUES
('Santiago',22),
('Chiloe',22);


   --address 
INSERT INTO address (address, address2, district, city_id, postal_code, phone ) VALUES
('Bandera 1246','', 'Santiago', 601, 9330000,224567895);



  --Insertar un  manager staff
INSERT INTO staff (first_name,last_name, address_id, email, store_id, active, username, password, picture) VALUES
('Juan','Perez', 604, 'jperez@loqsea@gmail.com', 1, true, 'jperez', 'Jp123$',null);

-- modificar staff
UPDATE staff SET email = 'juanperez@loqsea.com'
WHERE staff_id = 3;

-- ELIMINAR UN STAFF

UPDATE staff SET active= false
WHERE staff_id= 3;








--insert customer
INSERT INTO customer (store_id,first_name,last_name, email, address_id, activebool, create_date, active) VALUES
(3, 'Marco', 'Solis', 'm.solis@loqsea.com',1,true,CURRENT_DATE, 1);
SELECT* FROM customer;   --601
 --modificar un customer
UPDATE customer SET email='marco.solis@loqsea.com',last_update= CURRENT_TIMESTAMP
WHERE customer_id=601;

-- eliminar un customer

UPDATE customer SET active= 0
WHERE customer_id=601;

--INSERTAR UN ACTOR
SELECT* FROM actor;
INSERT INTO actor (first_name,last_name) VALUES
('Marco Antorio','Bandera');

-- MODIFICAR UN ACTOR
UPDATE actor SET last_name = 'Solis'
WHERE actor_id = 201; 


-- ELIMINAR UN ACTOR

DELETE FROM actor WHERE actor_id = 201;

--Listar todas las "rental" con los datos del "customer" dado un año y mes
SELECT * FROM rental;

SELECT r.rental_id, r.rental_date, c.first_name, c.last_name 
FROM rental r 
JOIN customer c ON r.customer_id = c.customer_id 
WHERE c.first_name ILIKE 'Ricardo'
AND EXTRACT(YEAR FROM r.rental_date) = 2005 
AND EXTRACT(MONTH FROM r.rental_date) = 5;


-- Listar Número, Fecha (payment_date) y Total (amount) de todas las "payment"


SELECT payment_id, payment_date, amount 
FROM payment; 



--Listar todas las "film" del año 2006 que contengan un (rental_rate) mayor a 4.0

SELECT * FROM public.film
WHERE release_year= 2006 AND rental_rate > 4.0;

--- crear un diccionario


	
SELECT 
    t1.TABLE_NAME AS "Tabla",
    t1.COLUMN_NAME AS "Columna",
    CASE 
        WHEN t1.IS_NULLABLE = 'YES' THEN 'Sí' 
        ELSE 'No' 
    END AS "Puede ser Nula",
    t1.DATA_TYPE AS "Tipo de Dato"
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME ASC
