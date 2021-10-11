import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/myColors.dart';
import 'dart:convert';
// import 'dart:developer';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List<Videourl> collectionOfVideos = [];
  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  initData() {
    DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      List<dynamic> res = json.decode(value);

      res.forEach((element) {
        Videourl refinedData = Videourl.fromJson(element);
        setState(() => collectionOfVideos.add(refinedData));
      });

      // inspect(collectionOfVideos);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  AppColor.secondPageContainerGradient1stColor,
                                  AppColor.secondPageContainerGradient2ndColor
                                ])),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 250,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Resistant band, Kettlebell',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  AppColor.secondPageContainerGradient1stColor,
                                  AppColor.secondPageContainerGradient2ndColor
                                ])),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.circuitsColor),
                        ),
                      ),
                      Row(children: [
                        Icon(
                          Icons.loop,
                          size: 30,
                          color: AppColor.loopColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('3 sets',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.setsColor,
                            )),
                      ]),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
            ))
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const FractionalOffset(0, 0.4),
                end: Alignment.topRight,
                colors: [
              AppColor.gradientFirst.withOpacity(0.8),
              AppColor.gradientSecond.withOpacity(0.9)
            ])),
      ),
    );
  }
}

class Videourl {
  final String title;
  final String time;
  final String thumbnail;
  final String videoUrl;

  const Videourl(
      {required this.title,
      required this.time,
      required this.thumbnail,
      required this.videoUrl});

  static Videourl copyWith(
      String title, String time, String thumbnail, String videoUrl) {
    return Videourl(
        title: title, time: time, thumbnail: thumbnail, videoUrl: videoUrl);
  }

  static Videourl fromJson(Map<String, dynamic> json) {
    String title = json['title'];
    String time = json['time'];
    String thumbnail = json['thumbnail'];
    String videoUrl = json['videoUrl'];

    Videourl data = copyWith(title, time, thumbnail, videoUrl);
    return data;
  }
}
