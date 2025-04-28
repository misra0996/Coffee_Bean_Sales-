# 1 جميع بيانات العملا الذين يعيشون في ايرلندا
SELECT *
FROM customer
where Country = 'ireland'
;


 # عدد الطلبات التي تم تسجيلها في عام 2020
SELECT count(order_date) as count_of_order_date
FROM ORDERS
where order_date Between'2020-01-01'And '2020-12-31'
;


# اسم العميل و عدد طلباته
SELECT Customer_Name, count(Order_ID) as number_of_orders
FROM orders
group by Customer_Name
;


# اجمالي المبيعات لكل دولة
SELECT customer.Country,sum(orders.sales)
FROM customer
 left join orders 
  on customer.Customer_ID = orders.Customer_ID
  group by customer.Country
;


#اعرض كل البيانات للمنتجات التي مبيعاتها اعلى من 19.90
# مشكلة في نوع البيانات و علامة الدولار !!!
SELECT *
FROM orders
where sales >= 19.90
;


# المتوسط العام  لسعر الوحدة
SELECT Product_ID, avg(Unit_Price)
FROM orders
group by Product_ID
;


# 'loyalty card'اسماء العملاء الذين لديهم 
SELECT Customer_Name,
 Loyalty_Card
FROM customer
where Loyalty_Card = 'yes'
;


# اعلى مبيعات تم تحقيقها حسب نوع القهوة
SELECT Coffee_Type,sales
FROM orders
GROUP by coffee_type,sales
order by sales desc
;


# عدد العملاء في كل دولة
SELECT Country, count(Customer_ID)
FROM customer
group by Country
;


# القيمة المباعة لكل منتج
SELECT Product_id, count(Quantity)
FROM orders
group by product_id
order by count(quantity) desc
;

 #ا عرض العملا الذين ليس لديهم ايميل 
 #توجد مشكلة في الداتا تايب!!!
SELECT Customer_Name
FROM customer
WHERE trim(Email) = ' ' or Email is Null  
;


# عدد العملا في كل مدينة
SELECT city, count(Customer_ID) as number_of_customer
FROM customer
group by City
order by count(Customer_ID) desc
;


# اكثر نوع قهوة مبيعا على اجمالي الكمية
SELECT Coffee_Type, sum(Quantity)
FrOM orders
group by Coffee_Type
;


# عدد المنتجات التي حجمها اكبر من 1
SELECT count(Product_ID)as number_of_products
FrOM products
where size >= 1
;


# اعلى نوع قهوة مبيعا
SELECT  Coffee_Type ,sum(quantity) as Top_sales
FrOM orders
group by Coffee_Type
order by sum(quantity) desc
;


# 'M'اعرض تفاصيل المنتجات التي نوع تحميصها 
SELECT *
FROM orders
where Roast_Type = 'M'
;


# مجموع الارباح بناء على نوع القهوة
SELECT  Coffee_Type ,sum(sales) as Top_sales
FrOM orders
group by Coffee_Type
order by sum(quantity) desc
;


