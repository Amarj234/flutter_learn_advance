

import 'package:freezed_annotation/freezed_annotation.dart';
part 'tab_state.freezed.dart';


@freezed
sealed class TabState with _$TabState {


factory TabState({
    @Default(0) int currentIndex,
  }) = _TabState;

  factory TabState.initial() => _TabState();




}