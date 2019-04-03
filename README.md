# human_anatomy a Human Body part Selection package for Flutter

[![pub package](https://img.shields.io/pub/v/human_anatomy.svg)](https://pub.dartlang.org/packages/human_anatomy)

A Flutter package for iOS and Android for Selecting Human Body Part.
## Demo
<img src="http://sheikhsoft.com/screensort/human_anatomy.gif" width="340" height="640" title="Screen Shoot">


## Installation

First, add `human_anatomy` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Second, add assets folder at the root your project

Then Add the flowing line in your pubspec.yaml like other image file

assets:
    - assets/head.svg
    - assets/left_ear.svg
    - assets/right_ear.svg
    - assets/left_eye.svg
    - assets/right_eye.svg
    - assets/nose.svg
    - assets/mouth.svg
    - assets/neck.svg
    - assets/chest.svg
    - assets/abdomin.svg
    - assets/pelvis.svg
    - assets/publs.svg
    - assets/left_soulder.svg
    - assets/right_soulder.svg
    - assets/left_arm.svg
    - assets/right_arm.svg
    - assets/left_elbow.svg
    - assets/right_elbow.svg
    - assets/left_forearm.svg
    - assets/right_forearm.svg
    - assets/left_wrist.svg
    - assets/right_wrist.svg
    - assets/left_hand.svg
    - assets/right_hand.svg
    - assets/left_thigh.svg
    - assets/right_thigh.svg
    - assets/left_knee.svg
    - assets/right_knee.svg
    - assets/left_leg.svg
    - assets/right_leg.svg
    - assets/left_ankle.svg
    - assets/right_ankle.svg
    - assets/left_foot.svg
    - assets/right_foot.svg

### iOS

No configuration required - the plugin should work out of the box.
### Android

No configuration required - the plugin should work out of the box.

### Code for the human_anatomy widget

``` dart
import 'package:human_anatomy/human_anatomy.dart';


class HumanAnatomyPage extends StatelessWidget {
  var _finalBodyPartList = [];
 
  @override
  Widget build(BuildContext context) {
    return HumanAnatomy(
    onChanged: bodyPartList,
    );
  }
  void bodyPartList(List value) {
      _finalBodyPartList = value;
    }
}
```

### Code for the Full page Human Anatomy widget

``` dart
import 'package:human_anatomy/full_page_human_anatomy.dart';

class FullPageHumanBody extends StatelessWidget {
  final Map mapData;
  const FullPageHumanBody({Key key, this.mapData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FullPageHumanAnatomy(      
      mapData: mapData,
      title: "Where it is?",
      route: "/fifth",
    );
  }
}
```
