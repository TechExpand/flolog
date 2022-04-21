import 'package:flutter/material.dart';

class ExpandableCardContainer extends StatefulWidget {
  final bool? isExpanded;
  final Widget collapsedChild;
  final Widget expandedChild;

   ExpandableCardContainer({required this.isExpanded, required this.collapsedChild, required this.expandedChild});

  @override
  _ExpandableCardContainerState createState() =>
      _ExpandableCardContainerState();
}

class _ExpandableCardContainerState extends State<ExpandableCardContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: new Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: widget.isExpanded == true ? widget.expandedChild : widget.collapsedChild,
    );
  }
}
