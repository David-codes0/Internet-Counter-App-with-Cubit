import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cubit_bloc_counter1/logic/cubit/counter_cubit.dart';
import 'package:cubit_bloc_counter1/logic/cubit/internet_cubit.dart';
import 'package:cubit_bloc_counter1/logic/cubit/setting_cubit.dart';
import 'package:cubit_bloc_counter1/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      connectivity: Connectivity(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => SettingCubit(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: RoutesManager.homeScreen,
        onGenerateRoute: RoutesManager.getRoute,
      ),
    );
  }
}
