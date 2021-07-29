import 'package:flutter/material.dart';

class ProgressCircle extends StatefulWidget {
  @override
  ProgressCircleState createState() => ProgressCircleState();
}

class ProgressCircleState extends State<ProgressCircle> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.redAccent, end: Colors.indigoAccent).animate(animationController),
              value: animationController.value,
            ),
          ),
        ],
      ),
    );
  }
}
