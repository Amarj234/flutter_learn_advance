import 'package:equatable/equatable.dart';

class EquatableState extends Equatable {
  final List<String> items;
  final bool isLoading;
  final String errorMessage;

  const EquatableState({
    this.items = const [],
    this.isLoading = false,
    this.errorMessage = "",
  });

  // to replace copyWith from freezed
  EquatableState copyWith({
    List<String>? items,
    bool? isLoading,
    String? errorMessage,
  }) {
    return EquatableState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, errorMessage];
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
