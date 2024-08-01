import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/core/utilities/usecases.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';
import 'package:peak_mates/features/trips/domain/repositories/trip_repo.dart';

class AddTrip extends FutureUsecaseWithParams<void, Trip> {
  final TripRepo _repo;

  const AddTrip(this._repo);

  @override
  ResultFuture<void> call(Trip params) => _repo.addTrip(params);
}
