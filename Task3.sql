USE BankDb;

SELECT Accounts.Id, Accounts.Money_sum - SUM(Bank_Cards.Money_sum) as Sum_diff 
FROM Accounts
	JOIN Bank_Cards ON Accounts.Id = Bank_Cards.Account_Id
GROUP BY Accounts.Id, Accounts.Money_sum
HAVING Accounts.Money_sum <> SUM(Bank_Cards.Money_sum)