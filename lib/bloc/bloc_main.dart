import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class BlocMain extends Bloc<BlocEvent,BlocStateClass> {
  BlocMain() : super(BlocStateClass.initial()){
    on<Load>(_loadFunction);
  }


  _loadFunction(Load event, Emitter<BlocStateClass> emit) {

    // Simulate a loading process
     emit(state.copyWith(
     isLoading: true,
      errorMessage: '',
    ));
    Future.delayed(Duration(seconds: 2), () {
      // After loading, emit the loaded state with some dummy data
      emit(state.copyWith(
        items: ['Item 1', 'Item 2', 'Item 3'],
        isLoading: false,
      ));
    });
  }
}