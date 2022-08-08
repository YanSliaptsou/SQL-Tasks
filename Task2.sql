USE BankDb;

SELECT Client_Name, Client_Surname, Card_number, Bank_cards.Money_sum, Bank_Name
FROM Clients
	JOIN Accounts ON Clients.Id = Accounts.Client_Id
	JOIN Bank_Cards ON Accounts.Id = Bank_Cards.Account_Id
	JOIN Departments ON Departments.Id = Clients.Department_Id
	JOIN Banks ON Banks.Id = Departments.Bank_Id