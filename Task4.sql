USE BankDb

/*GROUP BY*/

SELECT Social_status, COUNT(Bank_Cards.Id) as Cards_amount 
FROM Clients
	JOIN Accounts ON Clients.Id = Accounts.Client_Id
	JOIN Bank_Cards ON Accounts.Id = Bank_Cards.Account_Id
GROUP BY Social_status

/*Subquery (for each social status)*/

/*For worker*/
SELECT 'worker' as Social_status, COUNT(Id) as Cards_amount
FROM Bank_Cards 
WHERE Account_Id IN
(SELECT Id 
FROM Accounts 
WHERE Client_Id IN 
(SELECT Id 
FROM Clients
WHERE Social_status = 'worker'))

/*For student*/
SELECT 'student' as Social_status, COUNT(Id) as Cards_amount
FROM Bank_Cards 
WHERE Account_Id IN
(SELECT Id 
FROM Accounts 
WHERE Client_Id IN 
(SELECT Id 
FROM Clients
WHERE Social_status = 'student'))

/*For office worker*/
SELECT 'office worker' as Social_status, COUNT(Id) as Cards_amount
FROM Bank_Cards 
WHERE Account_Id IN
(SELECT Id 
FROM Accounts 
WHERE Client_Id IN 
(SELECT Id 
FROM Clients
WHERE Social_status = 'office worker'))