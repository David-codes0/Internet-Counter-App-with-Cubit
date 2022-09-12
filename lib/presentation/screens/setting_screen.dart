import 'package:cubit_bloc_counter1/logic/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtools;

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'App ${state.appNotification}. Email ${state.emailNotification}'),
              duration: const Duration(milliseconds: 100),
            ),
          );
        },
        builder: (context, state) {
            devtools.log(' app not ${state.appNotification}');
             devtools.log(' app not ${state.emailNotification}');
          return Column(
            children: [
              SwitchListTile(
                activeColor: Colors.black,
                value: state.appNotification,
                onChanged: (newValue) {
                  context.read<SettingCubit>().toggleAppNotification();
                  devtools.log('$newValue');
                },
                title: const Text('App Notification'),
              ),
              SwitchListTile(
                activeColor: Colors.black,
                value: state.emailNotification,
                onChanged: (newValue) {
                  devtools.log('$newValue');
                  context.read<SettingCubit>().toggleEmailNotification();
                },
                title: const Text('Email Notification'),
              )
            ],
          );
        },
      ),
    );
  }
}
