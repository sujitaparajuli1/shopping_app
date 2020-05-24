import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/db/user.dart';
import 'package:shopping_app/pages/home.dart';
import '../db/user.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  UserServices _userServices=UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController=TextEditingController();
  TextEditingController _nameTextController= TextEditingController();
 bool loading = false;
 bool hidePass=true;
 String groupValue='Female';
 String gender;
 
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/products/dress2.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                         Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                                              title: TextFormField(
                                  controller: _nameTextController,

                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    icon: Icon(Icons.people),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    hidePass=false;
                                  });
                                }),
                              ),
                            ),
                          ),
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                               
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),

                              
                            ),
                          ),
                        ),
                         Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: new Container(
                            color: Colors.white.withOpacity(0.4),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                  title: Text(
                                    "Male",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                      value: "female",
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                )),
                                Expanded(
                                    child: ListTile(
                                  title: Text(
                                    "Female",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                      value: "male",
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                )),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                                              title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                     border: InputBorder.none,
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    hidePass=false;
                                  });
                                }),
                               

                              ),
                             
                             
                      
                            ),
                          ),
                        ),
 Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                                              title: TextFormField(
                                  controller: _confirmPasswordController,
obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    border: InputBorder.none,
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }else if(_passwordTextController.text!=value)
                                    {
                                      return "the password do not match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){}),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  validateForm();
                                                                  },
                                                                  minWidth: MediaQuery.of(context).size.width,
                                                                  child: Text(
                                                                    "SignUp",
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 20.0),
                                                                  ),
                                                                )),
                                                          ),
                                                         
                                  //                          Expanded(child: Container()),
                                  
                                                          Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: InkWell(
                                                                  onTap: (){
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text("Login", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),))
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: loading ?? true,
                                              child: Center(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.white.withOpacity(0.9),
                                                  child: CircularProgressIndicator(
                                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  
                                    valueChanged(e) {
                                      setState(() {
                                        if(e=="male")
                                        {
                                          groupValue=e;
                                          gender=e;
                                        }
                                        else if(e=="female")
                                        {
                                          groupValue=e;
                                          gender=e;
                                        }
                                      });
                                    }
                                    Future validateForm() async {
    FormState formState = _formKey.currentState;


    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();


      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then(
              (user) => Firestore.instance.collection("users").add({
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": user.user.uid,
                "gender": (gender.toString()),
              }),
            )
            .catchError(
              (err) => print(
                err.toString(),
              ),
            );


        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            ModalRoute.withName(HomePage().toString()));
      } else {
        print("already a user");
      }
    }
  }
                                  
                                   /* Future<void> validateForm() async{
                                      FormState formState=_formKey.currentState;
                                     
                                      if(formState.validate())
{
  formState.reset();
FirebaseUser user = await firebaseAuth.currentUser();
if(user==null){
  firebaseAuth
  .createUserWithEmailAndPassword(
    email: _emailTextController.text,
     password: _passwordTextController.text)
 .then((value) =>
 {
_userServices.createUser(
user.uid,
{
    "username":user.displayName ,
    "email":user.email,
    "userId":user.uid,
    "gender":gender,
  }
)
 }
  
 ).catchError((err)=>{print(err.toString())});
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
}
}
                                    }*/
}
