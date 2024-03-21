part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  @override
  String toString() => 'Home Event';
}

final class HomeUserLogOutEvent extends HomeEvent {
  @override
  String toString() => 'Home User Log Out Event';
}
