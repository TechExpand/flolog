import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flolog/Module/detailBloc/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Contants/color.dart';
import '../../Model/suggestion.dart';
import '../../Widget/AutoComplete.dart';
import '../../Widget/ExpandedCard.dart';
import '../searchBloc/search_view.dart';



class DetailPage extends StatefulWidget {
  Suggestion data;

  DetailPage({required this.data});

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage>{
  int _selectedIndex =0;

  var items = [
    'PACK',
    'ROW',
    'CARTON',
    'DOZEN',
    'BOX',
  ];


  var items2 = [
    'UNIT',
    'MG',
    'UG',
    'KG',
  ];



  List<String>? searchList = [
    'Anti-Malaria',
    'Antacids',
    'Pain Killers',
    'Contraceptives',
    'Infusions',
    'Consumables',
    'Vaccines',
  ];

  TextEditingController controller = TextEditingController();
  PageController controller1 = PageController(initialPage: 0,viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            controller1.animateToPage(index,
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
//       bottomNavigationBar: Material(
//         elevation: 8,
//         child: SizedBox(
//           height: 90,
//           child: BlocBuilder<CountCubit, CountState>(
//   builder: (context, state) {
//     return Column(
//             children: [
//               InkWell(
//                 onTap: (){
//                   BlocProvider.of<CartCubit>(context).addCart(
//                     price: data.price,
//                     type: data.type,
//                     dose: data.dose,
//                     quantity: state.number,
//                     image: data.image,
//                     title: data.title,
//                   );
//                   addCartDialog(context);
//                 },
//                 child: AnimatedContainer(
//                   duration: Duration(milliseconds: 500),
//                   height: 50,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.only(left: 12),
//                   margin: const EdgeInsets.only(
//                       bottom: 15, left: 12, right: 12, top: 15),
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment(-1, -0.9),
//                           end: Alignment(0.2, 0.2),
//                           colors: [Color(0xFF844BF6), Color(0xFFA44EF7)]),
//
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color(0xFF844BF6).withOpacity(0.5),
//                             blurRadius: 10.0,
//                             offset: Offset(0.3, 1.0))
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(Icons.shopping_cart_outlined, color: Colors.white,),
//                       Text('  Add to cart', style: TextStyle(color: Colors.white,
//                           fontWeight: FontWeight.bold),),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//   },
// ),
//         ),
//       ),
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
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 12),
                    margin: const EdgeInsets.only(
                        bottom: 15, left: 12, right: 12, top: 15),
                    decoration: BoxDecoration(
                        color: Color(clrGrey).withOpacity(0.8),
                        border: Border.all(color: Color(clrGrey)),
                        borderRadius: BorderRadius.all(Radius.circular(23))),
                    child: AutoCompleteTextSearchField(
                      inputDecoration: InputDecoration(
                        isCollapsed: false,
                        hintText: 'Search',
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black45,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600),
                        focusColor: Color(0xFF2B1137),
                        fillColor: Color(0xFF2B1137),
                        hoverColor: Color(0xFF2B1137),
                      ),
                      suggestions: searchList,
                      key: widget.key,
                      textEditingController: controller,
                      onItemSelect: (val) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return SeachView(search: val);
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
                      },
                      onSubmitted: (val) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return SeachView(search: val);
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
                      },
                    ),

                    // TextFormField(
                    //   controller: controller,
                    //   autofocus: false,
                    //   onChanged: (e) {
                    //     if(e.isEmpty){
                    //       BlocProvider.of<HomeCubit>(context).initialise();
                    //     }else{
                    //       BlocProvider.of<HomeCubit>(context).search(e);
                    //     }
                    //   },
                    //   cursorColor: Colors.black45,
                    //   textInputAction: TextInputAction.search,
                    //   style: const TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.black45,
                    //       fontWeight: FontWeight.w600),
                    //   decoration: InputDecoration(
                    //     isCollapsed: false,
                    //     hintText: 'Search',
                    //     focusedBorder: InputBorder.none,
                    //     border: InputBorder.none,
                    //     enabledBorder: InputBorder.none,
                    //     disabledBorder: InputBorder.none,
                    //     errorBorder: InputBorder.none,
                    //     focusedErrorBorder: InputBorder.none,
                    //     prefixIcon: Icon(
                    //       Icons.search,
                    //       color: Colors.black45,
                    //     ),
                    //     hintStyle: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.black45,
                    //         fontWeight: FontWeight.w600),
                    //     focusColor: Color(0xFF2B1137),
                    //     fillColor: Color(0xFF2B1137),
                    //     hoverColor: Color(0xFF2B1137),
                    //   ),
                    // ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_alt_sharp,
                        color: Color(clrBlue),
                        size: 28,
                      ))
                ],
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(const Radius.circular(5)),
                child: Container(
                  // color: zz,
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: widget.data.id.toString(),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(5)),
                      child: Image.network(
                        widget.data.image.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.data.name.toString().toUpperCase(),
                        style: TextStyle(
                          color: Color(clrBlack),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 30,
                      width:190,
                      decoration: BoxDecoration(
                          color: Color(clrGrey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: 30,
                            // width: 60,
                            padding: EdgeInsets.only(right: 15),
                            child:  DropdownButton(
                              iconEnabledColor: Color(clrBlack),
                              // Initial Value
                              value: 'UNIT'.toString(),
                              // Down Arrow Icon
                              icon:  Icon(Icons.keyboard_arrow_down_sharp,
                                  size: 18, color: Color(clrBlack)),

                              // Array list of items
                              items: items2.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(color: Color(clrBlack),  fontSize: 14),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                // BlocProvider.of<CartCubit>(context).updateCartIndex(
                                //   index: index,
                                //   image: state.cart[index].image,
                                //   title: state.cart[index].title,
                                //   type: state.cart[index].type,
                                //   dose: state.cart[index].dose,
                                //   price: state.cart[index].price,
                                //   quantity: int.parse(newValue.toString()),
                                // );

                                // BlocProvider.of<CartCubit>(context).totalCartAmount();
                              },
                            ),

                          ),
                          Container(
                            height: 30,
                            width: 1,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            // height: 30,
                            // width: 50,
                            child:  DropdownButton(
                              iconEnabledColor: Color(clrBlack),
                              // Initial Value
                              value: "PACK".toString(),
                              // Down Arrow Icon
                              icon:  Icon(Icons.keyboard_arrow_down_sharp,
                                  size: 18, color: Color(clrBlack)),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(color: Color(clrBlack), fontSize: 14),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                // BlocProvider.of<CartCubit>(context).updateCartIndex(
                                //   index: index,
                                //   image: state.cart[index].image,
                                //   title: state.cart[index].title,
                                //   type: state.cart[index].type,
                                //   dose: state.cart[index].dose,
                                //   price: state.cart[index].price,
                                //   quantity: int.parse(newValue.toString()),
                                // );

                                // BlocProvider.of<CartCubit>(context).totalCartAmount();
                              },
                            ),

                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 10),
                  child: Text(
                    '${widget.data.strength.toString()} - ${widget.data.strength.toString()}',
                    style: TextStyle(color: Colors.black38, fontSize: 17),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 10),
                  child: Text(
                    '₦${widget.data.price.toString()}.00',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Color(clrBlue), fontSize: 17),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 10),
                  child: Text(
                    '${widget.data.brand.toString()}',
                    style: TextStyle(color: Colors.black38, fontSize: 17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text(
                          ' NAFDAC APPROVED',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
                return Column(
                  children: [
                    ExpandableCardContainer(
                      expandedChild: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, top: 12, bottom: 20),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 8, bottom: 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text('Description',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 15, right: 10),
                                  child: const Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 8, left: 10),
                                  child: const Text("• ACTIVE INGREDIENTS",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.3,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("See More",
                                          style: TextStyle(
                                              color: Color(clrBlue),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Icon(
                                      state.expand == true
                                          ? EvaIcons.chevronDownOutline
                                          : EvaIcons.chevronUpOutline,
                                      color: Color(clrBlue),
                                      size: 20,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  BlocProvider.of<DetailCubit>(context)
                                      .onExpanded();
                                },
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26.withOpacity(0.2),
                                  blurRadius: 5.0,
                                  offset: Offset(0.3, 1.0))
                            ],
                            color: Colors.white,
                          ),
                        ),
                      ),
                      collapsedChild: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, top: 12, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26.withOpacity(0.2),
                                  blurRadius: 15.0,
                                  offset: Offset(0.3, 1.0))
                            ],
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 10, left: 10),
                                  child: const Text('Description',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 15, right: 10),
                                  child: const Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 8, left: 10),
                                  child: const Text("• ACTIVE INGREDIENTS",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.3,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 17, right: 10),
                                  child: const Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                      )),
                                ),
                              ),
                              GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("See More",
                                          style: TextStyle(
                                              color: Color(clrBlue),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Icon(
                                      state.expand == true
                                          ? EvaIcons.chevronDownOutline
                                          : EvaIcons.chevronUpOutline,
                                      color: Color(clrBlue),
                                      size: 20,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  BlocProvider.of<DetailCubit>(context)
                                      .onExpanded();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: state.expand,
                    ),
                  ],
                );
              }),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: const Text('Recommended Products',
                      style: TextStyle(
                          color: Color(0xFF5E5E5E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                height: 215,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        // margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          elevation: 2,
                          child: Container(
                            width: 200,
                            // padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  child: Container(
                                    // color: zz,
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/2.png',
                                      fit: BoxFit.fill,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 7),
                                      child: Text('Paracetamol'),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          'Tablet・500mg',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8),
                                      child: Text(
                                        'NGN350.00',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
