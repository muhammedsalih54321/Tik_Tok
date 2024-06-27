part of 'vidios_bloc.dart';

@immutable
sealed class VidiosState {}

final class VidiosInitial extends VidiosState {}
class Vidiosblocloading extends VidiosState {}
class Vidiosblocloaded extends VidiosState {}
class Vidiosblocerror extends VidiosState {}
