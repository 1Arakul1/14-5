SELECT d.Name
FROM dbo.Departments d  -- Явно указываем схему dbo
WHERE EXISTS (
    SELECT 1
    FROM dbo.Wards w  -- Явно указываем схему dbo
    WHERE w.DepartmentId = d.Id AND w.Places > 5
);