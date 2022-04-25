
import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flolog/Module/trackBloc/track_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DrawerWidget extends StatefulWidget {
  final currentContext;


  DrawerWidget(this.currentContext);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 100,
                child: Container(
                  margin: EdgeInsets.only(top: 18),
                  //alignment: Alignment.bottomLeft,
                  child:  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 10),
                        child: CircleAvatar(
                          child: Text(''),
                          radius: 40,
                          backgroundImage: AssetImage(
                              "assets/images/5.png"
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Emonbeifo Efosa',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'emonosasere@gmail.com',
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.edit_outlined,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.pin_drop_outlined,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Address Book',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              'Wishlist',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ),

                        ],
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.history,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Order History',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return TrackPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.track_changes_sharp,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Track Order',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.credit_card_sharp,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Cards',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.notifications_none,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Notification',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.arrow_forward_ios, size: 19,),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         (context, animation, secondaryAnimation) {
                    //       return ProfileNew();
                    //     },
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // )
                  },
                  child: SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Color(0xFFC4E8FC)),
                          child: Center(
                              child: Icon(
                                Icons.logout,
                                size: 23,
                                color: Colors.black,
                              ))),
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      minLeadingWidth: 10,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),

                    ),
                  )),
            ],
          ),
        ));
  }
}
