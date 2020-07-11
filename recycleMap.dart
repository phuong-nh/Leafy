import 'package:flutter/material.dart';
import 'recycleMapElements.dart';
import 'recycleMapData.dart';

class RecycleMapInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //recycleMapCardDatabaseGenerator();
    return Container(
      //padding: EdgeInsets.fromLTRB(getRecycleMapEdgePadding(), getRecycleMapEdgePadding(), getRecycleMapEdgePadding(), 0),
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Bạn muốn tái chế gì?', style: Theme.of(context).textTheme.headline3,),
            padding: EdgeInsets.fromLTRB(getRecycleMapEdgePadding(), getRecycleMapEdgePadding() + 20, getRecycleMapEdgePadding(), 0),
          ),
          //RecycleMapCard(cardData: getRecycleMapCardData(0),),
          Expanded(
            child: GridView.builder(
              itemCount: recycleMapCardDatabaseGenerator(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                crossAxisSpacing: getRecycleMapEdgePadding(),
                mainAxisSpacing: getRecycleMapEdgePadding(),
              ),
              itemBuilder: (BuildContext context, int _index) {
                return RecycleMapCard(cardData: getRecycleMapCardData(_index),);
              },
              padding: EdgeInsets.all(getRecycleMapEdgePadding()),
              //physics: ScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}