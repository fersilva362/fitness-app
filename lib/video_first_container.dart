import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoFirstContainer extends StatelessWidget {
  const VideoFirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.white,
                ),
              ), 
              Expanded(
                child: Container(),
              ),
               const Icon(
                Icons.circle_outlined,
                size: 20,
                color: Colors.white,
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
            'and Abs Workout ',
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
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.red.shade900.withOpacity(0.5),
                      Colors.blueAccent.shade200.withOpacity(0.5),
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
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
                    gradient: LinearGradient(colors: [
                      Colors.red.shade900.withOpacity(0.5),
                      Colors.blueAccent.shade200.withOpacity(0.5),
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
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
    );
  }
}
