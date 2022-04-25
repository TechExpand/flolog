// library progress_timeline;
import 'package:flolog/Contants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProgressTimeline extends StatefulWidget {
  /// a List of all states to be rendered
  final List<SingleState>? states;

  /// height of the widget
  final double? height;

  final bool? vertical;

  /// Icon used to render a checked stage
  final Icon? checkedIcon;

  /// Icon used to render current stage
  final Icon? currentIcon;

  /// Icon used to render a failed stage
  final Icon? failedIcon;

  /// Icon used to render an unchecked stage
  final Icon? uncheckedIcon;

  /// Color of the connectors
  final Color? connectorColor;

  /// Length of the connectors
  final double? connectorLength;

  /// Width of the connectors
  final double? connectorWidth;

  ///Size of Icons rendered in each stage
  final double? iconSize;

  final double? containerHeight;

  /// Style of text used to display stage title
  final TextStyle? textStyle;

  /// Curve for Transition can be added, defaults to
  final Curve? transitionCurve;

  final int? currentindex;

  ProgressTimeline({
    @required this.states,
    this.height,
    this.checkedIcon,
    this.containerHeight,
    this.currentIcon,
    this.failedIcon,
    this.iconSize,
    this.vertical,
    this.textStyle,
   required this.currentindex,
    this.connectorLength,
    this.connectorWidth,
    this.connectorColor,
    this.uncheckedIcon,
    this.transitionCurve = Curves.fastOutSlowIn,
  });

  final _ProgressTimelineState state = new _ProgressTimelineState();

  /// method to jump to next stage in the process.
  void gotoNextStage() {
    state.gotoNextStage();
  }

  /// method to mark the current stage as failed.
  void failCurrentStage() {
    state.failCurrentStage();
  }

  /// method to go back to previous stage in the process.
  void gotoPreviousStage() {
    state.gotoPreviousStage();
  }

  @override
  _ProgressTimelineState createState() => state;
}

class _ProgressTimelineState extends State<ProgressTimeline> {
  int currentStageIndex = 0;
  late List<SingleState> states;
  double height = 100;

  final _controller = ItemScrollController();

  @override
  void initState() {
     currentStageIndex = widget.currentindex!;
    states = widget.states!;
    if (widget.height != null) {
      height = widget.height!;
    }
    super.initState();
  }

  void gotoNextStage() {
    setState(() {
      if (currentStageIndex <= states.length - 1) {
        currentStageIndex++;
        _controller.scrollTo(
          index: currentStageIndex - 1,
          duration: Duration(milliseconds: 1000),
          curve: widget.transitionCurve as Curve,
        );
      }
    });
  }

  void gotoPreviousStage() {
    setState(() {
      if (currentStageIndex >= 0) {
        if (currentStageIndex > 0) currentStageIndex--;
        states[currentStageIndex].isFailed = false;
      }

      if (currentStageIndex > 0) {
        _controller.scrollTo(
          index: currentStageIndex - 1 >= 0
              ? currentStageIndex - 1
              : currentStageIndex,
          duration: Duration(milliseconds: 1000),
          curve: widget.transitionCurve as Curve,
        );
      }
    });
  }

  void failCurrentStage() {
    setState(() {
      states[currentStageIndex].isFailed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.containerHeight,
      child: ScrollablePositionedList.builder(
        itemCount: buildStates().length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemScrollController: _controller,
        scrollDirection:
            widget.vertical! == false ? Axis.horizontal : Axis.vertical,
        itemBuilder: (context, index) {
          return buildStates()[index];
        },
      ),
    );
  }

  List<Widget> buildStates() {
    List<Widget> allStates = [];
    for (var i = 0; i < states.length; i++) {
      allStates.add(_RenderedState(
        textStyle: widget.textStyle,
        vertical: widget.vertical,
        connectorLength: widget.connectorLength,
        connectorWidth: widget.connectorWidth,
        connectorColor: widget.connectorColor,
        iconSize: widget.iconSize,
        checkedIcon: widget.checkedIcon,
        failedIcon: widget.failedIcon,
        currentIcon: widget.currentIcon,
        uncheckedIcon: widget.uncheckedIcon,
        stateNumber: i + 1,
        isCurrent: i == currentStageIndex,
        isFailed: states[i].isFailed,
        isChecked: i < currentStageIndex,
        stateTitle: states[i].stateTitle,
        isLeading: i == 0,
        isTrailing: i == states.length - 1,
      ));
    }

    return allStates;
  }
}

class _RenderedState extends StatelessWidget {
  final Icon? checkedIcon;
  final Icon? currentIcon;
  final Icon? failedIcon;
  final Icon? uncheckedIcon;
  final bool? isChecked;
  final String? stateTitle;
  final TextStyle? textStyle;
  final bool? isLeading;
  final bool? vertical;
  final bool? isTrailing;
  final int? stateNumber;
  final bool? isFailed;
  final bool? isCurrent;
  final double? iconSize;
  final Color? connectorColor;
  final double? connectorLength;
  final double? connectorWidth;

