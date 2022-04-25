
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flolog/Contants/color.dart';
import 'package:flolog/Module/cartBloc/cart_cubit.dart';
import 'package:flolog/Module/detailBloc/detail_cubit.dart';
import 'package:flolog/Splash.dart';
import 'package:flolog/Widget/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Module/ProfileBloc/Profile_View.dart';
import 'Module/cartBloc/CheckOutFlow/checkout_delivery.dart';
import 'Module/cartBloc/cart_view.dart';
import 'Module/homebloc/home.dart';
import 'Module/homebloc/home_cubit.dart';
import 'Module/searchBloc/search_view.dart';
import 'Module/trackBloc/trackSingle.dart';
import 'Module/trackBloc/track_view.dart';


void main() {
  runApp(MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => CountCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => DetailCubit()),
        BlocProvider(create: (context) => CartCubit())
      ]
      , child:MainApp() ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          accentColor: Color(clrBlue).withOpacity(0.8),
          textTheme: GoogleFonts.poppinsTextTheme (
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreen());
  }
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}





class _MyAppState extends State<MyApp>  {
  int _selectedIndex = 0;
  PageController controller = PageController(initialPage: 0,viewportFraction: 1);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:

        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomePage(),
            CartPage(),
            Profile(),
          ],
        )

        ,
        bottomNavigationBar:  Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Explore'),
                activeColor: Color(clrBlue),
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  title: Text('Cart'),
                activeColor: Color(clrBlue),
                inactiveColor: Colors.black45,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.person_outline),
                  title: Text('Profile'),
                activeColor: Color(clrBlue),
                inactiveColor: Colors.black45,
              ),
            ],
          ),
        ),
    );
  }
}
