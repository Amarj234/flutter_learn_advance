import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:learn_more/api/my_result.dart';
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

//🚀 🔥 freezed vs Equatable for State

// | Feature                           | `Equatable`                                    | `freezed`                                                                   |
// | --------------------------------- | ---------------------------------------------- | --------------------------------------------------------------------------- |
// | ✅ **Equality**                    | ✔ Helps with `==` & `hashCode`                 | ✔ Also gives `==` & `hashCode`                                              |
// | ✂️ **Boilerplate**                | ❌ You write `copyWith` & constructors yourself | ✅ Generates `copyWith`, `toString`, etc automatically                       |
// | 🪄 **Immutability**               | ❌ Up to you to enforce                         | ✅ Generates immutable data classes                                          |
// | ⚡ **Sealed unions** (union types) | ❌ Not supported                                | ✅ Supports union types (multiple factory constructors for different states) |
// | 🔥 **Pattern matching**           | ❌ Not supported directly                       | ✅ Use `when`, `maybeWhen`, `map`, etc                                       |
// | 🐞 **Null safety defaults**       | ❌ You manage manually                          | ✅ Can use `@Default()` on fields                                            |
// | 📦 **Dependencies**               | Only `equatable` (small)                       | `freezed` + `build_runner` + `json_serializable` (heavier)                  |
