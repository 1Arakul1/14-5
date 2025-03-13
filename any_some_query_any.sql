SELECT Name, Surname
FROM dbo.Doctors  -- Явно указываем схему dbo
WHERE Salary > ANY (
    SELECT Salary
    FROM dbo.Doctors  -- Явно указываем схему dbo
    WHERE Surname = 'Иванов'
);