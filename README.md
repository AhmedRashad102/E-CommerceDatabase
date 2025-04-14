```
E-CommerceDatabase
Defacto is a popular clothes brand that wants to expand by launching an e-commerce website, the website has many categories such as men, women and kids with a variety of clothes choices in many occasions.
________________________________________
📘 Database Documentation
📂 Entities
________________________________________
1. Users
Represents a registered customer.
●	user_id – Primary Key
●	user_name – Full name of the user
●	DOB – Date of birth
●	Age – Age of the user
●	email – Email address
●	type – User type (could represent role, status, etc.)
________________________________________
2. Products
Represents a purchasable item.
●	prod_id – Primary Key
●	prod_name – Name of the product
●	brand – Brand name
●	posting_date – Date the product was listed
●	color – Color of the product
●	price – Original price
●	discount – Discount percentage (if any)
●	tags – Search/filter keywords
●	category – Product category
●	type – Product type
●	dep – Department (e.g., Men's, Women's)
●	season – Seasonal relevance (e.g., Winter, Summer)
________________________________________
3. Cart (Weak Entity – dependent on User)
Each user has a single cart.
●	user_id – Primary Key (FK to Users)
●	last_add – Date of last addition to the cart
●	total_value – Calculated value of all items
________________________________________
4. Cart Items
Represents products added to the user's cart.
●	user_id – Foreign Key
●	prod_id – Foreign Key
●	price_per_unit – Product price at time of adding
●	quantity – Number of units added
●	items_value – Derived column (price_per_unit × quantity)
Composite Primary Key: (user_id, prod_id)
________________________________________
5. Orders
A completed purchase by a user.
●	order_id – Primary Key
●	payment_id – ID of payment (external ref)
●	payment_method – Payment method used
●	ship_fees – Shipping charges
●	order_value – Total value of items
●	user_id – Foreign Key to Users
●	order_date – Date when the order was placed
________________________________________
6. Order Items
Items within a specific order.
●	order_id – Foreign Key
●	prod_id – Foreign Key
●	price_per_unit – Price per unit at time of purchase

●	quantity – Quantity ordered
●	items_value – Derived column (price_per_unit × quantity)
Composite Primary Key: (order_id, prod_id)
________________________________________
7. Product Reviews
Stores user reviews on products.
●	prod_id – Foreign Key
●	user_id – Foreign Key
●	review – Review text (max 250 characters)
Composite Primary Key: (prod_id, user_id)
________________________________________
8. Product Images
Stores product image URLs.
●	prod_id – Foreign Key
●	url – Image URL
Composite Primary Key: (prod_id, url)
________________________________________
9. Product Sizes
Represents size options for a product.
●	prod_id – Foreign Key
●	size – Size (numeric or code)
Composite Primary Key: (prod_id, size)
________________________________________
10. User Address
Stores address information for users.
●	user_id – Foreign Key
●	state
●	city
●	street
●	zip_code
Composite Primary Key: (user_id, state, city, street)
________________________________________
11. User Phone Numbers
Stores one or more contact numbers per user.
●	user_id – Foreign Key
●	country_code – International prefix
●	phone_number – Complete number
Composite Primary Key: (user_id, country_code, phone_number)
________________________________________
⚙️ Functionality
________________________________________
📈 Conversion Rate
Calculate the percentage of users who have placed at least one order compared to total users.
________________________________________
💰 Order Values and Averages
Aggregate and analyze minimum, maximum, and average order values across all users.
________________________________________
💳 Segmentation Based on Payment Method Used
Group orders by payment_method to identify trends in how users are paying and their corresponding order values.
________________________________________
🏆 Top Products Bought
List products ranked by the total quantity sold, helping identify best-sellers.
________________________________________
🧮 GMV (Gross Merchandise Value)
Total revenue generated from all orders, excluding shipping fees and discounts unless explicitly included in order_value.
________________________________________
🥇 Top Users in Terms of Merchandise Value
Rank users by the total value of their purchases (order_value) across all their orders.
________________________________________
⏳ Retrieve Orders in a Specific Timeframe
Fetch all orders placed within a given date range using the order_date field.
________________________________________
📊 Get Average Order Value for a Specific User for the Last 5 Months
Calculate the average order_value for a single user considering orders from the past 5 months.
________________________________________
🗑️ User Deletion
Remove a user and all associated data:
●	Cascades to delete from: orders, order_items, cart, cart_items, user_address, user_pn, and product_reviews.

________________________________________
🧹 Removing One or All Cart Items
●	Remove One: Delete a specific entry from cart_items for a given product.
●	Remove All: Clear all cart_items entries for a user.
________________________________________
✅ Order Placement
●	Transfer data from cart_items into order_items and create a new entry in orders.
●	Clear the user's cart upon successful placement.
●	Preserve the price and quantity from the cart at the time of order.
________________________________________

