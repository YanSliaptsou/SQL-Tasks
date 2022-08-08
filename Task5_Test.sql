USE BankDb

SELECT Client_Name, Client_Surname, Social_status, Money_sum 
FROM Clients
	JOIN Accounts ON Clients.Id = Accounts.Client_Id

EXEC AddMoneyToAccountsBySocStatus 'worker'

SELECT Client_Name, Client_Surname, Social_status, Money_sum 
FROM Clients
	JOIN Accounts ON Clients.Id = Accounts.Client_Id