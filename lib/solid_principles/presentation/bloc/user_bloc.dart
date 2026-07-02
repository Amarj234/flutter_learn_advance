import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_more/solid_principles/domain/usecases/user_usecase.dart';

import 'package:learn_more/solid_principles/presentation/bloc/user_state.dart';

class UserBloc extends Cubit<UserState> {
  final UserUsecase userUsecase;
  UserBloc(this.userUsecase) : super(UserInitialState()) {
    getData(BuildContext context) async {
      final data = await userUsecase.getUser(context);
    }
  }
}
