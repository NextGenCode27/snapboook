part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  @override
  String toString() => 'Home State';
}

final class HomeInitial extends HomeState {
  final int currentIndex;
  HomeInitial({required this.currentIndex});
  @override
  String toString() => 'Home Initial';
}

final class HomeLoading extends HomeState {
  @override
  String toString() => 'Home Loading';
}

final class HomeSuccess extends HomeState {
  final int currentIndex;
  HomeSuccess({required this.currentIndex});
  @override
  String toString() => 'Home Success';
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
