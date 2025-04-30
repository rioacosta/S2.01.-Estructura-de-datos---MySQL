use pizzaclub;

-- Para ver las bebidas vendidas por localidad
SELECT 
    v.Name AS Vecinity_Name, 
    COUNT(op.idProduct) AS Total_Beverages_Sold
FROM 
    order_product op
JOIN 
    product p ON op.idProduct = p.idProduct
JOIN 
    `order` o ON op.idOrder = o.idOrder
JOIN 
    store s ON o.StoreID = s.idStore
JOIN 
    vecinity v ON s.Vecinity = v.idVecinity
WHERE 
    p.Type_Product = 'B' 
    AND v.idVecinity = 1 
GROUP BY 
    v.Name;
    
    
-- Para ver los pedidos de un empleado
SELECT 
    e.Name AS Employee_Name, 
    e.LastName AS Employee_LastName,
    COUNT(o.idOrder) AS Total_Orders_Made
FROM 
    employees e
JOIN 
    `order` o ON e.idEmployees = o.Employee
WHERE 
    e.idEmployees = 3 
    GROUP BY 
    e.idEmployees;