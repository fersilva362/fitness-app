import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_feed_example_test/view/components/homepage/first_container.dart';
import 'package:stream_feed_example_test/view/components/video_info.dart';

import 'components/homepage/second_container.dart';
import 'components/homepage/third_container_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Training ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.calendar_month,
                    size: 20.0,
                    color: Colors.black54,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                    color: Colors.black54,
                  )
                ],
              ),

              Row(
                children: [
                  const Text(
                    'Your program',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const VideoInfo()),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 20.0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const FirstContainer(),
              const SizedBox(
                height: 10.0,
              ),
              // ignore: sized_box_for_whitespace
              const SecondContainer(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Area of focus',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const ThirdContainer()
            ],
          ),
        ),
      ),
    );
  }
}
