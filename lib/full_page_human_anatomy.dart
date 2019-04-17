library human_anatomy;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:human_anatomy/utils.dart';

import 'package:human_anatomy/human_anatomy.dart';

class FullPageHumanAnatomy extends StatelessWidget {
  List<String> _finalBodyPartList = [];
  final Map mapData;
  final Widget container;
  final String title;
  final String route;

  FullPageHumanAnatomy(
      {Key key, this.mapData, this.container, this.title, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(mapData);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            container != null ? container : Container(),
            TopTitle(
              topMargin: 80.0,
              leftMargin: 50.0,
              title: title,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              child: HumanAnatomy(
                onChanged: bodyPartList,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.black87,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  mapData['bodyPart'] = _finalBodyPartList.toString();

                  _finalBodyPartList.length == 0
                      ? Utils().showMyDialog(
                          context, "Please Select Affected Body Part")
                      : Navigator.pushNamed(context, route, arguments: mapData);
                },
              ),
            ),
            MyBackButton(),
          ],
        ),
      ),
    );
  }

  void bodyPartList(List value) {
    _finalBodyPartList = value;
  }
}
