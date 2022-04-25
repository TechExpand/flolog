import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flolog/Module/cartBloc/cart_cubit.dart';
import 'package:flolog/Module/cartBloc/checkout_view.dart';
import 'package:flolog/Module/trackBloc/trackSingle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Contants/color.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({Key? key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}



class _TrackPageState extends State<TrackPage>{
  int _selectedIndex = 0;
  PageController controller = PageController(initialPage: 0,viewportFraction: 1);

  // Initial Selected Value

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).totalCartAmount();
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
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Track Order',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    )),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: state.cart.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return state.cart.isEmpty
                              ? Container()
                              : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 12),
                                    child: Align(
                                        child: Text('Aug 18, 2021',
                                          style: TextStyle(color: Colors.black38, fontSize: 17), ),
                                    alignment: Alignment.topLeft,),
                                  ),
                                  InkWell(
                                    child: Container(
                            decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12.withOpacity(0.1),
                                            blurRadius: 7.0,
                                            offset: Offset(0.3, 1.0))
                                      ],
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Container(

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('${state.cart[index].title}', style: TextStyle(color: Colors.black87, fontSize: 17), ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("\$${state.cart[index].price}", style: TextStyle(color: Color(clrBlue), fontSize: 16),),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0, left: 8),
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 5.0),
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  height: 35,
                                                  width: 100,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 9, left: 4,right: 4),
                                                          child: Text(
                                                           "Delivered",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w500),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color(clrBlue),
                                                      borderRadius:
                                                      BorderRadius.circular(2)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                         Container(
                                                height:120,
                                                width: 130,
                                                child: GridView.builder(
                                                  padding: const EdgeInsets.only(right: 15.0, top: 20),
                                                  itemCount: 4,
                                                  itemBuilder: (ctx, i) => i==3?Container(
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black26),
                                                        borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Center(
                                                        child: Text("+4")),
                                                  ):ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.asset(state.cart[index].image.toString())),
                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio: 1.4,
                                                    crossAxisSpacing: 0,
                                                    mainAxisSpacing: 3,
                                                  ),
                                                )
                                          )

                                        ],
                                      ),
                                    ),
                            ),
                          ),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder:
                                              (context, animation, secondaryAnimation) {
                                            return TrackSingle();
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
                                  ),
                                ],
                              );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
