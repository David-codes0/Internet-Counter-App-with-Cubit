// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:developer' as devtools;

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  // final InternetCubit internetCubit;

  // StreamSubscription? internetConnectivtyStream;
  // CounterCubit({required this.internetCubit})
  //     : super(const CounterState(counterValue: 0)) {
  //   monitorInternetStream();
  // }

  CounterCubit() : super(const CounterState(counterValue: 0));

  // StreamSubscription<InternetState> monitorInternetStream() {
  //   return internetConnectivtyStream =
  //       internetCubit.stream.listen((internetstate) {
  //     if (internetstate is InternetConnected &&
  //         internetstate.connectivityType == ConnectivityType.wifi) {
  //       increment();
  //     } else if (internetstate is InternetConnected &&
  //         internetstate.connectivityType == ConnectivityType.mobile) {
  //       decrement();
  //     } else if (internetstate is InternetDisconnected) {
  //       emit(CounterState(counterValue: state.counterValue + 100));
  //     }
  //   });
  // }

  void increment() => emit(
        CounterState(
            counterValue: state.counterValue + 1, wasIncremented: true),
      );
  void decrement() => emit(
        CounterState(
            counterValue: state.counterValue - 1, wasIncremented: false),
      );

  @override
  void onChange(Change<CounterState> change) {
    devtools.log('$change');
    super.onChange(change);
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    devtools.log('$json json' );
    // This function is called eveytime the application needs stored datas
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    devtools.log('$state state');
    // This function  is called for every counterState emitted to store the counterState into the app directory
    // so that when next the opened again it will call the fromJson👆👆👆 function
    return state.toMap();
  }
}
