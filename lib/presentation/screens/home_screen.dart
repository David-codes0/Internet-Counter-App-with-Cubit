import 'package:cubit_bloc_counter1/constants/enums.dart';
import 'package:cubit_bloc_counter1/logic/cubit/counter_cubit.dart';
import 'package:cubit_bloc_counter1/logic/cubit/internet_cubit.dart';
import 'package:cubit_bloc_counter1/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('incremented'),
                    duration: Duration(milliseconds: 100),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('decremented'),
                    duration: Duration(milliseconds: 100),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAA ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const Divider(
              thickness: 4,
              height: 10,
            ),
            const Text('For the network connection'),
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, internetstate) {
                if (internetstate is InternetConnected &&
                    internetstate.connectivityType == ConnectivityType.wifi) {
                  context.read<CounterCubit>().increment();
                } else if (internetstate is InternetConnected &&
                    internetstate.connectivityType == ConnectivityType.mobile) {
                  context.read<CounterCubit>().decrement();
                }
              },
              builder: (context, state) {
                return BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetConnected &&
                        state.connectivityType == ConnectivityType.wifi) {
                      return Text(
                        'Wifi',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.green),
                      );
                    } else if (state is InternetDisconnected) {
                      return Text(
                        'Disconnected',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.grey),
                      );
                    } else if (state is InternetConnected &&
                        state.connectivityType == ConnectivityType.mobile) {
                      return Text(
                        'Mobile',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.red),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutesManager.secondScreen),
              color: Colors.red,
              child: const Text(
                'Second screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutesManager.thirdScreen),
              color: Colors.black,
              child: const Text(
                'Third screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutesManager.settingScreen),
              color: Colors.black,
              child: const Text(
                'Setting screen',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
