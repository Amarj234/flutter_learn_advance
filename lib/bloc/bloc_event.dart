import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part "bloc_event.freezed.dart";

@freezed
sealed class BlocEvent {
  const BlocEvent._();
  const factory BlocEvent.initial() = Initial;
  const factory BlocEvent.load() = Load;
  const factory BlocEvent.add(String text) = Add;
  const factory BlocEvent.remove(int index) = Remove;
  const factory BlocEvent.update(int index, String text) = Update;
  const factory BlocEvent.clear() = Clear;
}