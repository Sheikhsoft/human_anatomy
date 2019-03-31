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
            bodyPart("assets/head.svg", "Head", 0.0, 0.0, 0.0, 70.0),
            bodyPart("assets/left_ear.svg", "leftEar", 32.0, 50.0, 0.0, 20.0),
            bodyPart("assets/right_ear.svg", "rightEar", 32.0, 0.0, 50.0, 20.0),
            bodyPart("assets/left_eye.svg", "LeftEye", 22.0, 20.0, 0.0, 10.0),
            bodyPart("assets/right_eye.svg", "rightEye", 22.0, 0.0, 20.0, 10.0),
            bodyPart("assets/nose.svg", "Nose", 25.0, 0.0, 0.0, 20.0),
            bodyPart("assets/mouth.svg", "Mouth", 48.0, 0.0, 0.0, 10.0),
            bodyPart("assets/neck.svg", "Neck", 58.0, 0.0, 0.0, 40.0),
            bodyPart("assets/chest.svg", "Chest", 93.0, 0.0, 0.0, 95.0),
            bodyPart("assets/abdomin.svg", "Abdomin", 175.0, 0.0, 0.0, 65.0),
            bodyPart("assets/pelvis.svg", "Pelvis", 225.0, 0.0, 0.0, 50.0),
            bodyPart("assets/publs.svg", "Publs", 275.0, 0.0, 0.0, 15.0),
            bodyPart("assets/left_soulder.svg", "leftSoulder", 90.0, 105.0, 0.0,
                50.0),
            bodyPart("assets/right_soulder.svg", "rightSoulder", 89.0, 0.0,
                110.0, 50.0),
            bodyPart("assets/left_arm.svg", "leftArm", 120.0, 145.0, 0.0, 70.0),
            bodyPart(
                "assets/right_arm.svg", "rightArm", 118.0, 0.0, 142.0, 70.0),
            bodyPart(
                "assets/left_elbow.svg", "leftElbow", 172.0, 172.0, 0.0, 39.0),
            bodyPart("assets/right_elbow.svg", "rightElbow", 170.0, 0.0, 170.0,
                40.0),
            bodyPart("assets/left_forearm.svg", "leftForearm", 195.0, 190.0,
                0.0, 54.0),
            bodyPart("assets/right_forearm.svg", "rightForearm", 195.0, 0.0,
                190.0, 54.0),
            bodyPart(
                "assets/left_wrist.svg", "leftWrist", 238.0, 220.0, 0.0, 23.0),
            bodyPart("assets/right_wrist.svg", "rightWrist", 238.0, 0.0, 220.0,
                23.0),
            bodyPart(
                "assets/left_hand.svg", "leftHand", 250.0, 250.0, 0.0, 60.0),
            bodyPart(
                "assets/right_hand.svg", "rightHand", 250.0, 0.0, 250.0, 60.0),
            bodyPart(
                "assets/left_thigh.svg", "leftThigh", 242.0, 63.0, 0.0, 138.0),
            bodyPart("assets/right_thigh.svg", "rightThigh", 242.0, 0.0, 63.0,
                138.0),
            bodyPart(
                "assets/left_knee.svg", "leftKnee", 360.0, 68.0, 0.0, 48.0),
            bodyPart(
                "assets/right_knee.svg", "rightKnee", 360.0, 0.0, 68.0, 48.0),
            bodyPart("assets/left_leg.svg", "leftLeg", 395.0, 64.0, 0.0, 105.0),
            bodyPart(
                "assets/right_leg.svg", "rightLeg", 393.0, 0.0, 65.0, 106.0),
            bodyPart(
                "assets/left_ankle.svg", "leftAnkle", 495.0, 64.0, 0.0, 25.0),
            bodyPart(
                "assets/right_ankle.svg", "rightAnkle", 493.0, 0.0, 68.0, 25.0),
            bodyPart(
                "assets/left_foot.svg", "leftFoot", 510.0, 80.0, 0.0, 60.0),
            bodyPart(
                "assets/right_foot.svg", "rightFoot", 508.0, 0.0, 83.0, 56.0),
          ],
        ),
      ),
    );
  }

  Widget bodyPart(String svgPath, String svgName, double marginTop,
      double marginRight, double marginLeft, double height) {
    Color _svgColor = _bodyPartList.contains(svgName) ? Colors.redAccent : null;
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
}
