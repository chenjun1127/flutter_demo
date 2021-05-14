import 'package:flutter/material.dart';

class TapBoxB extends StatelessWidget {
  final bool isActive;

  final ValueChanged<bool> onChanged;

  TapBoxB({Key key, this.isActive: false, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isActive);
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
          color: isActive ? Colors.brown[500] : Color.fromARGB(255, 0, 150, 0),
        ),
      ),
    );
  }
}
