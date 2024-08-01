import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';

abstract class TripRepo {
  const TripRepo();

  ResultStream<List<Trip>> getTrips();
  ResultFuture<void> addTrip(Trip trip);
}
