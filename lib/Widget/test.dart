import 'package:flolog/Widget/timeline_package.dart';
import 'package:flutter/material.dart';



class MyHomePagetest extends StatefulWidget {
  MyHomePagetest({this.title});
  final String ?title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagetest> {
  late ProgressTimeline screenProgress;

  List<SingleState> allStages = [
    SingleState(stateTitle: "Stage 1"),
    SingleState(stateTitle: "Stage 2"),
    SingleState(stateTitle: "Stage 3"),
    SingleState(stateTitle: "Stage 4"),
    SingleState(stateTitle: "Stage 5"),
  ];

  @override
  void initState() {
    screenProgress = ProgressTimeline(
      states: allStages,
      currentindex: 2,
      vertical: true,
      iconSize: 35,
      containerHeight: 700,
      textStyle: const TextStyle(color: Colors.black),
    );
    super.initState();
  }

  // screenProgress.gotoNextStage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                  Column(
                         children: [
                           Text('21/08'),
                           Text("10:00 AM"),
                         ],
                       ),

                      SizedBox(
                        height: 130,
                      ),
                      Column(
                        children: [
                          Text('21/08'),
                          Text("10:00 AM"),
                        ],
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      Column(
                        children: [
                          Text('21/08'),
                          Text("10:00 AM"),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      screenProgress
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.55,
                  child:  ListView(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Signed'),
                            Text("Lagos State, Nigeria"),
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Processed'),
                            Text("Lagos State, Nigeria"),
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipped'),
                            Text("Lagos State, Nigeria"),
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Out for delivery'),
                            Text("Edo State, Nigeria"),
                          ],
                        ),
                        SizedBox(
                          height: 140,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivered'),
                            Text("Edo State, Nigeria"),
                          ],
                        )
                      ],
                    ),
                ),
              ],
            ),
          ],
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}