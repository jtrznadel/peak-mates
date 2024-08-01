import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:peak_mates/core/errors/exceptions.dart';
import 'package:peak_mates/core/errors/failures.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/trips/data/datasources/trip_remote_datasource.dart';
import 'package:peak_mates/features/trips/data/models/trip_model.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';
import 'package:peak_mates/features/trips/domain/repositories/trip_repo.dart';

class TripRepoImpl implements TripRepo {
  TripRepoImpl(this._remoteDataSource);

  final TripRemoteDatasource _remoteDataSource;

  @override
  ResultFuture<void> addTrip(Trip trip) async {
    try {
      await _remoteDataSource.addTrip(trip);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultStream<List<Trip>> getTrips() {
    return _remoteDataSource.getTrips().transform(
          StreamTransformer<List<TripModel>,
              Either<Failure, List<Trip>>>.fromHandlers(
            handleData: (trips, sink) {
              sink.add(Right(trips));
            },
            handleError: (error, stackTrace, sink) {
              sink.add(Left(ServerFailure(message: error.toString())));
            },
          ),
        );
  }
}
