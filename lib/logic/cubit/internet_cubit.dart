// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cubit_bloc_counter1/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
final Connectivity connectivity;
StreamSubscription? streamSubscriptionConnectivity;

InternetCubit({required  this.connectivity,}) : super(InternetLoading()){
monitorConnnectivity();
  }


  StreamSubscription<ConnectivityResult> monitorConnnectivity() {
    return streamSubscriptionConnectivity = connectivity.onConnectivityChanged.listen((conectivityResult) { 
if(conectivityResult == ConnectivityResult.wifi){
     emitInternetConnected(ConnectivityType.wifi);
}else if(conectivityResult == ConnectivityResult.mobile){
     emitInternetConnected(ConnectivityType.mobile);
}else if(conectivityResult == ConnectivityResult.none) {
  emitInternetDisconnected();
}
});
  }

void emitInternetConnected(ConnectivityType connectiontype){
  emit(InternetConnected(connectivityType:  connectiontype));
}
void emitInternetDisconnected(){
  emit(InternetDisconnected());
}
}
