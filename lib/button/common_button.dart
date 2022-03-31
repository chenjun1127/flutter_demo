import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/button/style.dart';

/// Created by chenjun on 2021/11/4.
/// 按钮

class OrbButton {
  ///主按钮
  static Widget defaultButton({
    Widget child,
    String text = "Main Button",
    VoidCallback onPressed,
    double width = 312,
    double height = 70,
    VoidCallback onLongPress,
    ButtonState buttonState = ButtonState.normal,
    Color bgColor = const Color(0xFFCDA763),
    double radius,
    Color fontColor = Colors.black,
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
    double pressedOpacity = 0.3,
    double disabledOpacity = 0.6,
    double fontSize = 26,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child ?? Text(text, style: FontStyle.bigTitle.copyWith(color: fontColor, fontSize: fontSize)),
          ),
          _OrbStateButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            radius: radius,
            buttonState: buttonState,
            pressedOpacity: pressedOpacity,
            disabledOpacity: disabledOpacity,
          ),
        ],
      ),
    );
  }

  ///透明按钮
  static Widget opacityButton({
    Widget child,
    String text = "Opacity Button",
    VoidCallback onPressed,
    double width = 312,
    double height = 70,
    VoidCallback onLongPress,
    ButtonState buttonState = ButtonState.normal,
    Color bgColor = const Color.fromARGB(67, 255, 255, 255),
    double radius,
    Color fontColor = const Color(0xFFFFFFFF),
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
    double pressedOpacity = 0.26,
    double disabledOpacity = 0.6,
    double fontSize = 26,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child ?? Text(text, style: FontStyle.bigTitle.copyWith(color: fontColor, fontSize: fontSize)),
          ),
          _OrbStateButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            radius: radius,
            buttonState: buttonState,
            pressedOpacity: pressedOpacity,
            disabledOpacity: disabledOpacity,
          ),
        ],
      ),
    );
  }

  ///主要按钮
  static Widget primaryButton({
    Widget child,
    String text = "Primary Button",
    VoidCallback onPressed,
    double width = 312,
    double height = 70,
    VoidCallback onLongPress,
    ButtonState buttonState = ButtonState.normal,
    Color bgColor = const Color(0xFF4A90E2),
    double radius,
    Color fontColor = const Color(0xFFE4E4E4),
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
    double pressedOpacity = 0.3,
    double disabledOpacity = 0.6,
    double fontSize = 26,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular(radius ?? 0.0))),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child ?? Text(text, style: FontStyle.bigTitle.copyWith(color: fontColor, fontSize: fontSize)),
          ),
          _OrbStateButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            radius: radius,
            buttonState: buttonState,
            pressedOpacity: pressedOpacity,
            disabledOpacity: disabledOpacity,
          ),
        ],
      ),
    );
  }
}

class _OrbStateButton extends StatefulWidget {
  const _OrbStateButton({
    Key key,
    this.onPressed,
    this.onLongPress,
    this.radius = 0,
    this.buttonState = ButtonState.normal,
    this.pressedOpacity = 0.3,
    this.disabledOpacity = 0.6,
  }) : super(key: key);
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final double radius;
  final ButtonState buttonState;
  final double pressedOpacity;
  final double disabledOpacity;

  @override
  _OrbStateButtonState createState() => _OrbStateButtonState();
}

class _OrbStateButtonState extends State<_OrbStateButton> {
  ButtonState _curState;
  final Color stateColor = const Color(0x00000000);

  @override
  void initState() {
    super.initState();
    _curState = widget.buttonState;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if (_curState != ButtonState.disabled && _curState != ButtonState.selected) {
          setState(() {
            _curState = ButtonState.pressed;
          });
        }
      },
      onTapCancel: () {
        if (_curState != ButtonState.disabled && _curState != ButtonState.selected) {
          setState(() {
            _curState = ButtonState.normal;
          });
        }
      },
      onTap: () {
        if (_curState != ButtonState.disabled) {
          widget.onPressed?.call();
        }
        if (_curState != ButtonState.disabled && _curState != ButtonState.selected) {
          setState(() {
            _curState = ButtonState.normal;
          });
        }
      },
      onLongPress: () {
        if (_curState != ButtonState.disabled) {
          widget.onLongPress?.call();
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: parseBgColor(),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius ?? 0.0),
          ),
        ),
      ),
    );
  }

  ///根据UI设计稿定义各个按钮状态透明度
  Color parseBgColor() {
    Color bgColor;
    switch (_curState) {
      case ButtonState.normal:
        bgColor = stateColor;
        break;
      case ButtonState.pressed:
        bgColor = stateColor.withAlpha((widget.pressedOpacity * 255).toInt());
        break;
      case ButtonState.selected:
        bgColor = stateColor.withAlpha((widget.pressedOpacity * 255).toInt());
        break;
      case ButtonState.disabled:
        bgColor = stateColor.withAlpha((widget.disabledOpacity * 255).toInt());
        break;
      default:
        bgColor = stateColor;
        break;
    }
    return bgColor;
  }
}

///按钮状态，normal 正常状态；pressed 按下(选中状态)；selected 选中状态; disabled 不可用状态
enum ButtonState { normal, pressed, selected, disabled }
