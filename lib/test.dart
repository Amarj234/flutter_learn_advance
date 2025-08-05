

 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/bloc/bloc.dart';

class MyBloc extends Bloc<BlocEvent,BlocStateClass>{
  MyBloc():super(BlocStateClass()){
    on<Load>(_load);
  }

  _load(Load event,Emitter<BlocStateClass> emit){



  }

}