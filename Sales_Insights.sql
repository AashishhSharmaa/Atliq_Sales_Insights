-- ------------------- Key Performance Indicators ---------------------------------------------

-- ---- Show all customer records -------------------------------------------------------------

SELECT * 
FROM sales.customers;

-- ---- Show total number of customers ---------------------------------------------------------

SELECT count(*) 
FROM sales.customers;

-- ---- Show transactions for Chennai market (market code for chennai is Mark001) --------------

SELECT * 
FROM sales.transactions 
WHERE market_code='Mark001';

-- ---- Show distrinct product codes that were sold in chennai ---------------------------------

SELECT distinct product_code 
FROM sales.transactions 
WHERE market_code='Mark001';

-- ---- Show transactions where currency is US dollars ------------------------------------------

SELECT * 
FROM sales.transactions 
WHERE currency="USD";

-- ---- Show transactions in 2020 join by date table --------------------------------------------

SELECT sales.transactions.*, date.* 
FROM sales.transactions 
INNER JOIN sales.date 
ON sales.transactions.order_date=sales.date.date 
where sales.date.year=2020;

-- ---- Show total revenue in year 2020 ----------------------------------------------------------

SELECT SUM(sales.transactions.sales_amount) 
FROM sales.transactions INNER JOIN sales.date 
ON sales.transactions.order_date=sales.date.date 
WHERE sales.date.year=2020 AND sales.transactions.currency="INR" or sales.transactions.currency="USD";

-- ---- Show total revenue in year 2020, January Month --------------------------------------------

SELECT SUM(sales.transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN sales.date 
ON sales.transactions.order_date=sales.date.date 
WHERE sales.date.year=2020 AND sales.date.month_name="January" and (sales.transactions.currency="INR" or sales.transactions.currency="USD");

-- ---- Show total revenue in year 2020 in Chennai -------------------------------------------------

SELECT SUM(sales.transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN sales.date 
ON sales.transactions.order_date=sales.date.date 
WHERE sales.date.year=2020 and sales.transactions.market_code="Mark001";

