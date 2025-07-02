



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/bloc/bloc.dart';


// if you use cubit then you not need a event class 
// with Cubit we need only State class 

class BlocCubit extends Cubit<BlocStateClass>{
BlocCubit():super(BlocStateClass.initial());

void loadData()async{

emit(state.copyWith(isLoading: true));


  await  Future.delayed(Duration(seconds: 2));
    if (isClosed) return;
      // After loading, emit the loaded state with some dummy data
      emit(state.copyWith(
        items: ['Item 1', 'Item 2', 'Item 3'],
        isLoading: false,
      ));

}

  
}