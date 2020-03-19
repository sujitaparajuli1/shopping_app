import 'package:flutter/material.dart';
//my own import
import 'package:shopping_app/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purpleAccent,
        title: Text(' Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white
              ),
               onPressed: () {}),
         
             
        ],
      ),
      body: new Cart_products(),
      
      bottomNavigationBar: new Container(
        color:Colors.lightBlue,
        child:Row(children: <Widget>[Expanded(child: ListTile(title:new Text("Total"),
        subtitle: new Text("\$230"),
        ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: ()
        {},
         child:new Text("data check out",
        
         style:TextStyle(color: Colors.black),),
color:Colors.greenAccent,),
        
        
        
        ),
        ],
        )
      ),

    );
  }
}