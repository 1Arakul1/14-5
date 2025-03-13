SELECT DISTINCT d.Name
FROM dbo.Departments d  -- Явно указываем схему dbo
JOIN dbo.Donations don ON d.Id = don.DepartmentId
WHERE don.Amount > SOME (
    SELECT Amount
    FROM dbo.Donations don2  -- Явно указываем схему dbo
    JOIN dbo.Departments dep ON don2.DepartmentId = dep.Id
    WHERE dep.Name = 'Хирургическое отделение'
);