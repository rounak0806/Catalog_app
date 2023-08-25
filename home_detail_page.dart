import 'package:classico/home_widgets/add_to_cart.dart';
import 'package:classico/models/catalog.dart';
import 'package:classico/utils/routes.dart';
import 'package:classico/widgets/Themes.dart';
import 'package:flutter/material.dart';
class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog}):
      assert(catalog!= null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.all(32),
        children: [
          Text(
            "\$${catalog.price}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          AddToCart(catalog: catalog, key: ValueKey(catalog.id)),
      ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding (padding: EdgeInsets.all(0)),
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),

            ),
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 15)),
                      Text(catalog.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.darkBluishColor,
                        ),
                      ),
                      Text(catalog.desc,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Smartphones have revolutionized the way we communicate and access information."),
                    ],

                  ),

            ))
          ],
        ),
      ),
    );
  }
}
