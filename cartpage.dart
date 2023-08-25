import 'package:classico/widgets/Themes.dart';
import 'package:flutter/material.dart';
import '../models/cart.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 32,right: 32)),
              Expanded(child:
                 _CartList(),
              ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text(
             "\$${_cart.totalPrice}",
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: MyTheme.darkBluishColor,
             ),
           ),
           SizedBox(
             width: 120,
             child: ElevatedButton(onPressed: (){},
               style: ButtonStyle(
                   backgroundColor:
                   MaterialStateProperty.all(MyTheme.darkBluishColor)),
                 child: Text(
                   "Buy",
                 ),
             ),
           ),
         ],
      ),

    );
  }
}



class _CartList extends StatefulWidget {


  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Text("Nothing to show",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    )
    :ListView.builder(
      itemCount : _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            _cart.remove(_cart.items[index]);
            setState(() {

            });
          },
        ),
        title:Text(
          _cart.items[index].name,
        ),
      ),
    );
  }
}


