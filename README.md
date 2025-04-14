<h1>E-CommerceDatabase</h1> 
<h2>Overview</h2>
<p>Defacto is a popular clothes brand that wants to expand by launching an e-commerce website, the website has many categories such as men, women and kids with a variety of clothes choices in many occasions.</h2>
<p>
  
<h2>📘 Database Documentation</h2>
<h2>📂 Entities</h2>

<h2>1. Users</h2>
      <li><th>user_id – Primary Key</th></li>
      <li><th>user_name – Full name of the user</th></li>
      <li><th>DOB – Date of birth</th></li>
      <li><th>Age – Age of the user</th></li>
      <li><th>email – Email address</th></li>
      <li><th>type – User type (could represent role, status, etc.)</th></li>

 
<h2>2. Products</h2>
  <li><th>	prod_id – Primary Key</th></li>
  <li><th>prod_name – Name of the product</th></li>
  <li><th>	brand – Brand name</th></li>
  <li><th>posting_date – Date the product was listed</th></li>
  <li><th>color – Color of the product</th></li>
  <li><th>price – Original price</th></li>
  <li><th>discount – Discount percentage (if any)</th></li>
  <li><th>tags – Search/filter keywords</th></li>
  <li><th>category – Product category</th></li>
  <li><th>type – Product type</th></li>
  <li><th>dep – Department (e.g., Men's, Women's)</th></li>
  <li><th>season – Seasonal relevance (e.g., Winter, Summer)</th></li>

<h2>3. Cart (Weak Entity – dependent on User)</h2>
  <li><th>user_id – Primary Key (FK to Users)</th></li>
  <li><th>last_add – Date of last addition to the cart</th></li>
  <li><th>total_value – Calculated value of all items</th></li>

<h2>4. Cart Items</h2>
  <li><th>user_id – Foreign Key</th></li>
  <li><th>prod_id – Foreign Key</th></li>
  <li><th>price_per_unit – Product price at time of adding</th></li>
  <li><th>quantity – Number of units added</th></li>
  <li><th>items_value – Derived column (price_per_unit × quantity)</th></li>
  <li><th>Composite Primary Key: (user_id, prod_id)</th></li>

<h2>5. Orders</h2>
  <li><th>order_id – Primary Key</th></li>
  <li><th>payment_id – ID of payment (external ref)</th></li>
  <li><th>payment_method – Payment method used</th></li>
  <li><th>ship_fees – Shipping charges</th></li>
  <li><th>order_value – Total value of items</th></li>
  <li><th>user_id – Foreign Key to Users</th></li>
  <li><th>order_date – Date when the order was placed</th></li>

<h2>6. Order Items</h2>
  <li><th>rder_id – Foreign Key</th></li>
  <li><th>prod_id – Foreign Key</th></li>
  <li><th>price_per_unit – Price per unit at time of purchase</th></li>
  <li><th>quantity – Quantity ordered</th></li>
  <li><th>items_value – Derived column (price_per_unit × quantity)</th></li>
  <li><th>Composite Primary Key: (order_id, prod_id)</th></li>

<h2>7. Product Reviews</h2>
  <li><th>prod_id – Foreign Key</th></li>
  <li><th>user_id – Foreign Key</th></li>
  <li><th>review – Review text (max 250 characters)</th></li>
  <li><th>Composite Primary Key: (prod_id, user_id)</th></li>

<h2>8. Product Images</h2>
  <li><th>prod_id – Foreign Key</th></li>
  <li><th>url – Image URL</th></li>
  <li><th>Composite Primary Key: (prod_id, url)</th></li>

<h2>9. Product Sizes</h2>
<li><th>prod_id – Foreign Key</th></li>
<li><th>size – Size (numeric or code)</th></li>
<li><th>Composite Primary Key: (prod_id, size)</th></li>

<h2>10. User Address</h2>
  <li><th>user_id – Foreign Key</th></li>
  <li><th>state</th></li>
  <li><th>city</th></li>
  <li><th>street</th></li>
  <li><th>zip_code</th></li>
  <li><th>Composite Primary Key: (user_id, state, city, street)</th></li>

<h2>11. User Phone Numbers</h2>
  <li><th>user_id – Foreign Key</th></li>
  <li><th>country_code – International prefix</th></li>
  <li><th>phone_number – Complete number</th></li>
  <li><th>Composite Primary Key: (user_id, country_code, phone_number)</th></li>

<h1>⚙️ Functionality</h1>

<h2>📈 Conversion Rate</h2>
<p>Calculate the percentage of users who have placed at least one order compared to total users.</p>

<h2>💰 Order Values and Averages</h2>
<p>Aggregate and analyze minimum, maximum, and average order values across all users.</p>

<h2>💳 Segmentation Based on Payment Method Used</h2>
<p>Group orders by payment_method to identify trends in how users are paying and their corresponding order values.</p>

<h2>🏆 Top Products Bought</h2>
<p>List products ranked by the total quantity sold, helping identify best-sellers.</p>

<h2>🧮 GMV (Gross Merchandise Value)</h2>
<p>Total revenue generated from all orders, excluding shipping fees and discounts unless explicitly included in order_value.</p>

<h2>🥇 Top Users in Terms of Merchandise Value</h2>
<p>Rank users by the total value of their purchases (order_value) across all their orders.</p>

<h2>⏳ Retrieve Orders in a Specific Timeframe</h2>
<p>Fetch all orders placed within a given date range using the order_date field.</p>

<h2>📊 Get Average Order Value for a Specific User for the Last 5 Months</h2>
<p>Calculate the average order_value for a single user considering orders from the past 5 months.</p>

<h2>🗑️ User Deletion</h2>
<p>Remove a user and all associated data:</p>
<h4>●	Cascades to delete from: orders, order_items, cart, cart_items, user_address, user_pn, and product_reviews.</h4>

<h2>🧹 Removing One or All Cart Items</h2>
<p>●	Remove One: Delete a specific entry from cart_items for a given product.</p>
<p>●	Remove All: Clear all cart_items entries for a user.</p>

<h2>✅ Order Placement</h2>
<p>●	Transfer data from cart_items into order_items and create a new entry in orders.</p>
<p>●	Clear the user's cart upon successful placement.</p>
<p>●	Preserve the price and quantity from the cart at the time of order.</p>

<h1>Tools Used</h1>
<p>Mackaroo:Random Data Generator</p>
<p>SQL Server Management Studio (SSMS): Used for managing the database, writing SQL queries, and ensuring data integrity.</p>
<p>Miro: Used for creating the Entity-Relationship Diagram (ERD) and visual mapping of the database schema.</p>


