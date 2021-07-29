import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerTransform extends StatefulWidget {
  const ContainerTransform({Key key}) : super(key: key);

  @override
  _ContainerTransformState createState() => _ContainerTransformState();
}

class _ContainerTransformState extends State<ContainerTransform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow menu page"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return OpenContainer(
            transitionDuration: Duration(milliseconds: 200),
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
            ),
            openBuilder: (BuildContext context, void Function({Object returnValue}) action) {
              return Scaffold(
                appBar: AppBar(title: Text("Material motion")),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    'https://macimg.com/content/images/system/home_cover_1605119614393_85038e.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            closedBuilder: (BuildContext context, void Function() action) {
              return Container(
                child: Image.network(
                  'https://macimg.com/content/images/system/home_cover_1605119614393_85038e.jpg',
                  fit: BoxFit.fill,
                ),
              );
            },
          );
        },
        itemCount: 20,
      ),
    );
  }
}
