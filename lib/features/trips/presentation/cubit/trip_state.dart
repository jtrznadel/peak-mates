part of 'trip_cubit.dart';

sealed class TripState extends Equatable {
  const TripState();

  @override
  List<Object> get props => [];
}

final class TripInitial extends TripState {}

final class LoadingTrips extends TripState {}

final class TripsLoaded extends TripState {
  const TripsLoaded(this.trips);

  final List<Trip> trips;

  @override
  List<Object> get props => [trips];
}

final class AddingTrip extends TripState {}

final class TripAdded extends TripState {}

final class TripError extends TripState {
  const TripError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
