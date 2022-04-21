import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {

  onExpanded(){
    if(state.expand == true){
      emit(DetailState(expand: false));
    }else{
      emit(DetailState(expand: true));
    }

  }

  DetailCubit() : super(DetailState(expand: true));
}
