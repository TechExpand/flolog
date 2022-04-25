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

class Profile extends StatelessWidget {
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 65,
              color: Color(clrBlue),
              child: Center(
                child: Text('Personal Info', style: TextStyle(color: Colors.white, fontSize: 23),),
              ),
            ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Center(
                  child: Text('Hello, Efosa!', style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 20),),
                ),
              ),


              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFE8F1FD), width: 6)
                      ),
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage:
                        AssetImage('assets/images/4.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),


                  Positioned(
                    right: MediaQuery.of(context).size.width*0.3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue),
                          child: Center(
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              ))),
                    ),
                  )
                ],
              ),


              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 25, left: 15),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width / 0.5,
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    // data.setEmail(value);
                  },
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: 'Emonbeifo Efosa Enoch',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 5, left: 15),
                child: Text(
                  'Compnay/Organization',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width / 0.5,
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    // data.setEmail(value);
                  },
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: 'Fosa Pharmacy',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(bottom: 5.0,top: 5, left: 15),
                child: Text(
                  'Email/ID',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width / 0.5,
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    // data.setEmail(value);
                  },
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: 'emonbeifoeosasere@gmail.com',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 5, left: 15),
                child: Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width / 0.5,
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    // data.setEmail(value);
                  },
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: '08098765434',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text('Status:', style: TextStyle(fontSize: 17),),
    Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8, bottom: 20),
      child: Container(
        margin: const EdgeInsets.only(left: 5.0),
        height: 25,
        width: 100,
        child: Center(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4,right: 4),
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
            color: Colors.green,
            borderRadius:
            BorderRadius.circular(5)),
      ),
    ),
  ],
)
            ],
          ),
        ));
  }
}
