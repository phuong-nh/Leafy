import 'package:flutter/material.dart';
import 'shopData.dart';

class ShopItemCard extends StatelessWidget {
  ShopItemCard({
    this.itemData,
  });
  final ShopItemData itemData;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(getShopPadding() / 5),
        child: Column(
          children: <Widget>[
            Expanded(
              child: itemData.getImage(),
            ),
            Align(
              child: Text(
                itemData.getName(),
                style: Theme.of(context).textTheme.headline5,
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 4,
            ),
            Align(
              child: Text(
                itemData.getPrice().toString() + ' VND',
                style: Theme.of(context).textTheme.headline6,
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
