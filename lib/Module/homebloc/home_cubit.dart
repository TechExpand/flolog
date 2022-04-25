import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../Model/suggestion.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static List<Suggestion> data = [

  ];
  String mainUrl = "https://app.flolog.co/api";
  // https://app.flolog.co/api/products
  Future getProducts() async {
    try {
      var response =
      await http.get(Uri.parse('$mainUrl/products'),
          headers: {
            "Content-type": "application/json",
        // 'Authorization': 'Bearer $bearer',
      });


      var body = json.decode(response.body);
      List result = body['products'];
      List<Suggestion> productList = result.map((data) {
        return Suggestion.fromJson(data);
      }).toList();

      if (response.statusCode  <= 300) {
        print(productList.length);
        print(productList.length);
        data = productList;
        emit (HomeState(suggestions: data, search: ''));
        return productList;
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
    }
  }




  initialise(){
     List<Suggestion> data = [

    ];
     emit (HomeState(suggestions: data, search: ''));

  }


  search(String value){
  List<Suggestion>  updatedData = data
        .where((e) => e.title.toString()
        .toLowerCase()
        .contains(value.toLowerCase()))
        .toList();
    emit (HomeState(suggestions: updatedData, search: value));
  }



  HomeCubit() : super(HomeState(suggestions: data, search: ''));
}
