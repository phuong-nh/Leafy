import 'package:flutter/material.dart';

double _recycleMapEdgePadding = 20;

double getRecycleMapEdgePadding() {
  return _recycleMapEdgePadding;
}

class RecycleMapPointData {
  RecycleMapPointData({
    this.pointName,
    this.pointDescription,
  });
  String pointName;
  String pointDescription;
  Widget getPointDataCard() {
    return Card(
      elevation: getRecycleMapEdgePadding() / 2,
      child: ListTile(
        title: Text(pointName),
        subtitle: Text(pointDescription),
      ),
    );
  }
}

class _RecycleMapPointListData {
  _RecycleMapPointListData({
    this.pointList,
  });
  List<RecycleMapPointData> pointList;
  Widget _getPointListData() {
    return Expanded(
      child: ListView.builder(
        itemCount: pointList.length,
        itemBuilder: (BuildContext context, int _index) =>
          pointList[_index].getPointDataCard(),
      ),
    );
    //return pointList[0].getPointDataCard();
  }
}

class RecycleMapCardData {
  RecycleMapCardData({
    this.cardTitle,
    this.cardImageDir,
    this.cardDataPointList,
  });
  String cardTitle;
  String cardImageDir;
  _RecycleMapPointListData cardDataPointList;
  Widget getTitle(BuildContext context) {
    return Container(
      child: Text(cardTitle, style: Theme.of(context).textTheme.headline5,),
      alignment: Alignment.center,
      height: 50,
    );
  }
  Widget getImage() {
    return Expanded(child: Image.asset(cardImageDir,
      fit: BoxFit.fitHeight,
    ),);
  }
  Widget getUnexpandedImage() {
    return Image.asset(cardImageDir,
      fit: BoxFit.fitHeight,
    );
  }
  String getTitleString() {
    return cardTitle;
  }
  Widget getPointListDataList() {
    return cardDataPointList._getPointListData();
  }
}

List<RecycleMapCardData> recycleMapCardDatabase = new List();

int recycleMapCardDatabaseGenerator() {
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Chai nhựa',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList: _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Unreal Cafe',
        pointDescription: '28 đường Thất Hiệu, Đà Nẵng',
      ),
      RecycleMapPointData(
        pointName: 'Xưởng Chốn Ảo',
        pointDescription: '85 đường Bất Tại, Đà Nẵng',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Thủy tinh',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList: _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Nhà máy thủy tinh Sơn Tinh',
        pointDescription: '73 đường Viễn Hướng, Đà Nẵng',
      ),
      RecycleMapPointData(
        pointName: 'Xưởng Chốn Ảo',
        pointDescription: '85 đường Bất Tại, Đà Nẵng',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Giấy',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList: _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Xưởng Chốn Ảo',
        pointDescription: '85 đường Bất Tại, Đà Nẵng',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Lon thiếc',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList: _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Không gian sáng tạo Đồ Vọc Vạch',
        pointDescription: '142 đường Thất Hiệu, Đà Nẵng',
      ),
    ]),
  ));
  return 4;
}
RecycleMapCardData getRecycleMapCardData(int _index) {
  return recycleMapCardDatabase[_index];
}