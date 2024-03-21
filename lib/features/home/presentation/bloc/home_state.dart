part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  @override
  String toString() => 'Home State';
}

final class HomeInitial extends HomeState {
  @override
  String toString() => 'Home Initial';
}

final class HomeLoading extends HomeState {
  @override
  String toString() => 'Home Loading';
}

final class HomeLogOut extends HomeState {
  @override
  String toString() => 'Home Log Out';
}

final class HomeFailed extends HomeState {
  final String message;
  HomeFailed({required this.message});

  @override
  String toString() => 'Home Failed';
}
