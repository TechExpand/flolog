import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Model/suggestion.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static List<Suggestion> data = [
    Suggestion(
        title: "Paracetamol",
        type: "Tablet",
        prescription: false,
        id: 1,
        price: 350,
        dose: 500,
        image: "assets/images/1.png"
    ),

    Suggestion(
        title: "Doliprane",
        type: "Capsule",
      prescription: true,
        id: 2,
      price: 350,
      dose: 1000,
        image: "assets/images/2.png"
    ),

    Suggestion(
        title: "Paracetamol",
        type: "Tablet",
        prescription: true,
        price: 350,
        id: 3,
        dose: 500,
        image: "assets/images/3.png"
    ),


    Suggestion(
        title: "Ibuprofen",
        type: "Tablet",
        prescription: false,
        price: 350,
        id: 4,
        dose: 200,
        image: "assets/images/4.png"
    ),


    Suggestion(
        title: "Panadol",
        type: "Tablet",
        prescription: false,
        price: 350,
        dose: 500,
        id: 5,
        image: "assets/images/5.png"
    ),

    Suggestion(
        title: "Ibuprufen",
        type: "Tablet",
        prescription: false,
        price: 350,
        id: 6,
        dose: 400,
        image: "assets/images/6.png"
    ),

  ];

  initialise(){
     List<Suggestion> data = [
      Suggestion(
          title: "Paracetamol",
          type: "ORAL SUSPENSION",
          prescription: false,
          id: 1,
          price: 350,
          dose: 500,
          image: "assets/images/1.png"
      ),

      Suggestion(
          title: "Doliprane",
          type: "ORAL SUSPENSION",
          prescription: true,
          id: 2,
          price: 350,
          dose: 1000,
          image: "assets/images/2.png"
      ),

      Suggestion(
          title: "Paracetamol",
          type: "ORAL SUSPENSION",
          prescription: true,
          price: 350,
          id: 3,
          dose: 500,
          image: "assets/images/3.png"
      ),


      Suggestion(
          title: "Ibuprofen",
          type: "ORAL SUSPENSION",
          prescription: false,
          price: 350,
          id: 4,
          dose: 200,
          image: "assets/images/4.png"
      ),


      Suggestion(
          title: "Panadol",
          type: "ORAL SUSPENSION",
          prescription: false,
          price: 350,
          dose: 500,
          id: 5,
          image: "assets/images/5.png"
      ),

      Suggestion(
          title: "Ibuprufen",
          type: "ORAL SUSPENSION",
          prescription: false,
          price: 350,
          id: 6,
          dose: 400,
          image: "assets/images/6.png"
      ),

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
