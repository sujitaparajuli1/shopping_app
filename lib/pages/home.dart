import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/horizontal_listview.dart';
import 'package:shopping_app/components/products.dart';
import 'package:shopping_app/pages/cart.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel= new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
        AssetImage('images/c1.jpg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/w1.jpeg'),
        AssetImage('images/w3.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
       // animationCurve: Curves.fastOutSlowIn,
       // animationDuration: Duration(milliseconds:1000),
        dotSize: (5.0),
        indicatorBgPadding: 8.0,
        dotColor: Colors.orange,

      ),
    );
    

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purpleAccent,
        title: Text('shopping App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
              })
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
           
            //header

            new UserAccountsDrawerHeader(
              accountName: Text('sujita parajuli'),
              accountEmail: Text('sujitaparajuli123@gmail.com'),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ) //circle Avatar
                  ), //gestureDector
              decoration: new BoxDecoration(color: Colors.red), //box decoration
            ), //userAccountsDrawerHeader

            // body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color:Colors.green,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket,color:Colors.green,),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart,color:Colors.green,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite,color:Colors.green,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings, color:Colors.green,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color:Colors.green,),
              ),
            ),
          ],
        ),
      ),
body: new ListView(
  children:<Widget> [
    //imaage carousel begins here
    image_carousel,
    //padding
    new Padding(padding: const EdgeInsets.all(8.3),
    child:new Text('Categories'),),
    
  //horizontal listview begin here
 HorizontalListView(),
// padding widget
new Padding(padding: const EdgeInsets.all(20.0),
child: new Text('recent product'),
),
//grid view
Container(height:320.0,
child: Products(),
)


  ],
),


    );
  }
}
