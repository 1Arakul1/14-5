SELECT s.Name
FROM dbo.Sponsors s  -- Явно указываем схему dbo
WHERE EXISTS (
    SELECT 1
    FROM dbo.Donations d  -- Явно указываем схему dbo
    WHERE d.SponsorId = s.Id AND d.Date BETWEEN '2025-03-01' AND '2025-03-31'
);