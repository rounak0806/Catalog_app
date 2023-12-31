import 'package:classico/utils/routes.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name="";
  bool changeButton=false;
  final _formkey=GlobalKey<FormState>();
  moveToHome(BuildContext context)
  async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset("assets/images/hey.png",
                  fit:BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                ),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "username cannot be empty";
                        }
                        return null;
                      },

                      onChanged:(value){
                        name=value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        } else if (value!.length<6){
                          return "password length should be more than 5";
                        }
                        return null;
                      },

                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton ? 50:8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap:() =>moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton? 50 : 100,
                          height: 50,
                          alignment: Alignment.center,
                          child:changeButton?Icon(Icons.done,color: Colors.white,):Text(
                            "Login",
                            style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.registerRoute);
                        },
                        child: Text(
                          'Sign up?',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xff4c505b),
                            fontSize: 18,
                          ),
                        )),
                  ],
                )

              ],
            ),
          ),
        ),
    );
  }
}
