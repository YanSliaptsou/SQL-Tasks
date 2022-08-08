USE BankDb;

GO

SELECT Accounts.Id, Accounts.Money_sum, Bank_Cards.Card_number, Bank_Cards.Money_sum 
FROM Bank_Cards
	JOIN Accounts ON Bank_Cards.Account_Id = Accounts.Id
WHERE Account_Id = 1 
	AND Card_number = '5434665564345345'

EXEC TransferMoneyToCard 1,'5434665564345345', 200

SELECT Accounts.Id, Accounts.Money_sum, Bank_Cards.Card_number, Bank_Cards.Money_sum 
FROM Bank_Cards
	JOIN Accounts ON Bank_Cards.Account_Id = Accounts.Id
WHERE Account_Id = 1 
	AND Card_number = '5434665564345345'