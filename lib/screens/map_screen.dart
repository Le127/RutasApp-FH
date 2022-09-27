import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_app/blocs/blocs.dart';
import 'package:maps_app/views/map_view.dart';
import 'package:maps_app/widgets/btn_location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getCurrentPosition();

    return locationBloc.startFollowingUsers();
  }

  @override
  void dispose() {
    //locationBloc se inicializa en initState
    locationBloc.stopFollowingUsers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnowLocation == null) {
            return const Center(child: Text("Espere por favor..."));
          }

          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(
                  initialLocation: state.lastKnowLocation!,
                ),

                //TODO: botones...
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          BtnCurrentLocation(),
        ],
      ),
    );
  }
}
