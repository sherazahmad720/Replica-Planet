// import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];

  bool _isPlaying = true;
  GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: CarouselSlider.builder(
              key: _sliderKey,
              unlimitedMode: true,
              slideBuilder: (index) {
                return Container(
                  alignment: Alignment.center,
                  color: colors[index],
                  child: Text(
                    letters[index],
                    style: TextStyle(fontSize: 200, color: Colors.white),
                  ),
                );
              },
              slideTransform: CubeTransform(rotationAngle: 0),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(top: 32),
              ),
              itemCount: colors.length),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 32),
        //   child: Align(
        //     child: ConstrainedBox(
        //       constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           IconButton(
        //             iconSize: 48,
        //             icon: Icon(Icons.skip_previous),
        //             onPressed: () {
        //               _sliderKey.currentState.previousPage();
        //             },
        //           ),
        //           IconButton(
        //             iconSize: 64,
        //             icon: Icon(
        //               _isPlaying
        //                   ? Icons.pause_circle_outline
        //                   : Icons.play_circle_outline,
        //             ),
        //             onPressed: () {
        //               setState(
        //                 () {
        //                   _isPlaying = !_isPlaying;
        //                   _sliderKey.currentState.setPlaying(_isPlaying);
        //                 },
        //               );
        //             },
        //           ),
        //           IconButton(
        //             iconSize: 48,
        //             icon: Icon(Icons.skip_next),
        //             onPressed: () {
        //               _sliderKey.currentState.nextPage();
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

// class BannerSlider extends StatefulWidget {
//   @override
//   _BannerSliderState createState() => _BannerSliderState();
// }

// class _BannerSliderState extends State<BannerSlider> {
//   final List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.indigo,
//     Colors.purple,
//   ];
//   final List<String> letters = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//   ];

//   bool _isPlaying = false;
//   GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: 300,
//       child: CarouselSlider.builder(
//         itemCount: colors.length,
//         slideBuilder: (index) ) {
//           return Container(
//               height: 300,
//               width: 300,
//               child: Image.asset("assets/images/$index.png"));
//         },
//         options: CarouselOptions(
//           aspectRatio: 2.0,
//           enlargeCenterPage: true,
//           autoPlay: true,
//         ),
//       ),
//     );
//   }
// }

// class BannerSlider extends StatefulWidget {
//   @override
//   _BannerSliderState createState() => _BannerSliderState();
// }

// class _BannerSliderState extends State<BannerSlider> {
//   Future getSlideFromDb() async {
//     var fireStore = FirebaseFirestore.instance;
//     QuerySnapshot qn = await fireStore.collection('Slider').get();
//     return qn.docs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: FutureBuilder(
//         future: getSlideFromDb(),
//         builder: (_, snapshot) {
//           return snapshot.data == null
//               ? Container()
//               : CarouselSlider.builder(
//                   slideBuilder: (index) {
//                     DocumentSnapshot sliderImage = snapshot.data[index];
//                     Map getImage = sliderImage.data();
//                     return Container(
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.fill,
//                               image: NetworkImage(getImage['image']))),
//                     );
//                   },
//                   slideTransform: CubeTransform(
//                     rotationAngle: 0,
//                   ),
//                   enableAutoSlider: true,
//                   unlimitedMode: true,
//                   slideIndicator: CircularSlideIndicator(
//                     indicatorRadius: 3,
//                     itemSpacing: 10,
//                     currentIndicatorColor: Colors.white,
//                     indicatorBackgroundColor: Colors.grey,
//                   ),
//                   itemCount: snapshot.data.length);
//         },
//       ),
//     );
//   }
// }
