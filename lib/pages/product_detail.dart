import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_detail_new_price;
  final product_datail_old_price;
  final paroduct_deatail_image;


  ProductDetails(
    {
      this.product_details_name,
      this.product_detail_new_price,
      this.product_datail_old_price,
      this.paroduct_deatail_image,
    }
  );
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purpleAccent,
        title: Text('shopping App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),


     body: new ListView(
       children:<Widget>[
         new Container(
         height: 300.0,
         child: GridTile(
          child: Container(
            color:Colors.lightBlueAccent,
            child: Image.asset(widget.paroduct_deatail_image),
          
          ),
          footer: new Container(
            color:Colors.white,
            child:ListTile(
              leading: new Text(widget.product_details_name,
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
              title: new Row(
                children:<Widget>[
                  Expanded(
                    child:
                    new Text("\$${widget.product_detail_new_price}",
                    style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold, ),

                    ),

                  ),
                  Expanded(child: new Text("\$${widget.product_datail_old_price}",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough),),
                  ),
                ],
              ),
            ),
          ),
         ),
        ),

         
         //****** the first button****//
         Row
         (children: <Widget>[
           //the size button
           Expanded(child: MaterialButton(onPressed: (){
             showDialog(context: context,
             builder:(context){
               return new AlertDialog(
                 title:new Text("SIZE"),
                 content:new Text("choose the size"),
                 actions:<Widget>[
                   new MaterialButton(onPressed: (){
                     Navigator.of(context).pop(context);
                   },
                     child:new Text("close"),
                   ),
                 ],
               );
             });
           },
           color:Colors.white,
           textColor:Colors.grey,
           elevation:0.2,
           child:Row(
             children:<Widget>[
               Expanded(child: new Text("Size"),
               ),
           Expanded(child: new Icon(Icons.arrow_drop_down)),
             ],
           ),
           ),
           ),

        



         // ***********the sceond button****************8//
        
           Expanded(child: MaterialButton(onPressed: (){
             showDialog(context: context,
             builder:(context){
               return new AlertDialog(title:new Text("COLORS"),
               content:new Text("choose colors options"),
               actions:<Widget>
               [
                 new MaterialButton(onPressed: (){
                   Navigator.of(context).pop(context);
                 },
                 child: new Text("close"),
                 ),
               ]
               );
             });
           },
           color:Colors.white,
           textColor:Colors.grey,
           elevation:0.2,
           child:Row(
             children:<Widget>[
               Expanded(child: new Text("Colors"),
               ),
           Expanded(child: new Icon(Icons.arrow_drop_down)),
             ],
           ),
           ),
           ),
        


         //********the third button 8888888 */
        
           //the quantity button button
           Expanded(child: MaterialButton(onPressed: (){
              showDialog(context: context,
             builder:(context){
               return new AlertDialog(title:new Text("Quantity"),
               content:new Text("choose how many quantity you want"),
               actions:<Widget>
               [
                 new MaterialButton(onPressed: (){
                   Navigator.of(context).pop(context);
                 },
                 child: new Text("close"),
                 ),
               ]
               );
             });
           },
           color:Colors.white,
           textColor:Colors.grey,
           elevation:0.2,
           child:Row(
             children:<Widget>[
               Expanded(child: new Text("Quant-ity"),
               ),
           Expanded(child: new Icon(Icons.arrow_drop_down)),
             ],
           ),
           ),
           ),
         ],
         ),
         //second row
         Row(children: <Widget>[
           Expanded(
             child:MaterialButton(onPressed: (){},
             color:Colors.red,
             elevation: 0.2,
             child: new Text("Buy now"),

             ),
           ),
          new IconButton(icon: Icon(Icons.add_shopping_cart), color: Colors.red, onPressed: (){}),
          new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red, onPressed: (){},)
         ],
         ),
         Divider(color: Colors.lightGreenAccent,),
new ListTile(
  //style:TextStyle(color:Colors.lightGreenAccent,)
  title:new Text("product details"),
  subtitle:new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
  ,
  

),
Divider(),
  new Row(children: <Widget>[
    Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
    child: new Text("product name",
    style:TextStyle(color:Colors.grey,),),),
    

    Padding(padding: EdgeInsets.all(5.0),
    child:new Text(widget.product_details_name),
    )
  ],
  ),
  new Row(children:<Widget>
  [
    Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0 , 5.0, 5.0),
    child: new Text("product brand",
    style:TextStyle(color: Colors.grey),),
    ),
//remember to create the product brand
Padding(padding: EdgeInsets.all(5.0),
child: new Text("Brand x"),)
  ]),
  new Row(children:<Widget>[
  Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0 , 5.0, 5.0),
    child: new Text("product condition",
    style:TextStyle(color: Colors.grey),),
    ),
    Padding(padding: const EdgeInsets.all(5.0),
    child: new Text("all are available"))
  ],
  )
       ],
     ),
    );
  }
}

