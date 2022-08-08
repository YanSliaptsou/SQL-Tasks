USE BankDb

GO

CREATE OR ALTER TRIGGER CheckSumOnAccounts 
ON Accounts FOR UPDATE
AS
	DECLARE @account_money_sum DECIMAL(18,2), @cards_money_sum DECIMAL(18,2)
	DECLARE @account_id INT

	SELECT @account_id = Id FROM inserted

	SELECT @cards_money_sum = SUM(Money_sum) 
	FROM Bank_Cards 
	WHERE Account_Id = @account_id

	SELECT @account_money_sum = Money_sum 
	FROM Accounts 
	WHERE Id = @account_id

	IF @account_money_sum < @cards_money_sum
		RAISERROR('You can not change money sum, because account sum < cards sum',16,1)