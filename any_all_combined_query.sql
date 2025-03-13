SELECT Name, Surname
FROM dbo.Doctors
WHERE Salary > ANY (
    SELECT Salary
    FROM dbo.DoctorsExaminations de
    JOIN dbo.Examinations e ON de.ExaminationId = e.Id
    JOIN dbo.Wards w ON de.WardId = w.Id
    JOIN dbo.Departments d ON w.DepartmentId = d.Id
    JOIN dbo.Doctors doc ON de.DoctorId = doc.Id
    WHERE d.Name = 'Хирургическое отделение'
);