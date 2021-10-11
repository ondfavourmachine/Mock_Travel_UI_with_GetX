import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/myColors.dart';
import 'package:training_app/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Info> info = [];
  @override
  void initState() {
    _initializeData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _initializeData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      var data = json.decode(value);

      (data as List<dynamic>).forEach((element) {
        Info castedEle = Info.fromJson(element);
        setState(() {
          info.add(castedEle);
        });
      });
      inspect(info);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.homePageBackground,
        body: Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Training',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColor.homePageTitle),
                      ),
                    ),
                    // Expanded(child: Container()),
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: AppColor.homePageIcons,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: AppColor.homePageIcons,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: AppColor.homePageIcons,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Your Program',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColor.homePageSubtitle),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const VideoInfo()),
                      child: Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 20, color: AppColor.homePageDetail),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: AppColor.homePageIcons,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next workout',
                          style: TextStyle(
                              color: AppColor.homePageContainerTextSmall,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.homePageContainerTextSmall),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.homePageContainerTextSmall),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color:
                                          AppColor.homePageContainerTextSmall,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '60 mins',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor
                                              .homePageContainerTextSmall),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(4, 8),
                                          color: AppColor.gradientFirst,
                                          blurRadius: 10)
                                    ]),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            blurRadius: 20,
                            color: AppColor.gradientSecond.withOpacity(0.2))
                      ],
                      gradient: LinearGradient(
                          colors: [
                            AppColor.gradientFirst.withOpacity(0.8),
                            AppColor.gradientSecond.withOpacity(0.9)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(75),
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 180,
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(8, 10),
                                  blurRadius: 40,
                                  color:
                                      AppColor.gradientSecond.withOpacity(0.3)),
                              BoxShadow(
                                  offset: Offset(-1, -5),
                                  blurRadius: 10,
                                  color:
                                      AppColor.gradientSecond.withOpacity(0.3))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/card.jpg'))),
                      ),
                      Positioned(
                        // top: -40,
                        left: 0,
                        bottom: 40,
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2,
                          // margin: const EdgeInsets.only(right: 200, bottom: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  // fit: BoxFit.fitHeight,
                                  image: AssetImage('assets/figure.png'))),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: -30,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You are doing great',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.homePageDetail),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'Keep It Up\n',
                                    style: TextStyle(
                                        color: AppColor.homePagePlanColor,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: 'Stick to your plan',
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Area of Focus',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.homePageTitle,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Expanded(
                    child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15),
                  children: [
                    ...info
                        .map((e) => Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 200,
                              height: 170,
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.homePageDetail),
                                ),
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(5, 5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    ),
                                    BoxShadow(
                                      offset: Offset(-5, -5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(e.img))),
                            ))
                        .toList()
                  ],
                ))
              ],
            )));
  }
}

class Info {
  final String title;
  final String img;

  const Info({
    required this.title,
    required this.img,
  });

  static Info copyWith(String title, String img) {
    return Info(title: title, img: img);
  }

  static Info fromJson(Map<String, dynamic> json) {
    var title = json['title'];
    var img = json['img'];

    Info data = copyWith(title, img);
    return data;
  }
}
