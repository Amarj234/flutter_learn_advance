import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<String> myList;
  UserLoaded({required this.myList});

  UserLoaded copyWith({List<String>? list}) {
    return UserLoaded(myList: list ?? this.myList);
  }

  @override
  List<Object?> get props => [myList];
}
