part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class ConnectEvent extends ConnectivityEvent {}

class DisconnectEvent extends ConnectivityEvent {}
