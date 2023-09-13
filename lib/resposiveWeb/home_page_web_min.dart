import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_feed_example_test/resposiveWeb/homepageWeb/first_container.dart';
import 'package:stream_feed_example_test/resposiveWeb/video_info_web_min.dart';
import 'homepageWeb/second_container_web.dart';
import 'homepageWeb/third_container_list_view.dart';

class HomePageWebMin extends StatefulWidget {
  const HomePageWebMin({super.key});

  @override
  State<HomePageWebMin> createState() => _HomePageWebMinState();
}

class _HomePageWebMinState extends State<HomePageWebMin> {
  //Define a variable to store data from a json file
  List info=[];
  // function to get data from json file
void _getInfo() async{
    await DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) {
      setState(() {
        info = jsonDecode(value);
      });     
    });
}
  @override
  void initState() {
    _getInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: width<800?SmallScreen(info: info, width: width,): WideScreen(info: info, width: width,),
      )
    );
  } 
}

//Widget used in wide screen i.e. w>800

class WideScreen extends StatelessWidget {
  const WideScreen({
    super.key,
    required this.info, required this.width, 
  });
  final List info;
  final double width;
  @override
  Widget build(BuildContext context) {
    
    return Center(
        child: Container( margin: width>1200?const EdgeInsets.symmetric(horizontal: 300): width>950? const EdgeInsets.symmetric(horizontal: 200):const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
               ColumnHomePage(width: width,),
              ThirdContainerMin(info: info, width: width,),
            ],
          ),
        ),);
  }
}
// Widget of the first middle page up to Area of focus 

class ColumnHomePage extends StatelessWidget {
  const ColumnHomePage({
    super.key, required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //headline
          Row( children: [
      const Text(
        'Training ',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      Expanded(child: Container()),
      const Icon(
        Icons.arrow_back_ios,
        size: 20.0,
        color: Colors.black54,
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
    ], ),
          
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
        onTap: () => Get.to(() => const VideoInfoWeb()),
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
          //Next workout container
          const FirstContainer(),
          const SizedBox(
    height: 10.0,
          ),
          
          //area You are doing Great! Container
          SecondContainerWeb(width: width,),
          const SizedBox(
    height: 10,
          ), const Row(
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
        ],
      );
  }
}
//Widget used in wide screen i.e. w<800
class SmallScreen extends StatelessWidget {
  const SmallScreen({
    super.key,
    required this.info, required this.width,
    
  });
  final List info; 
final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         ColumnHomePage(width: width,),ThirdContainerMin(info: info, width: width,),
      ],
    );
  }
}
