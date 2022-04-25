import 'dart:ui';

import 'package:flolog/Module/homebloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Contants/color.dart';

class SeachView extends StatelessWidget {
  final search;
  SeachView({this.search});
  TextEditingController controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(

            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
        ),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('No filters applied', style: TextStyle(color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
            SizedBox(
              width: 50,
            ),
            Container(
              child: Center(child: Text('FILTER', style: TextStyle(color: Colors.white),)),
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                color: Color(clrBlue),
                borderRadius: BorderRadius.circular(5)
              ),
            )
          ],
        ),
      ),
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back_ios, color: Color(clrBlack),)),
        ),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [

              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(
                    Icons.filter_alt_sharp,
                    color: Color(clrBlue),
                    size: 28,
                  )),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.69,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 12),
                    margin: const EdgeInsets.only(
                        bottom: 15, left: 12, right: 12, top: 15),
                    decoration: BoxDecoration(
                        color: Color(clrGrey).withOpacity(0.8),
                        border: Border.all(color: Color(clrGrey)),
                        borderRadius:
                        BorderRadius.all(Radius.circular(23))),
                    child: TextFormField(
                      controller: controller,
                      autofocus: false,
                      onChanged: (e) {
                        if(e.isEmpty){
                          BlocProvider.of<HomeCubit>(context).initialise();
                        }else{
                          BlocProvider.of<HomeCubit>(context).search(e);
                        }
                      },
                      cursorColor: Colors.black45,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        isCollapsed: false,
                        hintText: search,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        // prefixIcon: Icon(
                        //   Icons.search,
                        //   color: Colors.black45,
                        // ),
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(clrBlack),
                            fontWeight: FontWeight.w600),
                        focusColor: Color(0xFF2B1137),
                        fillColor: Color(0xFF2B1137),
                        hoverColor: Color(0xFF2B1137),
                      ),
                    ),
                  ),
                 Container(
                   height: 45,
                   width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(clrBlue),
                  ),
                   child:  Center(
                     child: IconButton(onPressed: (){}, icon: Icon(
                       Icons.search ,
                       color: Colors.white,
                       size: 28,
                     )),
                   ),
                 )
                ],
              ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 15),
              height: 40,
              child: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  labelColor: Colors.black87,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  unselectedLabelColor: Colors.black45,
                  tabs: [
                    Tab(
                      child: Text('All'),
                    ),
                    Tab(
                      child: Text('Pain Killers'),
                    ),
                    Tab(
                      child: Text('Vitamins'),
                    ),
                    Tab(
                      child: Text('Infusions'),
                    ),
                  ],
                ),
              ),
            ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20),
                        itemCount: state.suggestions.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){
                              // Navigator.push(
                              //   context,
                              //   PageRouteBuilder(
                              //     pageBuilder:
                              //         (context, animation, secondaryAnimation) {
                              //       return DetailPage(data:state.suggestions[index]);
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        child: Container(
                                          height: 240,
                                          width: MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          child: Hero(
                                            tag: state.suggestions[index].id.toString(),
                                            child: Image.asset(
                                              state.suggestions[index].image.toString(),
                                              fit: BoxFit.fill,
                                              height: 240,
                                              // width: 180,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(5))),
                                        ),
                                      ),


                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0, top: 7),
                                        child: Text("${state.suggestions[index].title}".toUpperCase(), style: TextStyle(
                                          color: Color(clrBlack),
                                          fontSize: 16,

                                        ),),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(left:8.0, top: 2),
                                          child: Text("${state.suggestions[index].label}",  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38),)),

                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0, top: 8),
                                        child: Text("₦${state.suggestions[index].price}.00", style: TextStyle(
                                            color: Color(clrBlue),
                                            fontSize: 16,
                                            fontFamily: "Roboto"
                                        ),),
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
