import 'package:flutter/material.dart';

import '../widgets/Themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text("Catalog App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluishColor,
            ),

          ),

        ]
    );
  }
}
