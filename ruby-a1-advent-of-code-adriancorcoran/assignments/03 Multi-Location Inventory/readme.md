# Multi Location Inventory Logic, Class Descriptions and Checkout Flow

## About Our Store

Our store has locations in Ireland, Canada and Germany. The main hub is Ireland with a secondary distribution hub in Canada. Canada handles any orders placed in Canada or the U.S. while Ireland handles everything else. When a customer places an order, the system will check their delivery address, then check which distribution hub to use. If the product is out of stock in the Canadian hub, it will fulfill the order from Ireland instead and vice versa. The shipping rates will reflect the hub from which the products are shipped.


## Testing

<!-- **Scenario 1. run `ruby test.rb`** -->
**Run `ruby test.rb`**
- customer is located in Ireland and places an order
- the product is stocked in Ireland but one of the items is low in stock. Therefore, due to the quantity ordered, the item must also be fulfilled from Canada.

<!-- sorry - didn't get time for the other 2 scenarios :)
**Scenario 2. in `ruby test2.rb`**
- customer is not logged in, located in Germany and places an order
- the product is stocked in Ireland, and the order will be fulfilled from Ireland

**Scenario 3. in `ruby test3.rb`**
- customer is physically in the store in Ireland and buy something through POS and also places an order for Maple Syrup which is exclusively available through the Canadian Store
- the product is stocked in Canada, and the order will be fulfilled from Canada -->

## Logic
1. Customer adds products to cart
    * *Cart adds a product to the current cart*
    * `Cart::AddVariant`
    * `Cart::InCart`
    * `Cart::DisplayCart`

2. Customer proceeds to checkout step 1 (personal info)
    * *Order is created and status & subtotal set*
    * `Order::CreateOrder`
    * `Order::SetSubtotal`
    * `Order::DisplayOrder`
    * *Order gets line items for order from cart*
    * `Cart::GetCart`

3. Customer enters personal info and delivery address and proceeds to shipping
    * *Customer provides customer details*
    * `Customer::CreateCustomer`
    * `Customer::GetCustomer`
    * *Add Customer to Order*
    * `Order::AddCustomer`
    * `Order::DisplayOrder`

4. Customer is presented with subtotal and total, as well as shipping rates dictated by their address and also the inventory levels at the distribution hubs
    * *Order updates cost after shipping*
    * `Order::CalculateShipping`
    * *Shipping provides shipping options*
    * `Shipping::GetRates`
    * `Order::SetShippingCost`
    * `Order::SetTotal`
    * `Order::DisplayOrder`

6. Customer enters card details and pays for order, checkout is processed
    * *Order does checkout transaction and updates status*
    * `Order::DoCheckout`
    * *Order updates order status*
    * `Order::UpdateStatus`
    * *Order sends email*
    * `Order::SendOrderEmail`
    * *Order show all order details*
    * `Order::DisplayOrder`   

## Classes

### CartManager
* maintains one cart across the store
* holds the chosen product variant data in the cart

### CustomerManager
* manages the customer database and information

### ProductManager
* manages the product database and information

### OrderManager
* manages all the order information and coordinates the checkout process

### ShippingManager
* maintains the store outlets and also the stores distribution hubs
* also calculates the available shipping options and costs
