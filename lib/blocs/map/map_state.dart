part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInicialized;
  final bool isFollowingUser;
  final bool showMyRoute;

  // Polylines
  final Map<String, Polyline> polylines;

  /* Ejemplo polyline:
  
    "mi_ruta: {
      id:polylineID Google,
      points: [[lat,lng],[123123,123123],[654,6545]],
      width:3,
      color: black87
    }"
  
   */

  const MapState({
    this.isMapInicialized = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    Map<String, Polyline>? polylines,
  }) : polylines = polylines ??
            const {}; //Si no se le pasa valor, por defecto asigna  {} a polylines

  MapState copyWith(
          {bool? isMapInicialized,
          bool? isFollowingUser,
          bool? showMyRoute,
          Map<String, Polyline>? polylines}) =>
      MapState(
          isMapInicialized: isMapInicialized ?? this.isMapInicialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          polylines: polylines ?? this.polylines,
          showMyRoute: showMyRoute ?? this.showMyRoute);

  @override
  List<Object> get props =>
      [isMapInicialized, isFollowingUser, polylines, showMyRoute];
}
