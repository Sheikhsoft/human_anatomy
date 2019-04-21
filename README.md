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
- assets/images-human-anatomy/

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
