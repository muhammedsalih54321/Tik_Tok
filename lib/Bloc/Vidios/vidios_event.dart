part of 'vidios_bloc.dart';

@immutable
sealed class VidiosEvent {}
class fetchvideoevent extends VidiosEvent{
  final String name;

  fetchvideoevent({required this.name});
}
 
