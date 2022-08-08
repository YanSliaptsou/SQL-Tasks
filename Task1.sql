USE BankDb;

SELECT Bank_Name 
FROM Banks 
	JOIN Departments ON Banks.Id = Departments.Bank_Id
WHERE City_Id = 
	(SELECT Id 
	FROM Cities 
	WHERE City_Name = 'Vitebsk')