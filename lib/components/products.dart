import 'package:flutter/material.dart';
import 'package:shopping_app/components/horizontal_listview.dart';
import 'package:shopping_app/pages/product_detail.dart';
//import 'package:shopping_app/pages/product_detail.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list=[
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":120 ,
      "new_price":100 ,
    },

    
    {
      "name":"Dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":120 ,
      "new_price":300 ,
    },
    

    
    

    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    itemCount:product_list.length,
   gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount
   (crossAxisCount: 2),
   itemBuilder: (BuildContext context,int index){
     return Single_Prod(
       prod_name: product_list[index]['name'],
       prod_picture: product_list[index]['picture'],
       prod_old_price:product_list[index]['old_price'],
       prod_new_price: product_list[index]['new_price']
     );
   }
      
    );
  }
}
class Single_Prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_new_price;
  Single_Prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_new_price,
    
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Hero(
        tag:prod_name,
        child: Material(child:InkWell(
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new ProductDetails(
              //here we r passing the product to the product detail page.
              product_details_name: prod_name,
              product_detail_new_price: prod_new_price,
              product_datail_old_price: prod_old_price,
              paroduct_deatail_image: prod_picture,
            ))),
      child:GridTile(
        footer: Container(
        color:Colors.lightBlue,
        child:ListTile(
          leading:Text(prod_name,
          style:TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Text("$prod_new_price",
          style: TextStyle(color:Colors.black87,
          fontWeight:FontWeight.w800
          ),),
           subtitle: Text("$prod_old_price",
          style: TextStyle(color:Colors.black87,
          fontWeight:FontWeight.w800,
          decoration: TextDecoration.underline
          ),
          ),
        )
      ),
        child:Image.asset(prod_picture,
        fit:BoxFit.cover,)),
      ),
      )),
    
     
    );
  }
}