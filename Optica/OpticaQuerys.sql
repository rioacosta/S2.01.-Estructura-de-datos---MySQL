use optica;
SELECT 
    c.Client_Name AS Client,
    COUNT(s.SaleId) AS Total_Sales
FROM 
    optica.Sales s
JOIN 
    optica.Clients c ON s.Client = c.idClient
WHERE 
    s.Sale_Date BETWEEN '2025-04-15 15:30:00' AND '2025-04-16 15:30:00' 
    AND c.idCLient = 2 
GROUP BY 
    c.Client_Name;
--

SELECT 
    f.Label AS Frame_Model,
    e.Name AS Employee,
    YEAR(s.Sale_Date) AS Year
FROM 
    optica.Sales s
JOIN 
    optica.Employees e ON s.Seller = e.idEmployee
JOIN 
    optica.Frames f ON s.Frame = f.idFrames
WHERE 
    e.idEmployee = 2 
    AND YEAR(s.Sale_Date) = '2025' 
GROUP BY 
    f.Label, e.Name, YEAR(s.Sale_Date);



--

SELECT DISTINCT 
    p.Provider_Name AS Provider
FROM 
    optica.Sales s
JOIN 
    optica.Frames f ON s.Frame = f.idFrames
JOIN 
    optica.Providers p ON f.Provider = p.idProviders;