import 'package:flutter/material.dart';

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List info = [
      {"title": "glutes", "img": "assets/images/gluteo.png"},
      {"title": "arm", "img": "assets/images/arm.png"},
      {"title": "abs", "img": "assets/images/abs.png"},
      {"title": "arm", "img": "assets/images/arm.png"}
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: (info.length.toDouble() ~/ 2).toInt(),
        itemBuilder: (context, index) {
          int a = 2 * index;
          int b = 2 * index + 1;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 150,
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(3, 3),
                          color: Colors.grey,
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-3, -3),
                          color: Colors.grey,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(info[a]["img"]))),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      //info[a]["title"]
                      '',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 150,
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(3, 3),
                          color: Colors.grey,
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-3, -3),
                          color: Colors.grey,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(info[b]["img"]))),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '',
                      //info[b]["title"],
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
