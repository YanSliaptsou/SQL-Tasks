USE BankDb

GO

CREATE OR ALTER PROCEDURE TransferMoneyToCard
	@account_id INT,
	@card_number NVARCHAR(30),
	@money_sum DECIMAL(18,2)
	AS
	BEGIN TRAN
		DECLARE @card_id INT

		SELECT @card_id = Id 
		FROM Bank_Cards 
		WHERE Account_Id = @account_id 
				AND Card_number = @card_number

		IF @card_id IS NULL
		BEGIN
			PRINT 'Such card number and account are not assigned to each other'
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			DECLARE @account_money_sum DECIMAL(18,2), @cards_money_sum DECIMAL(18,2)
			SELECT @account_money_sum = Money_sum 
			FROM Accounts 
			WHERE Id = @account_id

			SELECT @cards_money_sum = SUM(Money_sum) 
			FROM Bank_Cards 
			WHERE Account_Id = @account_id

			IF (@account_money_sum - @cards_money_sum - @money_sum) < 0
			BEGIN
				PRINT 'Not enough money to make a transfer to a card.'
				ROLLBACK TRANSACTION
			END
			ELSE
			BEGIN

				UPDATE Bank_Cards 
				SET Money_sum = Money_sum + @money_sum 
				WHERE Account_Id = @account_id 
						AND Card_number = @card_number

				COMMIT TRANSACTION
			END
		END
