import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_event.freezed.dart';



@freezed
sealed class TabEvent  with _$TabEvent {
  const TabEvent._();
  const factory TabEvent.getTabs(int index) = GetTabsEvent;
}