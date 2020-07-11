import 'package:flutter/material.dart';
import 'shopElements.dart';
import 'shopData.dart';

class ShopInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //padding: EdgeInsets.fromLTRB(getRecycleMapEdgePadding(), getRecycleMapEdgePadding(), getRecycleMapEdgePadding(), 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text('Bạn muốn mua gì?', style: Theme.of(context).textTheme.headline3,),
                padding: EdgeInsets.fromLTRB(getShopPadding(), getShopPadding(), getShopPadding(), 0),
              ),
              //RecycleMapCard(cardData: getRecycleMapCardData(0),),
              Expanded(
                child: GridView.builder(
                  itemCount: shopItemDatabaseGenerator(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: getShopPadding() / 2,
                    mainAxisSpacing: getShopPadding() / 2,
                  ),
                  itemBuilder: (BuildContext context, int _index) {
                    return ShopItemCard(itemData: getShopItemData(_index),);
                  },
                  padding: EdgeInsets.all(getShopPadding()),
                  //physics: ScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
