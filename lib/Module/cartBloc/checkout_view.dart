import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flolog/Module/cartBloc/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Contants/color.dart';
import 'CheckOutFlow/checkout_delivery.dart';



class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}



class  _CheckOutState extends State<CheckOut>  {
int _selectedIndex = 0;
  // Initial Selected Value
PageController controller = PageController(initialPage: 0,viewportFraction: 1);
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(clrBlack),
            )),
        title: Text('d'),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 350,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0,top:20, left:8, right: 8),
                    child: Row(
                      children: [
                        Text('Sub Total'),
                        Text('   ···································································       ',
                          style: TextStyle(color:Colors.black26),),
                        Text('\$30', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0,top:8, left:8, right: 8),
                    child: Row(
                      children: [
                        Text('Tax'),
                        Text('   ······················································································       ',
                        style: TextStyle(color:Colors.black26),),
                        Text('\$--', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.3,),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0,top:25),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(clrGrey), width: 1.5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(clrGrey),width: 1.5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(clrGrey), width: 1.5),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        labelText: 'Enter Voucher Code',
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:25.0),
                              child: Text('APPLY'),
                            ),
                          ],
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black26
                        )
                      ),
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
                                      Colors.white,
                                      Colors.white
                                    ]),
                                border: Border.all(color: Color(clrBlue), width: 1.4),
                                borderRadius:
                                BorderRadius.all(Radius.circular(4))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone, color: Color(clrBlue),),
                                Text(
                                  'CONTACT US',
                                  style: TextStyle(
                                      color: Color(clrBlue),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
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
                                  return CheckOutDelivery();
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
                  ),
                  BottomNavyBar(
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
