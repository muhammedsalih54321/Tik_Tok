part of 'tiktok_bloc.dart';

@immutable
sealed class TiktokState {}

final class TiktokInitial extends TiktokState {}
 class TiktokIblocloading extends TiktokState {}
 class Tiktokblocloaded extends TiktokState {}
 class Tiktokblocerror extends TiktokState {}