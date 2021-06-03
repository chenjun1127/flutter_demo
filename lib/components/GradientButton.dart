import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final List<Color> colors;
  final GestureTapCallback onPressed;
  final BorderRadius borderRadius;

  GradientButton({Key key, this.colors, this.width, this.height, @required this.child, this.onPressed, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      // Material覆盖屏幕组件,会在当前屏幕内容基础上,再覆盖一个满屏的区域
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
