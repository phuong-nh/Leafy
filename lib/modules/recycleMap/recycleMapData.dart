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
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
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
        itemBuilder: (BuildContext context, int _index) => Column(
          children: <Widget>[
            pointList[_index].getPointDataCard(),
            SizedBox(
              height: 8,
            ),
          ],
        ),
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
      child: Text(
        cardTitle,
        style: Theme.of(context).textTheme.headline5,
      ),
      alignment: Alignment.center,
      height: 50,
    );
  }

  Widget getImage() {
    return Expanded(
      child: Image.asset(
        cardImageDir,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget getUnexpandedImage() {
    return Image.asset(
      cardImageDir,
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
    cardDataPointList:
        _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Sông Hàn',
        pointDescription: 'Xin đừng xuống tắm',
      ),
      RecycleMapPointData(
        pointName: 'Thùng rác',
        pointDescription: 'Nhà của học sinh sau họp phụ huynh',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Item #2',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList:
        _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'Lầu Ngưng Bích',
        pointDescription: 'Kiều đã đi rồi...',
      ),
      RecycleMapPointData(
        pointName: 'Wakanda',
        pointDescription: 'Unlimited vibranium',
      ),
      RecycleMapPointData(
        pointName: 'America',
        pointDescription: 'Get your guns ready',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Item #3',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList:
        _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'America',
        pointDescription: 'Get your guns ready',
      ),
    ]),
  ));
  recycleMapCardDatabase.add(RecycleMapCardData(
    cardTitle: 'Item #4',
    cardImageDir: 'lib/assets/recycleMapAssets/icon_placeholder.png',
    cardDataPointList:
        _RecycleMapPointListData(pointList: <RecycleMapPointData>[
      RecycleMapPointData(
        pointName: 'America',
        pointDescription: 'Get your guns ready',
      ),
    ]),
  ));
  return 4;
}

RecycleMapCardData getRecycleMapCardData(int _index) {
  return recycleMapCardDatabase[_index];
}
