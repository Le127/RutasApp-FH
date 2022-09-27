part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInicialized;
  final bool followUser;

  const MapState({this.isMapInicialized = false, this.followUser = false});

  MapState copyWith({
    bool? isMapInicialized,
    bool? followUser,
  }) =>
      MapState(
        isMapInicialized: isMapInicialized ?? this.isMapInicialized,
        followUser: followUser ?? this.followUser,
      );

  @override
  List<Object> get props => [isMapInicialized, followUser];
}
