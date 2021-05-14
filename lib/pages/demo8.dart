import 'package:flutter/material.dart';
import 'package:flutter_demo/components/CartModel.dart';
import 'package:flutter_demo/utils/ChangeNotifierProvider.dart';
import 'package:flutter_demo/models/item.dart';
import 'package:flutter_demo/utils/Consumer.dart';

class Demo8 extends StatefulWidget {
  Demo8({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Demo8State createState() => Demo8State();
}

class Demo8State extends State<Demo8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ChangeNotifierProvider(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: [
                Consumer<CartModel>(
                  builder: (BuildContext context, cart) => Text("总价: ${cart.totalPrice}"),
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      // 给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(title: "商品一", count: 2, price: 20.0));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
