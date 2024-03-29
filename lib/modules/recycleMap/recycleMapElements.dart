import 'package:flutter/material.dart';
import 'recycleMapData.dart';

class RecycleMapCard extends StatelessWidget {
  final RecycleMapCardData cardData;
  RecycleMapCard({this.cardData});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        child: Container(
          child: Column(
            children: <Widget>[
              cardData.getImage(),
              cardData.getTitle(context),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecycleMapCardNewPage(
                        cardData: cardData,
                      )));
        },
      ),
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}

class RecycleMapCardNewPage extends StatelessWidget {
  RecycleMapCardNewPage({this.cardData});
  final RecycleMapCardData cardData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(getRecycleMapEdgePadding() / 5),
          child: AspectRatio(
            child: Expanded(
              child: cardData.getUnexpandedImage(),
            ),
            aspectRatio: 1,
          ),
        ),
        title: Text(
          cardData.getTitleString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
          SizedBox(
            width: getRecycleMapEdgePadding() / 2,
          )
        ],
        elevation: getRecycleMapEdgePadding(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(getRecycleMapEdgePadding()),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(getRecycleMapEdgePadding()),
              child: Text(
                'Where to recycle:\n' + cardData.getTitleString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            cardData.getPointListDataList(),
          ],
        ),
      ),
    );
  }
}
