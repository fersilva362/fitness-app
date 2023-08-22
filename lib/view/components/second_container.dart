import 'package:flutter/material.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 30.0,
                    color: Colors.grey.withOpacity(0.8),
                    offset: const Offset(10.0, 10.0)),
                BoxShadow(
                    blurRadius: 30.0,
                    color: Colors.grey.withOpacity(0.8),
                    offset: const Offset(-5.0, -5.0))
              ],
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/card22.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(right: 220.0, left: 10, bottom: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/man.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(
              left: 150,
              top: 40,
              bottom: 10,
              right: 20,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'You are doing great',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 5),
              RichText(
                text: const TextSpan(
                    text: 'Keep it up\n',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    children: [
                      TextSpan(
                          text: 'Stick to your plan',
                          style: TextStyle(fontSize: 16, color: Colors.black87))
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
