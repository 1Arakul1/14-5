-- INNER JOIN: Вывести имена докторов и названия обследований, которые они проводят.
SELECT d.Name, d.Surname, e.Name
FROM dbo.Doctors d
INNER JOIN dbo.DoctorsExaminations de ON d.Id = de.DoctorId
INNER JOIN dbo.Examinations e ON de.ExaminationId = e.Id;

-- LEFT JOIN: Вывести названия всех отделений и количество палат в каждом отделении (даже если в отделении нет палат).
SELECT d.Name, COUNT(w.Id) AS NumberOfWards
FROM dbo.Departments d
LEFT JOIN dbo.Wards w ON d.Id = w.DepartmentId
GROUP BY d.Name;

-- RIGHT JOIN: Вывести названия всех спонсоров и количество пожертвований, которые они сделали (даже если спонсор не делал пожертвований).
SELECT s.Name, COUNT(d.Id) AS NumberOfDonations
FROM dbo.Donations d
RIGHT JOIN dbo.Sponsors s ON s.Id = d.SponsorId
GROUP BY s.Name;

-- LEFT JOIN + IS NULL (эмуляция RIGHT EXCEPTION JOIN):  Вывести список спонсоров, которые не сделали ни одного пожертвования.
SELECT s.Name
FROM dbo.Sponsors s
LEFT JOIN dbo.Donations d ON s.Id = d.SponsorId
WHERE d.Id IS NULL;

-- FULL OUTER JOIN (эмулируется, т.к. не все СУБД поддерживают): Вывести все отделения и всех спонсоров, а также информацию о пожертвованиях (если они есть).
SELECT d.Name AS DepartmentName, s.Name AS SponsorName, don.Amount
FROM dbo.Departments d
LEFT JOIN dbo.Donations don ON d.Id = don.DepartmentId
LEFT JOIN dbo.Sponsors s ON don.SponsorId = s.Id
UNION ALL
SELECT d.Name AS DepartmentName, s.Name AS SponsorName, don.Amount
FROM dbo.Departments d
RIGHT JOIN dbo.Donations don ON d.Id = don.DepartmentId
RIGHT JOIN dbo.Sponsors s ON don.SponsorId = s.Id
WHERE d.Id IS NULL;