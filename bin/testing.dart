import 'package:testing/bloc/connectivity_bloc.dart';

void main(List<String> arguments) {
  final bloc = ConnectivityBloc();

  bloc.add(ConnectEvent());

  Future.delayed(Duration(seconds: 10));
}
