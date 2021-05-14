import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  TapBoxAState createState() => TapBoxAState();
}

class TapBoxAState extends State<TapBoxA> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.isActive = !this.isActive;
        });
      },
      child: Container(
        child: Center(
          child: Text(
            isActive ? 'Active' : 'Inactive',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        width: MediaQuery.of(context).size.width / 2 - 18,
        height: 200,
        decoration: BoxDecoration(
          color: isActive ? Colors.lightGreen[500] : Color.fromARGB(255, 255, 0, 0),
        ),
      ),
    );
  }
}
