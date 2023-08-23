import 'dart:convert';
import 'dart:developer' as devtool show log;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [
    {
      "title": "Squat and Walk",
      "time": "45 seconds",
      "thumbail": "assets/images/arm.png",
      "videUrl": "https://www.youtube.com/watch?v=aclHkVaku9U"
    },
    {
      "title": "Sexecrcise",
      "time": "65 seconds",
      "thumbail": "assets/images/abs.png",
      "videUrl": "https://www.youtube.com/watch?v=OXQ5ee6p9ZA"
    }
  ];
  void _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      videoInfo = jsonDecode(value);
      devtool.log(videoInfo.toString());
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    devtool.log(videoInfo.length.toString());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red.shade900.withOpacity(0.9),
            Colors.blueAccent.shade200.withOpacity(0.8),
          ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight),
        ),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Icon(
                      Icons.circle_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Legs Toning ',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'and Glutes Workout ',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Colors.red.shade900.withOpacity(0.5),
                                Colors.blueAccent.shade200.withOpacity(0.5),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '60 min',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Colors.red.shade900.withOpacity(0.5),
                                Colors.blueAccent.shade200.withOpacity(0.5),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.handyman_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Resistant band, Kettlebelt',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        'Circuit 1- Leg Tonning',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Expanded(child: Container()),
                      const Row(
                        children: [
                          Icon(
                            Icons.loop_outlined,
                            size: 30,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '3 steps',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      itemCount: videoInfo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => devtool.log('click'),
                          child: Container(
                            height: 135,
                            width: 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(videoInfo[index]
                                                  ['thumbail']))),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          videoInfo[index]['title'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(videoInfo[index]['time'])
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '15s rest',
                                          style: TextStyle(
                                              color: Colors.grey.shade900),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
