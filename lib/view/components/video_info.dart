import 'dart:convert';
import 'dart:developer' as devtool show log;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'videopage/video_first_container.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playView = false;
  List videoInfo = [];

  late VideoPlayerController _controller;

  // ignore: prefer_final_fields
  bool _isPlaying = false;

  int _isPlayingIndex = -1;
  void _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
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
    devtool.log(_isPlayingIndex.toString());
    return Scaffold(
      body: Container(
        decoration: !_playView
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.red.shade900.withOpacity(0.9),
                      Colors.blueAccent.shade200.withOpacity(0.8),
                    ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight),
              )
            : BoxDecoration(
                color: Colors.blueAccent.shade200.withOpacity(0.8),
              ),
        child: Column(children: [
          !_playView ? const VideoFirstContainer() : _videoPlayScreen(),
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
                            onTap: () => setState(() {
                                  _playView = true;
                                  _onTapVideo(index);
                                }),
                            child: _videoGestureContainer(index));
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

  _videoGestureContainer(int index) {
    return Container(
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
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(videoInfo[index]['thumbail']))),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(color: Colors.grey.shade900),
                  ),
                ),
              ),
              Row(children: [
                for (int i = 0; i < 100; i++)
                  i.isEven
                      ? Container(
                          height: 1,
                          width: 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                        )
                      : Container(
                          height: 1,
                          width: 3,
                          color: Colors.white,
                        )
              ])
            ],
          )
        ],
      ),
    );
  }

  void _onTapVideo(int index) {
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(videoInfo[index]['videoUrl']))
      //_controller = VideoPlayerController.asset('assets\videos\bee.mp4')
      ..initialize().then((_) {
        _isPlayingIndex = index;
        _controller.addListener(_onControllerUpdate);
        setState(() {
          _controller.play();
        });
      });
  }

  _videoPlayScreen() {
    return SafeArea(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade200.withOpacity(0.8),
        ),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.grey,
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    const Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            _playVideoView(),
            _controlVideoView(),
          ],
        ),
      ),
    );
  }

  _playVideoView() {
    final controller = _controller;
    if (controller.value.isInitialized) {
      return AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller));
    } else {
      devtool.log('controller is ${_controller.toString()}');
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            'It is loading...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  _onControllerUpdate() {
    final controller = _controller;
    if (!controller.value.isInitialized) {
      return;
    }
    final isPlaying = controller.value.isPlaying;
    _isPlaying = isPlaying;
  }

  _controlVideoView() {
    final noMute = (_controller.value.volume) > 0;
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (noMute) {
                _controller.setVolume(0);
              } else {
                _controller.setVolume(1);
              }
              devtool.log(noMute.toString());
              setState(() {});
              devtool.log(noMute.toString());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(blurRadius: 4, color: Colors.blue.shade400),
                  ],
                ),
                child: Icon(
                  noMute ? Icons.volume_off : Icons.volume_up,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final prevIndex = _isPlayingIndex - 1;

              if (prevIndex < 0) {
                Get.snackbar('', 'no more video are available',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.blue.shade300,
                    colorText: Colors.black,
                    icon: const Icon(
                      Icons.face,
                      size: 26,
                      color: Colors.black87,
                    ),
                    titleText: const Text(
                      'Video',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    messageText: const Text(
                      'no more video are available',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ));
              } else {
                _onTapVideo(prevIndex);
              }
            },
            child: const Icon(
              Icons.fast_rewind_outlined,
              size: 36,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                await _controller.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                await _controller.play();
              }
            },
            child: Icon(
              !_isPlaying
                  ? Icons.play_arrow_outlined
                  : Icons.pause_circle_outline,
              size: 36,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              final nextIndex = _isPlayingIndex + 1;
              devtool.log(nextIndex.toString());

              if (nextIndex >= videoInfo.length) {
                Get.snackbar('', 'no more video are available',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.blue.shade300,
                    colorText: Colors.black,
                    icon: const Icon(
                      Icons.face,
                      size: 26,
                      color: Colors.black87,
                    ),
                    titleText: const Text(
                      'Video',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    messageText: const Text(
                      'no more video are available',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ));
              } else {
                _onTapVideo(nextIndex);
              }
            },
            child: const Icon(
              Icons.fast_forward_outlined,
              size: 36,
              color: Colors.white,
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
