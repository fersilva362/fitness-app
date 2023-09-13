import 'package:flutter/material.dart';
//container that handle area focus options
class ThirdContainerMin extends StatelessWidget {
  final List info;
  const ThirdContainerMin({super.key, required this.info, required this.width});
final double width;
  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: ListView.builder( scrollDirection:width<600? Axis.vertical: Axis.horizontal,
        itemCount: (width<600)? (info.length.toDouble() ~/ 2).toInt():info.length,
        itemBuilder: (context, index) {
          int a = 2 * index;
          int b = 2 * index + 1;
          if(width<600) {return ScrollViewVertical(info: info, a: a, b: b);}
          else {return ScrollViewHorizontal(info: info, a: index, width: width,); }
        },
      ),
    );
  }
}
// Change to vertical scroll view if width<600

class ScrollViewVertical extends StatelessWidget {
  const ScrollViewVertical({
    super.key,
    required this.info,
    required this.a,
    required this.b,
  });

  final List info;
  final int a;
  final int b;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardExercise(info: info, a: a),CardExercise(info: info, a: b),
         ],
    );
  }
}
// Change to vertical scroll view if width>600
class ScrollViewHorizontal extends StatelessWidget {
  const ScrollViewHorizontal({
    required this.info,
    required this.a,
    super.key, required this.width,
  }); 
final List info;
  final int a;final double width;
  @override
  Widget build(BuildContext context) {
    return Tooltip(message: width<600?'':'SHIFT+Scroll mouse to scroll options',
      child: Column( 
        children: [
          CardExercise(info: info, a: a)
         
        ],
      ),
    );
  }
}

class CardExercise extends StatelessWidget {
  const CardExercise({
    super.key,
    required this.info,
    required this.a,
  });

  final List info;
  final int a;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: (470) / 2,
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
        
      ),
    );
  }
}
