import 'package:classico/home_page.dart';
import 'package:classico/pages/cartpage.dart';
import 'package:classico/pages/login_page.dart';
import 'package:classico/pages/register_page.dart';
import 'package:classico/utils/routes.dart';
import 'package:flutter/material.dart';
import 'widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/":(context)=>Loginpage(),
         MyRoutes.homeRoute:(context)=>Homepage(),
        MyRoutes.loginRoute:(context)=>Loginpage(),
        MyRoutes.cartRoute:(context)=>CartPage(),
        MyRoutes.registerRoute:(context)=>Registerpage(),
      }
    );
  }
}


