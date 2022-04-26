import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription _subscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    _subscription = Connectivity().onConnectivityChanged.listen(_onAddEvent);
    on<ConnectEvent>(_onConnectEventToState);
    on<DisconnectEvent>(_onDisconnectEventToState);
  }

  void _onAddEvent(ConnectivityResult event) {
    if (event == ConnectivityResult.ethernet ||
        event == ConnectivityResult.mobile ||
        event == ConnectivityResult.wifi) {
      add(ConnectEvent());
    } else {
      add(DisconnectEvent());
    }
  }

  FutureOr<void> _onConnectEventToState(
      ConnectEvent event, Emitter<ConnectivityState> emit) {
    print("connecting");
  }

  FutureOr<void> _onDisconnectEventToState(
      DisconnectEvent event, Emitter<ConnectivityState> emit) {
    print('disconnecting');
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
