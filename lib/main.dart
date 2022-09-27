import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:maps_app/blocs/blocs.dart';

import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<GpsBloc>(create: (context) => GpsBloc()),
    BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
    BlocProvider<MapBloc>(create: (context) => MapBloc()),
  ], child: const MapsApp()));
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapsApp',
      home: LoadingScreen(),
    );
  }
}
