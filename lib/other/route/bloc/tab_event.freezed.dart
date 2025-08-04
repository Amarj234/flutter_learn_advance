// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabEvent {

 int get index;
/// Create a copy of TabEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabEventCopyWith<TabEvent> get copyWith => _$TabEventCopyWithImpl<TabEvent>(this as TabEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabEvent&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'TabEvent(index: $index)';
}


}

/// @nodoc
abstract mixin class $TabEventCopyWith<$Res>  {
  factory $TabEventCopyWith(TabEvent value, $Res Function(TabEvent) _then) = _$TabEventCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$TabEventCopyWithImpl<$Res>
    implements $TabEventCopyWith<$Res> {
  _$TabEventCopyWithImpl(this._self, this._then);

  final TabEvent _self;
  final $Res Function(TabEvent) _then;

/// Create a copy of TabEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class GetTabsEvent extends TabEvent {
  const GetTabsEvent(this.index): super._();
  

@override final  int index;

/// Create a copy of TabEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTabsEventCopyWith<GetTabsEvent> get copyWith => _$GetTabsEventCopyWithImpl<GetTabsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTabsEvent&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'TabEvent.getTabs(index: $index)';
}


}

/// @nodoc
abstract mixin class $GetTabsEventCopyWith<$Res> implements $TabEventCopyWith<$Res> {
  factory $GetTabsEventCopyWith(GetTabsEvent value, $Res Function(GetTabsEvent) _then) = _$GetTabsEventCopyWithImpl;
@override @useResult
$Res call({
 int index
});




}
/// @nodoc
class _$GetTabsEventCopyWithImpl<$Res>
    implements $GetTabsEventCopyWith<$Res> {
  _$GetTabsEventCopyWithImpl(this._self, this._then);

  final GetTabsEvent _self;
  final $Res Function(GetTabsEvent) _then;

/// Create a copy of TabEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(GetTabsEvent(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
