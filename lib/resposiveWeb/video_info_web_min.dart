import 'dart:convert';
import 'dart:developer' as devtool show log;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_feed_example_test/video_first_container.dart';
import 'package:video_player/video_player.dart';

class VideoInfoWeb extends StatefulWidget {
  const VideoInfoWeb({super.key});

  @override
  State<VideoInfoWeb> createState() => _VideoInfoWebState();
}

class _VideoInfoWebState extends State<VideoInfoWeb> {
  bool _playView = false;
  List videoInfo = [];
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  int _isPlayingIndex = -1;
  //load data from videoInfo.json file
  void _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final width=MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Center(
        child: Container(margin:(width>1200) ?const EdgeInsets.symmetric(horizontal: 300):(width>900)?const EdgeInsets.symmetric(horizontal: 200):(width>650)? const EdgeInsets.symmetric(horizontal: 50):const EdgeInsets.symmetric(horizontal: 0),
        
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
                  margin: width<700? const EdgeInsets.only(bottom: 0):const EdgeInsets.only(bottom: 150),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
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
                          scrollDirection:(width<700)?Axis.vertical :Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          itemCount: videoInfo.length,
                          itemBuilder: (context, index) {
                            //widget of listView.builder
                            return Tooltip(
                              message: width<600?'':'SHIFT+Scroll mouse to scroll options',
                              child: GestureDetector(
                                  onTap: () => setState(() {
                                        _playView = true;
                                        _onTapVideo(index);
                                      }),
                                  child: _videoExercisesContainer(index, width)),
                            );
                          },
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
//List of video recommended
  _videoExercisesContainer(int index, double width) {
    
    final int dotsLength=(width <500 ?75 : 50);
    
    return SizedBox(
      width:width<600?200: 300,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(videoInfo[index]['thumbail']),),),
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
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Text(
                      '60s rest',
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                  ),
                ),
                Row(children: [
                  
                  for (int i = 1; i <  dotsLength; i++)
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
      ),
    );
  }
// Trigger the play button of video
  void _onTapVideo(int index) {
      _controller = VideoPlayerController.asset(videoInfo[index]["videoLocal"])
      ..initialize().then((_) {
        
        _isPlayingIndex = index;
        _controller.addListener(_onControllerUpdate);
        setState(() {
          _controller.play();
        });
      });
  }
//video section
  _videoPlayScreen() {
    return SafeArea(
      child: Container(
        height: 310,
        decoration: const BoxDecoration(
        ),
        child: Column(
          children: [ const SizedBox(height: 10,),
            SizedBox(
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
                          color: Colors.white,
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    const Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Colors.white,
                    ),  
                  ],
                ),
              ),
            ), 
           SizedBox(height: 200, child: _playVideoView(),) ,
            _controlVideoView(),
          ],
        ),
      ),
    );
  }
// video screen
  _playVideoView() {
    final controller = _controller;
    if (controller.value.isInitialized) {
      return AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller));
    } else {
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
//Control volume
  _controlVideoView() {
    final noMute = (_controller.value.volume) > 0;
    return SizedBox( 
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
                _controller.setVolume(0.5);
              }
              
              setState(() {});
              
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(blurRadius: 4, color: Colors.blue.shade400),
                  ],
                ),
                child: Icon(
                  !noMute ? Icons.volume_off : Icons.volume_up,
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
                Get.snackbar('', 'No more video are available',
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
                      'No more video are available',
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
                Get.snackbar('', '',
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
          const SizedBox(width: 50,)
          //Expanded(child: Container())
        ],
      ),
    );
  }
}
