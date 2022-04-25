import 'package:flolog/Widget/timeline_package.dart';
import 'package:flutter/material.dart';

import '../../Contants/color.dart';

class TrackSingle extends StatefulWidget {
  TrackSingle({this.title});

  final String? title;

  @override
  _TrackSingleState createState() => _TrackSingleState();
}

class _TrackSingleState extends State<TrackSingle> {
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
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   screenProgress = ProgressTimeline(
    //     states: allStages,
    //     currentindex: 2,
    //     vertical: true,
    //     iconSize: 35,
    //     containerHeight: MediaQuery.of(context).size.height,
    //     textStyle: const TextStyle(color: Colors.black),
    //   );
    // });

    super.initState();
  }

  // screenProgress.gotoNextStage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(clrBlack),
              )),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 40,
              width: 120,
              child: Image.asset(
                'assets/images/flolog.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 15),
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(''),
                          Text(
                            'NONSIPA DRUG',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                          Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(clrBlue)),
                              child: Center(
                                  child: Icon(
                                Icons.location_on_outlined,
                                size: 30,
                                color: Colors.white,
                              )))
                        ],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('21/08'),
                              Text("10:00 AM"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('21/08'),
                              Text("10:00 AM"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('21/08'),
                              Text("10:00 AM"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      children: [
                        ProgressTimeline(
                          states: allStages,
                          currentindex: 2,
                          vertical: true,
                          iconSize: 35,
                          containerHeight: MediaQuery.of(context).size.height,
                          textStyle: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: ListView(
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