  _RenderedState({
    @required this.isChecked,
    @required this.stateTitle,
    @required this.stateNumber,
    double? iconSize,
    Color? connectorColor,
    double? connectorLength,
    double? connectorWidth,
    TextStyle? textStyle,
    this.failedIcon,
    this.vertical,
    this.currentIcon,
    this.checkedIcon,
    this.uncheckedIcon,
    this.isFailed = false,
    this.isCurrent,
    this.isLeading = false,
    this.isTrailing = false,
  })  : this.iconSize = 25,
        this.connectorColor = Color(clrBlue),
        this.connectorLength =
            connectorLength != null ? connectorLength / 2 : 40,
        this.connectorWidth = 5,
        this.textStyle = TextStyle();

  Widget line() {
    return vertical == false
        ? Container(
            color: connectorColor,
            height: 1,
            width: connectorLength,
          )
        : Center(
            child: Container(
              color: connectorColor,
              height: 70,
              width: 1,
            ),
          );
  }

  Widget spacer() {
    return Container(
      width: 3.0,
    );
  }

  Widget getCheckedIcon() {
    return this.checkedIcon != null
        ? Icon(
            this.checkedIcon?.icon,
            color: this.checkedIcon?.color,
            size: iconSize,
          )
        : Icon(
            Icons.check_circle,
            color:Color(clrBlue),
            size: iconSize,
          );
  }

  Widget getFailedIcon() {
    return this.failedIcon != null
        ? Icon(
            this.failedIcon?.icon,
            color: this.failedIcon?.color,
            size: iconSize,
          )
        : Icon(
            Icons.highlight_off,
            color: Colors.redAccent,
            size: iconSize,
          );
  }

  Widget getCurrentIcon() {
    return this.currentIcon != null
        ? Icon(
            this.currentIcon!.icon,
            color: this.currentIcon!.color,
            size: iconSize,
          )
        : Icon(
            Icons.adjust,
            color: Color(clrBlue),
            size: iconSize,
          );
  }

  Widget getUnCheckedIcon() {
    return this.uncheckedIcon != null
        ? Icon(
            this.uncheckedIcon!.icon,
            color: this.uncheckedIcon!.color,
            size: iconSize,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Color(clrBlue),
            size: iconSize,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: isLeading == true && vertical! == false
              ? const EdgeInsets.only(left: 30.0)
              : isTrailing == true && vertical! == false
                  ? const EdgeInsets.only(right: 30.0)
                  : const EdgeInsets.all(0.0),
          child: vertical == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isLeading!) line(),
                    renderCurrentState(),
                    if (!isTrailing!) line(),
                  ],
                ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isLeading!) line(),
              renderCurrentState(),
              if (!isTrailing!) line(),
            ],
          ),
        ),
        vertical! == false
            ? Container(
                child: Text(
                  stateTitle!,
                  style: textStyle,
                ),
              )
            : Container(),
      ],
    );
  }

  Widget renderCurrentState() {
    if (isFailed != null && isFailed!) {
      return getFailedIcon();
    } else if (isChecked != null && isChecked!) {
      return getCheckedIcon();
    } else if (isCurrent != null && isCurrent!) {
      return getCurrentIcon();
    }
    return getUnCheckedIcon();
  }
}

class SingleState {
  /// Do not use this explicitly(in most cases)
  bool? isFailed;

  /// Title of a state
  String? stateTitle;

  SingleState({@required this.stateTitle, this.isFailed});
}
