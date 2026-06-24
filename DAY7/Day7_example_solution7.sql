SELECT *,(SELECT MAX(amount) FROM payment) - amount AS difference
FROM payment