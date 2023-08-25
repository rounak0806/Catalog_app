import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/cart.dart';
import '../models/catalog.dart';
import '../widgets/Themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
   AddToCart({required Key key, required this.catalog, }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isIncart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(onPressed: () {
      if(!isIncart) {
        isIncart = !isIncart;
        final _catalog = CatalogModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {

        });
      }
    },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),

      child:isIncart? Icon(Icons.done) :  Icon(CupertinoIcons.calendar_badge_plus),
    );
  }
}
