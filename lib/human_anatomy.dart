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
  List<String> _bodyPartList = [];
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
      width: 340,
      height: 557,
        child: Stack(
          children: <Widget>[
            bodyPart("head.svg", 0, 0, 0, 70),
            bodyPart("left_ear.svg", 32, 50, 0, 20),
            bodyPart("right_ear.svg", 32, 0, 50, 20),
            bodyPart("left_eye.svg", 22, 20, 0, 10),
            bodyPart("right_eye.svg", 22, 0, 20, 10),
            bodyPart("nose.svg",  25, 0, 0, 20),
            bodyPart("mouth.svg", 48, 0, 0, 10),
            bodyPart("neck.svg", 58, 0, 0, 40),
            bodyPart("chest.svg", 93, 0, 0, 95),
            bodyPart("abdomin.svg", 175, 0, 0, 65),
            bodyPart("pelvis.svg", 225, 0, 0, 50),
            bodyPart("publs.svg", 275, 0, 0, 15),
            bodyPart("left_soulder.svg", 90, 105, 0, 50),
            bodyPart("right_soulder.svg", 89, 0, 110, 50),
            bodyPart("left_arm.svg", 120, 145, 0, 70),
            bodyPart("right_arm.svg", 118, 0, 142, 70),
            bodyPart("left_elbow.svg", 172, 172, 0, 39),
            bodyPart("right_elbow.svg", 170, 0, 170, 40),
            bodyPart("left_forearm.svg", 195, 190, 0, 54),
            bodyPart("right_forearm.svg", 195, 0, 190, 54),
            bodyPart("left_wrist.svg", 238, 220, 0, 23),
            bodyPart("right_wrist.svg", 238, 0, 220, 23),
            bodyPart("left_hand.svg", 250, 250, 0, 60),
            bodyPart("right_hand.svg", 250, 0, 250, 60),
            bodyPart("left_thigh.svg", 242, 63, 0, 138),
            bodyPart("right_thigh.svg", 242, 0, 63, 138),
            bodyPart("left_knee.svg", 360, 68, 0, 48),
            bodyPart("right_knee.svg", 360, 0, 68, 48),
            bodyPart("left_leg.svg", 395, 64, 0, 105),
            bodyPart("right_leg.svg", 393, 0, 65, 106),
            bodyPart("left_ankle.svg", 495, 64, 0, 25),
            bodyPart("right_ankle.svg", 493, 0, 68, 25),
            bodyPart("left_foot.svg", 510, 80, 0, 60),
            bodyPart("right_foot.svg", 508, 0, 83, 56),
          ],
        ),
    );
  }
  // Added Color Control ,  prepend Directory To Images And No Need To Add SvgName Auto Added
  Widget bodyPart(String svgPath, double marginTop, double marginRight, double marginLeft, double height , {   bool addAssetsImages : true , String svgName : '' , Color svgTouchColor : Colors.redAccent }) {
    Color _svgColor = _bodyPartList.contains(svgName) ? svgTouchColor: null;
   // Auto Generate svgName
    if(addAssetsImages && svgName == '' ) {
      List svgNameP = svgPath.split('_');
      String svgNameP1 = svgNameP[0];
      if(svgNameP.length == 1 ){
        svgName = _firstLetterUpperCase(svgNameP1.split('.')[0]);
      }else{
        svgName = _firstLetterUpperCase(svgNameP1) + _firstLetterUpperCase(svgNameP[1].split('.')[0]);
      }
    }
    // If You Want To Change Directory Of Images You Can Edit this Line
    svgPath = addAssetsImages ? 'assets/images-human-anatomy/' + svgPath : svgPath;

    final Widget bodyPartSvg = new SvgPicture.asset(svgPath, semanticsLabel: svgName, color: _svgColor);
    return Container(
      margin: EdgeInsets.only(top: marginTop, right: marginRight, left: marginLeft),
      height: height,
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            setState(() {
              (_bodyPartList.contains(svgName)) ? _bodyPartList.remove(svgName) : _bodyPartList.add(svgName);
                // _bodyPartList.forEach((e) => print(e));   // You Can Get List Of Part List Selected Here And Send to Another Page Or Etc ...
            });
          },
          child: bodyPartSvg),
    );
  }
  void _publishSelection(List _bodyPartList) => (widget.onChanged != null) ? widget.onChanged(_bodyPartList) : null;
  String _firstLetterUpperCase(String s) => '${s[0].toUpperCase()}${s.substring(1)}';
}
