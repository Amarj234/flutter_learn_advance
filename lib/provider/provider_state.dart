import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_state.freezed.dart';

@freezed
class ProviderState with _$ProviderState {
  const ProviderState._();

  const factory ProviderState.loading() = _Loading;

  const factory ProviderState.success({
    @Default("")  String? name,
    @Default("")    String? email,
    @Default("")    String? phone,
  }) = _Success;

  const factory ProviderState.failure(String? error) = _Failure;
  const factory ProviderState.initial() = _Initial;

}