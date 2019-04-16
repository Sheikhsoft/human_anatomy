library human_anatomy;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HumanAnatomy extends StatefulWidget {
  final ValueChanged<List> onChanged;

  const HumanAnatomy({Key key, this.onChanged}) : super(key: key);
  @override
  _HumanAnatomyState createState() => new _HumanAnatomyState();
}

class _HumanAnatomyState extends State<HumanAnatomy> {
  var _bodyPartList = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      _publishSelection(_bodyPartList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return humanAnatomy();
  }

  Widget humanAnatomy() {
    return Container(
      width: 340.0,
      height: 557,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            bodyPart("head.svg", 0.0, 0.0, 0.0, 70.0),
            bodyPart("left_ear.svg", 32.0, 50.0, 0.0, 20.0),
            bodyPart("right_ear.svg", 32.0, 0.0, 50.0, 20.0),
            bodyPart("left_eye.svg", 22.0, 20.0, 0.0, 10.0),
            bodyPart("right_eye.svg", 22.0, 0.0, 20.0, 10.0),
            bodyPart("nose.svg",  25.0, 0.0, 0.0, 20.0),
            bodyPart("mouth.svg", 48.0, 0.0, 0.0, 10.0),
            bodyPart("neck.svg", 58.0, 0.0, 0.0, 40.0),
            bodyPart("chest.svg", 93.0, 0.0, 0.0, 95.0),
            bodyPart("abdomin.svg", 175.0, 0.0, 0.0, 65.0),
            bodyPart("pelvis.svg", 225.0, 0.0, 0.0, 50.0),
            bodyPart("publs.svg", 275.0, 0.0, 0.0, 15.0),
            bodyPart("left_soulder.svg", 90.0, 105.0, 0.0, 50.0),
            bodyPart("right_soulder.svg", 89.0, 0.0, 110.0, 50.0),
            bodyPart("left_arm.svg", 120.0, 145.0, 0.0, 70.0),
            bodyPart("right_arm.svg", 118.0, 0.0, 142.0, 70.0),
            bodyPart("left_elbow.svg", 172.0, 172.0, 0.0, 39.0),
            bodyPart("right_elbow.svg", 170.0, 0.0, 170.0, 40.0),
            bodyPart("left_forearm.svg", 195.0, 190.0, 0.0, 54.0),
            bodyPart("right_forearm.svg", 195.0, 0.0, 190.0, 54.0),
            bodyPart("left_wrist.svg", 238.0, 220.0, 0.0, 23.0),
            bodyPart("right_wrist.svg", 238.0, 0.0, 220.0, 23.0),
            bodyPart("left_hand.svg", 250.0, 250.0, 0.0, 60.0),
            bodyPart("right_hand.svg", 250.0, 0.0, 250.0, 60.0),
            bodyPart("left_thigh.svg", 242.0, 63.0, 0.0, 138.0),
            bodyPart("right_thigh.svg", 242.0, 0.0, 63.0, 138.0),
            bodyPart("left_knee.svg", 360.0, 68.0, 0.0, 48.0),
            bodyPart("right_knee.svg", 360.0, 0.0, 68.0, 48.0),
            bodyPart("left_leg.svg", 395.0, 64.0, 0.0, 105.0),
            bodyPart("right_leg.svg", 393.0, 0.0, 65.0, 106.0),
            bodyPart("left_ankle.svg", 495.0, 64.0, 0.0, 25.0),
            bodyPart("right_ankle.svg", 493.0, 0.0, 68.0, 25.0),
            bodyPart("left_foot.svg", 510.0, 80.0, 0.0, 60.0),
            bodyPart("right_foot.svg", 508.0, 0.0, 83.0, 56.0),
          ],
        ),
      ),
    );
  }
  // Added Color Control ,  prepend Directory To Images And No Need To Add SvgName Auto Added
  Widget bodyPart(String svgPath, double marginTop,
      double marginRight, double marginLeft, double height , {   bool addAssetsImages : true , String svgName : '' , Color svgTouchColor : Colors.redAccent }) {
    Color _svgColor = _bodyPartList.contains(svgName) ? svgTouchColor: null;
   // Auto Generate svgName
    if(addAssetsImages && svgName == '' ) {
      List svgNameP = svgPath.split('_');
      String svgNameP1 = svgNameP[0];
      if(svgNameP.length == 1 ){
        String svgNameP2 = svgNameP1.split('.')[0];
        svgName = _firstLetterUpperCase(svgNameP2);
      }else{
        String svgNameP2 = svgNameP[1].split('.')[0];
        svgName = _firstLetterUpperCase(svgNameP1) + _firstLetterUpperCase(svgNameP2);
      }
    }
    // If You Want To Change Directory Of Images You Can Edit this Line
    svgPath = addAssetsImages ? 'assets/images-human-anatomy/' + svgPath : svgPath;

    final Widget bodyPartSvg = new SvgPicture.asset(svgPath,
        semanticsLabel: svgName, color: _svgColor);
    return Container(
      margin:
          EdgeInsets.only(top: marginTop, right: marginRight, left: marginLeft),
      height: height,
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            setState(() {
              if (_bodyPartList.contains(svgName)) {
                _bodyPartList.remove(svgName);
              } else {
                _bodyPartList.add(svgName);
                // _bodyPartList.forEach((e) => print(e));
              }
              // You Can Get List Of Part List Selected Here And Send to Another Page Or Etc ...
            });
          },
          child: bodyPartSvg),
    );
  }

  void _publishSelection(List _bodyPartList) {
    if (widget.onChanged != null) {
      widget.onChanged(_bodyPartList);
    }
  }
  String _firstLetterUpperCase(String s) => '${s[0].toUpperCase()}${s.substring(1)}';
}
