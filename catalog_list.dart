import 'package:classico/home_widgets/catalog_imagre.dart';
import 'package:classico/home_widgets/home_detail_page.dart';
import 'package:flutter/material.dart';
import '../widgets/Themes.dart';
import '../models/catalog.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items?.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context )=> HomeDetailPage(
                  catalog: catalog
              ),
          ),
          ),
            child: CatalogItem( catalog: catalog)
        );
      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key , required this.catalog}) :
        assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(catalog.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBluishColor,
                    ),
                  ),
                  Text(catalog.desc,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      Text(
                        "\$${catalog.price}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddToCart(key: UniqueKey(), catalog: catalog),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),

      color: Colors.white,
      width: 150,
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 20.0),
    );

  }
}
