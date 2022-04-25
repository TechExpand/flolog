import 'package:flolog/Contants/color.dart';
import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';

import '../../../Widget/stepper_widget/Custom_Stepper.dart';
import '../../../main.dart';

class CheckOutDelivery extends StatefulWidget {
  const CheckOutDelivery({Key? key}) : super(key: key);

  @override
  _CheckOutDeliveryState createState() => _CheckOutDeliveryState();
}

class _CheckOutDeliveryState extends State<CheckOutDelivery> {
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 4;
  PageController controller =
      PageController(viewportFraction: 1, initialPage: 0);

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 15),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  activeStep==0?'Checkout':activeStep==1?"Add Payment Details":"Summary",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                )),
          ),
          Column(
            children: [
              IconStepper(
                enableNextPreviousButtons: false,
                stepColor: Colors.white,
                stepRadius: 18.0,
                activeStepBorderWidth: 1.0,
                activeStepBorderColor: Color(clrBlue),
                icons: [
                  Icon(
                    Icons.circle,
                    color: Color(clrBlue),
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(clrBlue),
                  ),
                  Icon(
                    Icons.circle,
                    color: Color(clrBlue),
                  ),

                ],
                text: [
                  "Delivery",
                  "Payments",
                  "Summary",
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,

                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  activeStep = index;
                });
              },
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  body: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Your Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 3),
                          child: Text(
                            'ABIODUN EZE',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              // fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('NO 2, Ugbowo Lagos Express way',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('Bein City',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('08100656659',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                SizedBox(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.5);
                                          return null; // Use the component's default.
                                        },
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                          color: Color(clrBlue), fontSize: 17),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 60.0),
                              child: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: Color(clrBlue),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Shipment Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Container(
                            height: 158,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (constext, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                              'assets/images/2.png',
                                              fit: BoxFit.cover,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 9, bottom: 3),
                                        child: Text(
                                          "nonsipa".toUpperCase(),
                                          style: TextStyle(
                                            color: Color(clrBlack),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: Text(
                                          "\$${95}".toUpperCase(),
                                          style: TextStyle(
                                              color: Color(clrBlue),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 15, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Tax'),
                                Text(
                                  '   ·················································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "",
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    controller.jumpToPage(1);
                                    // Navigator.push(
                                    //   context,
                                    //   PageRouteBuilder(
                                    //     pageBuilder:
                                    //         (context, animation, secondaryAnimation) {
                                    //       return CheckOut();
                                    //     },
                                    //     transitionsBuilder: (context, animation,
                                    //         secondaryAnimation, child) {
                                    //       return FadeTransition(
                                    //         opacity: animation,
                                    //         child: child,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                    // addCartDialog(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 12),
                                    margin: const EdgeInsets.only(
                                        bottom: 15,
                                        left: 12,
                                        right: 12,
                                        top: 15),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment(-1, -0.9),
                                            end: Alignment(0.2, 0.2),
                                            colors: [
                                              Color(clrBlue),
                                              Color(clrBlue)
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(clrBlue)
                                                  .withOpacity(0.5),
                                              blurRadius: 10.0,
                                              offset: Offset(0.3, 1.0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),



                Scaffold(
                  backgroundColor: Colors.white,
                  body: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.black26,
                                      size: 45,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                    ),
                                    Text(
                                      "Bank Transfer",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black26,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12, top: 8),
                                  child: Container(
                                    height: 1.2,
                                    color: Colors.black12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.black26,
                                      size: 45,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                    ),
                                    Text(
                                      "Flutterwave",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.37,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black26,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12, top: 8),
                                  child: Container(
                                    height: 1.2,
                                    color: Colors.black12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.black26,
                                      size: 45,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.23,
                                    ),
                                    Text(
                                      "Pay Stack",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black26,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12, top: 8),
                                  child: Container(
                                    height: 1.2,
                                    color: Colors.black12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Shipment Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Container(
                            height: 158,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (constext, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                              'assets/images/2.png',
                                              fit: BoxFit.cover,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 9, bottom: 3),
                                        child: Text(
                                          "nonsipa".toUpperCase(),
                                          style: TextStyle(
                                            color: Color(clrBlack),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: Text(
                                          "\$${95}".toUpperCase(),
                                          style: TextStyle(
                                              color: Color(clrBlue),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 15, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Sub Total'),
                                Text(
                                  '   ·······································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Tax'),
                                Text(
                                  '   ·················································································       ',
                                  style: TextStyle(color: Colors.black26),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Padding(
                            padding: const EdgeInsets.only(left: 15.0),
    child: InkWell(
    onTap: () {
      controller.jumpToPage(0);
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder:
    //         (context, animation, secondaryAnimation) {
    //       return CheckOut();
    //     },
    //     transitionsBuilder: (context, animation,
    //         secondaryAnimation, child) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     },
    //   ),
    // );
    // addCartDialog(context);
    },
    child: AnimatedContainer(
    duration: Duration(milliseconds: 500),
    height: 50,
    width:
    MediaQuery.of(context).size.width * 0.4,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 12),
    margin: const EdgeInsets.only(
    bottom: 15,
    left: 12,
    right: 12,
    top: 15),
    decoration: BoxDecoration(
      border: Border.all(color: Color(clrBlue), width: 1.4),
    gradient: LinearGradient(
    begin: Alignment(-1, -0.9),
    end: Alignment(0.2, 0.2),
    colors: [
    Colors.white,
    Colors.white
    ]),
    boxShadow: [
    BoxShadow(
    color: Colors.white
        .withOpacity(0.5),
    blurRadius: 10.0,
    offset: Offset(0.3, 1.0))
    ],
    borderRadius: BorderRadius.all(
    Radius.circular(4))),
    child: Text(
    'BACK',
    style: TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.bold),
    ),
    ),
    ),
    ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    controller.jumpToPage(3);
                                    // Navigator.push(
                                    //   context,
                                    //   PageRouteBuilder(
                                    //     pageBuilder:
                                    //         (context, animation, secondaryAnimation) {
                                    //       return CheckOut();
                                    //     },
                                    //     transitionsBuilder: (context, animation,
                                    //         secondaryAnimation, child) {
                                    //       return FadeTransition(
                                    //         opacity: animation,
                                    //         child: child,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                    // addCartDialog(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 12),
                                    margin: const EdgeInsets.only(
                                        bottom: 15,
                                        left: 12,
                                        right: 12,
                                        top: 15),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment(-1, -0.9),
                                            end: Alignment(0.2, 0.2),
                                            colors: [
                                              Color(clrBlue),
                                              Color(clrBlue)
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(clrBlue)
                                                  .withOpacity(0.5),
                                              blurRadius: 10.0,
                                              offset: Offset(0.3, 1.0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),





                Scaffold(
                  backgroundColor: Colors.white,
                  body: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 30),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Order Summary',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 15, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('items Total',  style: TextStyle(color: Colors.black, fontSize: 17),),
                                Text(
                                  '   ················································       ',
                                  style: TextStyle(color: Colors.black26, fontSize: 17),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Shipping fee', style: TextStyle(color: Colors.black, fontSize: 17)),
                                Text(
                                  '   ···············································       ',
                                  style: TextStyle(color: Colors.black26,fontSize: 17),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Discount', style: TextStyle(color: Colors.black,fontSize: 17),),
                                Text(
                                  '   ····················································       ',
                                  style: TextStyle(color: Colors.black26, fontSize: 17),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                                Text('Tax',  style: TextStyle(color: Colors.black,fontSize: 17),),
                                Text(
                                  '   ·······························································       ',
                                  style: TextStyle(color: Colors.black26, fontSize: 17),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 2.0, top: 2, left: 8, right: 8),
                            child: Row(
                              children: [
                               Container(
                                 height: 21,
                                 width: 120,
                                 decoration: BoxDecoration(
                                   color: Color(clrBlue),
                                 ),
                                 child:  Text('Grand Total',
                                   style: TextStyle(color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 17),
                                 textAlign: TextAlign.center,
                                 ),
                               ),
                                Text(
                                  '   ···········································       ',
                                  style: TextStyle(color: Colors.black26, fontSize: 17),
                                ),
                                Text(
                                  '\$--',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40, bottom: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Shipment Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),



                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'ABIODUN EZE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('NO 2, Ugbowo Lagos Express way',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('Bein City',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text('08100656659',
                                      style: TextStyle(fontSize: 16)),
                                ),
                                SizedBox(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.5);
                                          return null; // Use the component's default.
                                        },
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                          color: Color(clrBlue), fontSize: 17),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 60.0),
                              child: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: Color(clrBlue),
                              ),
                            )
                          ],
                        ),
                      ),


                      Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation, secondaryAnimation) {
                                          return MyApp();
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                    // Navigator.push(
                                    //   context,
                                    //   PageRouteBuilder(
                                    //     pageBuilder:
                                    //         (context, animation, secondaryAnimation) {
                                    //       return CheckOut();
                                    //     },
                                    //     transitionsBuilder: (context, animation,
                                    //         secondaryAnimation, child) {
                                    //       return FadeTransition(
                                    //         opacity: animation,
                                    //         child: child,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                    // addCartDialog(context);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: 50,
                                    width:
                                    MediaQuery.of(context).size.width * 0.4,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 12),
                                    margin: const EdgeInsets.only(
                                        bottom: 15,
                                        left: 12,
                                        right: 12,
                                        top: 15),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment(-1, -0.9),
                                            end: Alignment(0.2, 0.2),
                                            colors: [
                                              Color(clrBlue),
                                              Color(clrBlue)
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(clrBlue)
                                                  .withOpacity(0.5),
                                              blurRadius: 10.0,
                                              offset: Offset(0.3, 1.0))
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Text(
                                      'FINISH',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
