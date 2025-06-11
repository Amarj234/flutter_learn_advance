// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocEventCopyWith<$Res> {
  factory $BlocEventCopyWith(BlocEvent value, $Res Function(BlocEvent) then) =
      _$BlocEventCopyWithImpl<$Res, BlocEvent>;
}

/// @nodoc
class _$BlocEventCopyWithImpl<$Res, $Val extends BlocEvent>
    implements $BlocEventCopyWith<$Res> {
  _$BlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'BlocEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends BlocEvent {
  const factory Initial() = _$InitialImpl;
  const Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl extends Load {
  const _$LoadImpl() : super._();

  @override
  String toString() {
    return 'BlocEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load extends BlocEvent {
  const factory Load() = _$LoadImpl;
  const Load._() : super._();
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$AddImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddImpl extends Add {
  const _$AddImpl(this.text) : super._();

  @override
  final String text;

  @override
  String toString() {
    return 'BlocEvent.add(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return add(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return add?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add extends BlocEvent {
  const factory Add(final String text) = _$AddImpl;
  const Add._() : super._();

  String get text;

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveImpl extends Remove {
  const _$RemoveImpl(this.index) : super._();

  @override
  final int index;

  @override
  String toString() {
    return 'BlocEvent.remove(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return remove(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return remove?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class Remove extends BlocEvent {
  const factory Remove(final int index) = _$RemoveImpl;
  const Remove._() : super._();

  int get index;

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String text});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? text = null,
  }) {
    return _then(_$UpdateImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateImpl extends Update {
  const _$UpdateImpl(this.index, this.text) : super._();

  @override
  final int index;
  @override
  final String text;

  @override
  String toString() {
    return 'BlocEvent.update(index: $index, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, text);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return update(index, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return update?.call(index, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(index, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update extends BlocEvent {
  const factory Update(final int index, final String text) = _$UpdateImpl;
  const Update._() : super._();

  int get index;
  String get text;

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$BlocEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl extends Clear {
  const _$ClearImpl() : super._();

  @override
  String toString() {
    return 'BlocEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() load,
    required TResult Function(String text) add,
    required TResult Function(int index) remove,
    required TResult Function(int index, String text) update,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? load,
    TResult? Function(String text)? add,
    TResult? Function(int index)? remove,
    TResult? Function(int index, String text)? update,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? load,
    TResult Function(String text)? add,
    TResult Function(int index)? remove,
    TResult Function(int index, String text)? update,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(Update value) update,
    required TResult Function(Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(Update value)? update,
    TResult? Function(Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(Update value)? update,
    TResult Function(Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class Clear extends BlocEvent {
  const factory Clear() = _$ClearImpl;
  const Clear._() : super._();
}
