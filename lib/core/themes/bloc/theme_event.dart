part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class AppThemeChangeEvent extends ThemeEvent {
  final ThemeData themeData;
  AppThemeChangeEvent(this.themeData);
  @override
  String toString() => 'App Theme Change Event';
}
