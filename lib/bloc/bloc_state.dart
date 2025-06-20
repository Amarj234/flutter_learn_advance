import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_more/api/my_result.dart';
part 'bloc_state.freezed.dart';

// @freezed
// sealed class BlocState {
//   const BlocState._();
//
//   const factory BlocState.initial() = _Initial;
//   const factory BlocState.loading() = _Loading;
//   const factory BlocState.loaded(List<String> items) = _Loaded;
//   const factory BlocState.error(String message) = _Error;
// }

// another way to define BlocState

@freezed
sealed class BlocStateClass with _$BlocStateClass {
  const BlocStateClass._();
  factory BlocStateClass.initial() => _BlocStateClass();

  factory BlocStateClass({
    @Default([]) List<String> items,
    @Default(false) bool isLoading,
    @Default("") String errorMessage,
  }) = _BlocStateClass;
}
