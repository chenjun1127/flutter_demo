import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading({Key key, this.text = "加载中..."}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 2,
            ),
          ),
          Text(this.text, style: TextStyle(color: Colors.grey[600], fontSize: 14))
        ],
      ),
    );
  }
}
