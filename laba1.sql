--SELECT amount, 
--ROUND((amount / 100), 2) * 15 as sale,
--amount - ROUND((amount / 100), 2) * 15 as amount_with_sale
--FROM ticket_flights LIMIT 150

--SELECT *,
--ROUND((amount / 100), 2) * 3 as cashback
--FROM ticket_flights WHERE amount > 9000 
--AND fare_conditions != 'Economy'
--ORDER BY amount 

--SELECT fare_conditions,
--SUM(amount) as sum_of_tickets
--FROM ticket_flights 
--GROUP BY fare_conditions

WITH cashbacks AS(
	SELECT *,
	ROUND((amount / 100), 2) * 3 as cashback
	FROM ticket_flights WHERE amount > 9000 
	AND fare_conditions != 'Economy'
	ORDER BY amount 
)

SELECT *,
amount - cashback as spent_on_ticket
FROM cashbacks

