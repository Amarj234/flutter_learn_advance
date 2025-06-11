import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState.loading() = _Loading;

  const factory UserState.success({
   @Default("")  String? name,
    @Default("")    String? email,
    @Default("")    String? phone,
  }) = _Success;

  const factory UserState.failure(String? error) = _Failure;
  const factory UserState.initial() = _Initial;

}