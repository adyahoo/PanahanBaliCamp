part of 'venue_cubit.dart';

abstract class VenueState extends Equatable {
  const VenueState();
}

class VenueInitial extends VenueState {
  @override
  List<Object> get props => [];
}

class VenueLoaded extends VenueState {
  final List<VenueModel>? venues;

  VenueLoaded(this.venues);

  @override
  List<Object?> get props => [venues];
}

class VenueLoadedFailed extends VenueState {
  final String? msg;

  VenueLoadedFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}