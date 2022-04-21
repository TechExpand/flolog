import 'dart:ui';
import 'package:flolog/Module/homebloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Contants/color.dart';
import '../../Widget/AutoComplete.dart';
import '../detailBloc/detail_view.dart';
import '../searchBloc/search_view.dart';

class SearchData {
  final String name;

  SearchData(this.name);
}

class HomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Color(clrBlack),
          ),
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
        body: Container(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
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
                      key: key,
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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.search.isNotEmpty
                      ? Container()
                      : Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         'CATEGORIES',
                              //         style: TextStyle(
                              //           color: Colors.black38,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //       InkWell(
                              //         onTap: (){
                              //           // Navigator.push(
                              //           //   context,
                              //           //   PageRouteBuilder(
                              //           //     pageBuilder:
                              //           //         (context, animation, secondaryAnimation) {
                              //           //       return CategoryPage();
                              //           //     },
                              //           //     transitionsBuilder: (context, animation,
                              //           //         secondaryAnimation, child) {
                              //           //       return FadeTransition(
                              //           //         opacity: animation,
                              //           //         child: child,
                              //           //       );
                              //           //     },
                              //           //   ),
                              //           // );
                              //
                              //         },
                              //         child: Text(
                              //           'VIEW ALL',
                              //           style: TextStyle(
                              //               color: Color(0xFFB464F8),
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
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
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 8),
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
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0,
                                                    left: 9,
                                                    bottom: 3),
                                                child: Text(
                                                  "nonsipa".toUpperCase(),
                                                  style: TextStyle(
                                                    color: Color(clrBlack),
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 9),
                                                child: Text(
                                                  "\$${95}".toUpperCase(),
                                                  style: TextStyle(
                                                      color: Color(clrBlue),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, bottom: 3, top: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Best Deals',
                                      style: TextStyle(
                                        color: Color(clrBlack),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   PageRouteBuilder(
                                        //     pageBuilder:
                                        //         (context, animation, secondaryAnimation) {
                                        //       return CategoryPage();
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
                                      },
                                      child: Text(
                                        'See More',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(clrBlue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 5.5,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 20),
                        itemCount: state.suggestions.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailPage(data:state.suggestions[index]);
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: Container(
                                          height: 240,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          child: Hero(
                                            tag: state.suggestions[index].id
                                                .toString(),
                                            child: Image.asset(
                                              state.suggestions[index].image
                                                  .toString(),
                                              fit: BoxFit.fill,
                                              height: 240,
                                              // width: 180,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 7),
                                        child: Text(
                                          "${state.suggestions[index].title}"
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Color(clrBlack),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 2),
                                          child: Text(
                                            "${state.suggestions[index].type}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black38),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 8),
                                        child: Text(
                                          "₦${state.suggestions[index].price}.00",
                                          style: TextStyle(
                                              color: Color(clrBlue),
                                              fontSize: 16,
                                              fontFamily: "Roboto"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
