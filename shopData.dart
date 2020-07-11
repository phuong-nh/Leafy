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
    shopItemName: 'Ống hút cỏ',
    shopItemPrice: 69000,
    shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  shopItemDatabase.add(ShopItemData(
      shopItemName: 'Bình nước giữ nhiệt',
      shopItemPrice: 420000,
      shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  shopItemDatabase.add(ShopItemData(
      shopItemName: 'Sổ tự xóa',
      shopItemPrice: 126000,
      shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  shopItemDatabase.add(ShopItemData(
      shopItemName: 'Túi nilon tự phân hủy - bộ 100 cái',
      shopItemPrice: 37000,
      shopItemImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png'
  ));
  return 4;
}

ShopItemData getShopItemData(_index) {
  return shopItemDatabase[_index];
}