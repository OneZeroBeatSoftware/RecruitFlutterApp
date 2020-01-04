import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomDrawerWidget extends StatefulWidget {
  final double smallHeight;
  final double marginTop;
  final Widget child;

  const BottomDrawerWidget(
      {Key key, this.marginTop, this.smallHeight, this.child})
      : super(key: key);

  @override
  _BottomDrawerWidgetState createState() => _BottomDrawerWidgetState();
}

class _BottomDrawerWidgetState extends State<BottomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 0),
      child: widget.child,
    );
  }
}
