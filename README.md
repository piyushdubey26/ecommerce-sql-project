# 🛒 E-commerce Order Management SQL Project

This project simulates the backend of an E-commerce platform like **Amazon** or **Flipkart** using SQL.  
It includes schema definitions, views, sample queries, and a trigger to manage orders, products, and payments efficiently.

---

## 📌 Features

- ✅ **Relational DB schema** for users, products, orders, and payments  
- ✅ **Views** for summarized order insights  
- ✅ **Trigger** to update stock automatically after successful payment  
- ✅ **Sample Data** to test queries  
- ✅ **Real-world queries** like top-selling products, user order history, etc.

---

## 🗃️ Database Schema

| Table        | Columns                                  |
|--------------|-------------------------------------------|
| `Users`      | `user_id`, `name`, `address`             |
| `Products`   | `product_id`, `name`, `price`, `stock`   |
| `Orders`     | `order_id`, `user_id`, `order_date`      |
| `Order_Items`| `order_id`, `product_id`, `quantity`     |
| `Payments`   | `payment_id`, `order_id`, `status`       |

---

## 📁 File Structure

- `Ecommerce_Order_Management.sql` → Contains:
  - Table definitions (DDL)
  - Sample data (DML)
  - View for order summaries
  - Trigger to manage stock after payment
  - Sample test queries

---

## 🧠 Concepts Used

- Relational DB Design
- Primary & Foreign Keys
- JOINs and Aggregations
- Views
- Triggers
- Sample Data Insertion

---

## 🧪 Sample Queries

### 🔝 Top 5 Best-Selling Products
```sql
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 5;



-- Products ordered by a specific user

SELECT u.name, p.name, oi.quantity
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE u.user_id = 1;

🧠 Concepts Used

Relational DB Design
JOINS & Aggregations
Views
Triggers
Sample Data Insertion
📈 Tools Recommended

[MySQL Workbench] (sql)


🛠️ How to Run This Project

Install MySQL
Download the SQL file: [Ecommerce_Order_Management.sql]

Import and run the script to create tables and insert data
Test sample queries, views, and triggers

🧩 ER Diagram
![ER Diagram]
(![ecommerce_er_diagram](https://github.com/user-attachments/assets/84e7a763-b618-4439-991e-161279f1d071)

📁 What’s Inside?
A visual diagram of your database with:

Users,Products, Orders, Order_Items, Payments tables.

Relationships shown with arrows.

📄 License
This project is licensed under the MIT License. You are free to use, modify, and distribute.

🤝 Contributing
Contributions are welcome! If you'd like to improve the project, feel free to fork the repo and submit a pull request.

🙋‍♂️ Author
Piyush Dubey
📧 piyushdubey447@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/piyush-dubey-70183429a)

## 🚀 How to Run This Project

step1: Download or clone this repository.
step2: Open MySQL Workbench or any SQL IDE.
step3: Import and run the `Ecommerce_Order_Management.sql` file,
step4: Explore data using the sample queries provided.

