import 'package:flutter/material.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(5.0, 5.0),
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
        gradient: LinearGradient(colors: [
          Colors.red.shade900.withOpacity(0.9),
          Colors.blueAccent.shade200.withOpacity(0.8),
        ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(80.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Next workout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              )),
          const Text(
            '+Legs Toning ',
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.timer_outlined,
                size: 20.0,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                '60min',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueAccent.shade700.withOpacity(0.75),
                          offset: const Offset(2, 6),
                          blurRadius: 10.0)
                    ]),
                child: const Icon(
                  Icons.play_circle_fill,
                  size: 60.0,
                  color: Colors.white,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
