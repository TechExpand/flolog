
import 'package:flolog/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'Module/homebloc/home.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SPLASHSTATE();
  }
}

class SPLASHSTATE extends State<SplashScreen> {




  @override
  void initState() {
    super.initState();
    // Provider.of<LocationService>(context, listen: false).getCurrentLocation();

    // Future<Widget> decideFirstWidget() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   var token = prefs.getString('Bearer');
    //   var data = Provider.of<DataProvider>(context, listen: false);
    //   data.setSplash(true);
    //
    //   if (token == null || token == 'null' || token == '') {
    //     return Navigator.pushAndRemoveUntil(
    //       context,
    //       PageRouteBuilder(
    //         pageBuilder: (context, animation, secondaryAnimation) {
    //           return IntroPage();
    //         },
    //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //           return FadeTransition(
    //             opacity: animation,
    //             child: child,
    //           );
    //         },
    //       ),
    //           (route) => false,
    //     );
    //   } else {
    //     return Navigator.pushAndRemoveUntil(
    //       context,
    //       PageRouteBuilder(
    //         pageBuilder: (context, animation, secondaryAnimation) {
    //           return HomePage(); //SignUpAddress();
    //         },
    //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //           return FadeTransition(
    //             opacity: animation,
    //             child: child,
    //           );
    //         },
    //       ),
    //           (route) => false,
    //     );
    //   }
    // }






    // checkForUpdate();
    // Provider.of<WebServices>(context, listen: false).initializeValues();
    // Provider.of<WebServices>(context, listen: false).checkDevice();
    Future.delayed(Duration(seconds: 5), () async {
      Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return MyApp(); //SignUpAddress();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
                    (route) => false,
              );
      //sendAndRetrieveMessage();
      // getit();
      // FirebaseCrashlytics.instance.crash();
      // return decideFirstWidget();
    });

    //Instabug.start(INSTABUG_TOKEN, [InvocationEvent.shake]);
  }


// Replace with server token from firebase console settings.
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  //
  // getit() async {
  //   var network = Provider.of<WebServices>(context, listen: false);
  //   var data = Provider.of<Utils>(context, listen: false);
  //   await firebaseMessaging.getToken().then((value) {
  //     data.setFCMToken(value);
  //   });
  //   network.updateFCMToken(network.userId, data.fcmToken);
  // }

  // Future<void> checkForUpdate() async {
  //   InAppUpdate.checkForUpdate().then((info) {
  //     if(info.updateAvailability == UpdateAvailability.updateAvailable){
  //       InAppUpdate.performImmediateUpdate()
  //           .catchError((e){
  //         print(e);
  //       });
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }


bool  willpop = false;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
     return willpop;
      },
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Hero(
              tag: 'MainImage',
              child: Image.asset(
                'assets/images/flolog.png',
                scale: 2.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
