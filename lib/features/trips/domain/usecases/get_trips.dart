import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/core/utilities/usecases.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';
import 'package:peak_mates/features/trips/domain/repositories/trip_repo.dart';

class GetTrips extends SteramUsecaseWithoutParams<List<Trip>> {
  final TripRepo _repo;

  const GetTrips(this._repo);

  @override
  ResultStream<List<Trip>> call() => _repo.getTrips();
}
