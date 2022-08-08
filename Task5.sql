USE BankDb;

GO

CREATE OR ALTER PROCEDURE AddMoneyToAccountsBySocStatus
	@soc_status_name NVARCHAR(20)
	AS
	DECLARE @soc NVARCHAR(20)
	SELECT @soc = Social_status 
	FROM Clients 
	WHERE Social_status = @soc_status_name
	IF @soc IS NULL
		BEGIN
		PRINT 'Such social status does not exists'
		END
	ELSE
		UPDATE Accounts 
		SET Money_sum = Money_sum + 10
		WHERE Client_Id IN 
		(SELECT Id 
		FROM Clients 
		WHERE Social_status = @soc_status_name)