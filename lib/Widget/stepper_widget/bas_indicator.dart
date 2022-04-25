import 'package:flolog/Contants/color.dart';
import 'package:flutter/material.dart';

class BaseIndicator extends StatelessWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;


  final int index = 2;

  /// The child to be placed within the indicator.
  final Widget? child;



  final Widget? child2;

  /// Action to be taken when this indictor is pressed.
  final Function? onPressed;

  /// Color of this indicator when it is not selected.
  final Color? color;

  /// Color of this indicator when it is selected.
  final Color? activeColor;

  /// Border color of this indicator when it is selected.
  final Color? activeBorderColor;

  /// The border width of this indicator when it is selected.
  final activeBorderWidth;

  /// Radius of this indicator.
  final double radius;

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  BaseIndicator({
    this.isSelected = false,
    this.child,
    this.child2,
    this.onPressed,
    this.color,
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border:  Border.all(
              color: isSelected?Color(clrBlue) : Colors.grey.withOpacity(0.4),
              width: 1.5,
            ),
            shape: BoxShape.circle,
          ),
          child: InkWell(
            // onTap: onPressed as void Function()?,
            child: Container(
              height: radius * 2,
              width: radius * 2,
              padding: EdgeInsets.all(padding),
              child: Center(
                child: isSelected?child:null,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: child2,
        ),
      ],
    );
  }
}
