import 'package:flutter/material.dart';

double getShopPadding() {
  return 20;
}

class ShopItemData {
  ShopItemData({
    this.shopItemName,
    this.shopItemPrice,
    this.shopItemImageDir,
    this.shopItemURL,
  });
  String shopItemName;
  int shopItemPrice;
  String shopItemImageDir;
  String shopItemURL;
  Widget getImage() {
    return Image.asset(shopItemImageDir, fit: BoxFit.fitHeight,);
  }
  String getName() {
    return shopItemName;
  }
  int getPrice() {
    return shopItemPrice;
  }
}

List<ShopItemData> shopItemDatabase = new List();

int shopItemDatabaseGenerator() {
  shopItemDatabase.clear();
  shopItemDatabase.add(ShopItemData(
    shopItemName: 'Stone powder',
    shopItemPrice: 69000,
    shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  shopItemDatabase.add(ShopItemData(
      shopItemName: 'Weed',
      shopItemPrice: 420000,
      shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  return 2;
}

ShopItemData getShopItemData(_index) {
  return shopItemDatabase[_index];
}