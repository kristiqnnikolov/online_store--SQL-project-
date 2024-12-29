'''Find all transactions in a specific state (e.g., Louisiana, Utah)'''

SELECT * FROM transactions
WHERE shipping_state IN ('Louisiana', 'Utah')
ORDER BY shipping_state;


'''Find transactions for a specific customer (e.g., CustomerID: 200000663)'''

SELECT * FROM transactions
WHERE CustomerID = '200000663';


'''Total sales revenue'''

SELECT SUM(retail_price - (retail_price * loyalty_discount)) AS total_revenue
FROM transactions;


'''TOP 5 states by total revenue'''

SELECT shipping_state,
       SUM(retail_price) AS total_revenue
FROM transactions
GROUP BY shipping_state
ORDER BY total_revenue DESC
LIMIT 5;


'''Average discount through all states and biggest discount'''

SELECT AVG(loyalty_discount) AS average_discount,
       MAX(loyalty_discount) AS biggest_discount
FROM transactions;


'''Count transactions per shipping state'''

SELECT shipping_state, 
       COUNT(*) AS transactions_count
FROM transactions
GROUP BY shipping_state
ORDER BY transactions_count DESC;


'''Find transactions in a specific date range'''

SELECT timestamp
FROM transactions
WHERE timestamp BETWEEN '2016-12-10 18:00:00' AND '2016-12-10 19:00:00'
ORDER BY timestamp ASC;


'''Count transactions per day'''

SELECT DATE(timestamp) AS transaction_date,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_count DESC;


```TOP 3 Most sold items```

SELECT description, 
       item,
       COUNT(*) AS sale_count
FROM transactions
GROUP BY description, item
ORDER BY sale_count DESC
LIMIT 3;


```Full name and customer ID of the TOP 5 customers who spent the most```

SELECT customerid,
       CONCAT(name, ' ', surname) AS full_name,
       SUM(retail_price) AS total_spent
FROM transactions
GROUP BY full_name, customerid
ORDER BY total_spent DESC
LIMIT 5;


```Items with the highest discounts```

SELECT item, loyalty_discount
FROM transactions
ORDER BY loyalty_discount DESC
LIMIT 5;


```All items with the same discount```

SELECT item , description, loyalty_discount
FROM transactions
WHERE loyalty_discount = '0.1';


```Net revenue per item after discount```

SELECT description, 
       retail_price,
	   loyalty_discount,
       (retail_price - (retail_price * loyalty_discount)) AS net_revenue
FROM transactions
GROUP BY description, loyalty_discount, retail_price;


```Total revenue by state```

SELECT shipping_state,
       SUM(retail_price - (retail_price * loyalty_discount)) AS total_revenue
FROM transactions
GROUP BY shipping_state
ORDER BY total_revenue DESC;