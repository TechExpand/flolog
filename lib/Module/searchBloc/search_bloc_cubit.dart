import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bloc_state.dart';

class SearchBlocCubit extends Cubit<SearchBlocState> {
  SearchBlocCubit() : super(SearchBlocInitial());
}
