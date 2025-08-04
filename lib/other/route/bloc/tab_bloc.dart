


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/other/route/bloc/tab_event.dart';

import 'tab_state.dart';

class TabBloc extends Bloc<TabEvent,TabState>{
  TabBloc(): super(TabState.initial()) {
    on<GetTabsEvent>(_getTabs);
  }

  void _getTabs(GetTabsEvent event, Emitter<TabState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }}