import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SoftDrinksTypes.dart';
import 'package:yumm_food/widgets/TransactionPage.dart';

class SoftDrinksCart extends StatefulWidget {
  late String productName;
  late double productPrice;
  late String productImage;
  late VoidCallback onAddToCart;

  @override
  SoftDrinksCartState createState() => SoftDrinksCartState();
}

class SoftDrinksCartState extends State<SoftDrinksCart> {
  // List of available food items
  List<Map<String, dynamic>> foodItems = [
    {
      "productName": "Mirinda",
      "productPrice": 30.0,
      "productImage": "assets/images/softdrinks/mirinda.jpg",
    },
    {
      "productName": "Pepsi",
      "productPrice": 35.0,
      "productImage": "assets/images/softdrinks/pepsi.jpg",
    },
    {
      "productName": "Mango",
      "productPrice": 50.0,
      "productImage": "assets/images/softdrinks/mango.jpg",
    },
    {
      "productName": "Sprite",
      "productPrice": 45.0,
      "productImage": "assets/images/softdrinks/sprite.jpg",
    },
    {
      "productName": "Fanta",
      "productPrice": 45.0,
      "productImage": "assets/images/softdrinks/fanta.jpg",
    },
    {
      "productName": "CocaCola",
      "productPrice": 50.0,
      "productImage": "assets/images/softdrinks/cocacola.jpg",
    },
  ];

  // Cart that holds only the selected food items
  List<Map<String, dynamic>> cartItems = [];

  // Function to add the selected item to the cart
  void addToCart(Map<String, dynamic> item) {
    setState(() {
      // Add the item to the cart if it's not already there
      cartItems.add({
        ...item,
        'quantity': 1, // Initialize with quantity = 1
      });
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Function to update the quantity of a cart item
  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] < 1) {
        cartItems[index]['quantity'] = 1; // Prevent quantity from going below 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        title: Text("Drinks Cart"),
      ),
      body: Column(
        children: [
          // Food item listing
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return FoodItem(
                  productName: item['productName'],
                  productPrice: item['productPrice'],
                  productImage: item['productImage'],
                  onAddToCart: () => addToCart(item),
                );
              },
            ),
          ),
          Divider(),
          // Cart listing for added items
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return CartItem(
                        key: ValueKey(cartItem['productName']),
                        productName: cartItem['productName'],
                        productPrice: cartItem['productPrice'],
                        productCartQuantity: cartItem['quantity'],
                        productImage: cartItem['productImage'],
                        onAdd: () => updateQuantity(index, 1),
                        onRemove: () => updateQuantity(index, -1),
                        onDelete: () => removeFromCart(index),
                      );
                    },
                  ),
          ),
          TotalCalculationWidget(cartItems: cartItems),
          PaymentMethodWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TransactionPage(cartItems: cartItems)));
            },
          ),
          Padding(padding: EdgeInsets.all(10))
        ],
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  final VoidCallback onTap; // Callback to handle payment tap

  PaymentMethodWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the callback when the payment method is tapped
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/menus/creditcard.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  "Credit/Debit Card",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3a3a3b),
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalCalculationWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  TotalCalculationWidget({required this.cartItems});

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['productPrice'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  ...cartItems.map((item) {
                    double itemTotal = item['productPrice'] * item['quantity'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item['productName'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "₹${itemTotal.toStringAsFixed(2)} (${item['quantity']} x ₹${item['productPrice'].toStringAsFixed(2)})",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "₹${getTotalPrice().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
                  borderRadius: BorderRadius.circular(7)),
              fillColor: Colors.white,
              hintText: 'Add Your Promo Code',
              filled: true,
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.local_offer,
                    color: Color(0xFFfd2c2c),
                  ),
                  onPressed: () {
                    debugPrint('222');
                  })),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int productCartQuantity;
  final String productImage;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productCartQuantity,
    required this.productImage,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
    required ValueKey<String> key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              productImage,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("₹${productPrice.toStringAsFixed(2)}"),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(Icons.remove),
                  color: Colors.black,
                  iconSize: 18,
                ),
                Text(
                  productCartQuantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: onAdd,
                  icon: Icon(Icons.add),
                  color: Color(0xFFfd2c2c),
                  iconSize: 18,
                ),
                IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
