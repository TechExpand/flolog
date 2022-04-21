import 'dart:ui';

import 'package:flolog/Module/cartBloc/cart_cubit.dart';
import 'package:flolog/Module/cartBloc/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Contants/color.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

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
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Color(clrBlack),
        //     )),
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
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 80,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 15.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Total:",
                             style: TextStyle(fontSize: 16, color: Colors.black38),
                           ),
                           Text(
                             "NGN${state.total}.00",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Color(clrBlue),
                                 fontSize: 18),
                           ),
                         ],
                       ),
                     ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return CheckOut();
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
                            // addCartDialog(context);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 12),
                            margin: const EdgeInsets.only(
                                bottom: 15, left: 12, right: 12, top: 15),
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
                                      color: Color(clrBlue).withOpacity(0.5),
                                      blurRadius: 10.0,
                                      offset: Offset(0.3, 1.0))
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Text(
                              'CHECKOUT',
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
              );
            },
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: state.cart.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return state.cart.isEmpty
                              ? Container()
                              : Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                          top: 4,
                                          right: 15,
                                        ),
                                        child: Container(
                                          height: 120,
                                          width: 110,
                                          child: Image.asset(
                                            state.cart[index].image.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'St.Ray Dietry Supplement',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                            child: Text(
                                              'NGN${(int.parse(state.cart[index].price.toString()) * int.parse(state.cart[index].quantity.toString()))}.00',
                                              style: TextStyle(
                                                  color: Color(clrBlue),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 5.0),
                                            padding: const EdgeInsets.only(bottom: 8),
                                            height: 35,
                                            width: 120,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        // BlocProvider.of<CartCubit>(context).addCart(index: index);
                                                      },
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Color(clrBlack),
                                                        size: 20,
                                                      )),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 9, left: 4,right: 4),
                                                    child: Text(
                                               state.cart[index].quantity.toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        BlocProvider.of<CartCubit>(context).removeCart(index: index);
                                                      },
                                                      icon: Icon(Icons.remove,
                                                          color:
                                                              Color(clrBlack),
                                                          size: 20))
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(clrGrey),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
