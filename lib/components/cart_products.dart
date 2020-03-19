//import 'dart:html';

import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Product_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 45,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "color": "Blue",
      "price": 67,
      "size": "L",
      "quantity": 2,
    },
     {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "color": "Blue",
      "price": 67,
      "size": "L",
      "quantity": 2,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Product_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_product_name: Product_on_the_cart[index]["name"],
            cart_product_color: Product_on_the_cart[index]["color"],
            cart_product_new_price: Product_on_the_cart[index]["price"],
            cart_product_picture: Product_on_the_cart[index]["picture"],
            cart_product_quantity: Product_on_the_cart[index]["quantity"],
            cart_product_size: Product_on_the_cart[index]["size"],
          );
        });
  }
}

//stateless widget banaune
class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_new_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_quantity;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_new_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_quantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //========LEADING SECTION=========
        leading: new Image.asset(
          cart_product_picture,
          width: 30.0,
          height: 80.0,
        ),
        //==============TITLE SECTION========
        title: new Text(cart_product_name),
        //======SUBTITLE SECTION=======
        subtitle: new Column(
          children: <Widget>[
            //ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>
                  //THIS SECTION IS FOR THE SIZE OF THE PRODUCT
                  [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
                // =========this section is for color=========
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                )
              ],
            ),
            // ======THIS SECTION IS FOR PRODUCT PRICE============
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_product_new_price}",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
       trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text("$cart_product_quantity"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
          ),
        ),
      ),
    );
  }
}
