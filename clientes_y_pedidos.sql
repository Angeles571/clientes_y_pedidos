
INSERT INTO clientes (nombre, direccion, telefono) 
VALUES	('Ana Torres', 'Av. Providencia 123', '912345678'),
		('Luis Rojas', 'Calle Los Robles 45', '987654321'),
		('Marcela Díaz', 'Camino Real 789', '956789012'),
		('Carlos Pérez', 'Pasaje Las Flores 33', '934567890'),
		('Sofía Muñoz', 'Av. Alemania 456', '945612378');

INSERT INTO pedidos (fecha, total, clientes_id_clientes) 
VALUES('2025-10-01', 15000.00, 1),
	  ('2025-10-03', '22000.00', '1'),
	  ('2025-10-02', '18000.00', '2'),
	  ('2025-10-05', '25000.00', '2'),
	  ('2025-10-04', '12000.00', '3'),
	  ('2025-10-06', '30000.00', '3'),
	  ('2025-10-01', '17000.00', '4'),
	  ('2025-10-07', '21000.00', '4'),
	  ('2025-10-03', '19000.00', '5'),
	  ('2025-10-08', '23000.00', '5');

SELECT 
    c.id_clientes AS cliente_id, 
    c.nombre, 
    p.id_pedidos AS pedido_id, 
    p.fecha, 
    p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id_clientes = p.clientes_id_clientes;

SELECT * 
FROM pedidos
WHERE clientes_id_clientes = 2;

SELECT 
    c.id_clientes AS cliente_id, 
    c.nombre, 
    SUM(p.total) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id_clientes = p.clientes_id_clientes
GROUP BY c.id_clientes, c.nombre;

DELETE FROM clientes
WHERE id_clientes= 3;

SELECT 
    c.id_clientes AS cliente_id, 
    c.nombre, 
    COUNT(p.id_pedidos) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id_clientes = p.clientes_id_clientes
GROUP BY c.id_clientes, c.nombre
ORDER BY cantidad_pedidos DESC
LIMIT 3;
