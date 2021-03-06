import 'package:flutter/material.dart';
import 'package:flutter_demo/components/ProcessCircle.dart';

class Demo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.toStringShallow(joiner: " page")),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Wrap(
            children: [
              Container(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: .6,
                    ),
                  ),
                ],
              ),
              Container(
                child: ProgressCircle(),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.redAccent,
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        color: Colors.blueGrey,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 100.0,
                  //Flex????????????widget?????????????????????2???1???1?????????100???????????????
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
