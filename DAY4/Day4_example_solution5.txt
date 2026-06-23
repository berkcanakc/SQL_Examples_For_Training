SELECT
SUBSTRING(email from 1 for 1) || '***' || 
SUBSTRING(email from POSITION('.' IN email)for 2) || '***' || 
SUBSTRING(email from POSITION('@' IN email))
FROM customer;

SELECT
'***' || SUBSTRING(email from POSITION('.' IN email)-1 for 3) || '***' || 
SUBSTRING(email from POSITION('@' IN email))
FROM customer
