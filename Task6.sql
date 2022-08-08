USE BankDb;

SELECT Client_name, Client_Surname, Accounts.Id, Accounts.Money_sum - SUM(Bank_Cards.Money_sum) as Money_left 
FROM Accounts
	JOIN Bank_Cards ON Accounts.Id = Bank_Cards.Account_Id
	JOIN Clients ON Clients.Id = Accounts.Client_Id
GROUP BY Client_Name, Client_Surname, Accounts.Id, Accounts.Money_sum
HAVING Accounts.Money_sum - SUM(Bank_Cards.Money_sum) > 0