// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlocStateClass {
  List<String> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of BlocStateClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlocStateClassCopyWith<BlocStateClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlocStateClassCopyWith<$Res> {
  factory $BlocStateClassCopyWith(
          BlocStateClass value, $Res Function(BlocStateClass) then) =
      _$BlocStateClassCopyWithImpl<$Res, BlocStateClass>;
  @useResult
  $Res call({List<String> items, bool isLoading, String errorMessage});
}

/// @nodoc
class _$BlocStateClassCopyWithImpl<$Res, $Val extends BlocStateClass>
    implements $BlocStateClassCopyWith<$Res> {
  _$BlocStateClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlocStateClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlocStateClassImplCopyWith<$Res>
    implements $BlocStateClassCopyWith<$Res> {
  factory _$$BlocStateClassImplCopyWith(_$BlocStateClassImpl value,
          $Res Function(_$BlocStateClassImpl) then) =
      __$$BlocStateClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> items, bool isLoading, String errorMessage});
}

/// @nodoc
class __$$BlocStateClassImplCopyWithImpl<$Res>
    extends _$BlocStateClassCopyWithImpl<$Res, _$BlocStateClassImpl>
    implements _$$BlocStateClassImplCopyWith<$Res> {
  __$$BlocStateClassImplCopyWithImpl(
      _$BlocStateClassImpl _value, $Res Function(_$BlocStateClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlocStateClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$BlocStateClassImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlocStateClassImpl extends _BlocStateClass {
  _$BlocStateClassImpl(
      {final List<String> items = const [],
      this.isLoading = false,
      this.errorMessage = ""})
      : _items = items,
        super._();

  final List<String> _items;
  @override
  @JsonKey()
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'BlocStateClass(items: $items, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlocStateClassImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), isLoading, errorMessage);

  /// Create a copy of BlocStateClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlocStateClassImplCopyWith<_$BlocStateClassImpl> get copyWith =>
      __$$BlocStateClassImplCopyWithImpl<_$BlocStateClassImpl>(
          this, _$identity);
}

abstract class _BlocStateClass extends BlocStateClass {
  factory _BlocStateClass(
      {final List<String> items,
      final bool isLoading,
      final String errorMessage}) = _$BlocStateClassImpl;
  _BlocStateClass._() : super._();

  @override
  List<String> get items;
  @override
  bool get isLoading;
  @override
  String get errorMessage;

  /// Create a copy of BlocStateClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlocStateClassImplCopyWith<_$BlocStateClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
