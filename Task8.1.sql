USE BankDb

GO

CREATE OR ALTER TRIGGER CheckSumOnCards 
ON Bank_Cards FOR UPDATE
AS
	DECLARE @account_money_sum DECIMAL(18,2), @cards_money_sum DECIMAL(18,2)
	DECLARE @card_id INT

	SELECT @card_id = Id FROM inserted

	SELECT @cards_money_sum = SUM(Money_sum) 
	FROM Bank_Cards 
	WHERE Id = @card_id

	SELECT @account_money_sum = Money_sum 
	FROM Accounts 
	WHERE Id = (
	SELECT Account_Id 
	FROM Bank_Cards 
	WHERE Id = @card_id)

	IF @account_money_sum < @cards_money_sum
		RAISERROR('You can not change money sum, because account sum < cards, sum',16,1)