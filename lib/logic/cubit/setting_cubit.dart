import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(const SettingState(
            appNotification: false, emailNotification: false));

  void toggleAppNotification() {
    emit(
      state.copyWith(
        appNotification: !state.appNotification,
      ),
    );
  }

  void toggleEmailNotification() {
    emit(
      state.copyWith(
        emailNotification:! state.emailNotification,
      ),
    );
  }
}
