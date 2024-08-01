import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/errors/failures.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';
import 'package:peak_mates/features/trips/domain/usecases/add_trip.dart';
import 'package:peak_mates/features/trips/domain/usecases/get_trips.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;

  StreamSubscription<Either<Failure, List<Trip>>>? tripsSubscription;

  TripCubit({
    required GetTrips getTrips,
    required AddTrip addTrip,
  })  : _getTrips = getTrips,
        _addTrip = addTrip,
        super(TripInitial());

  Future<void> addTrip(Trip trip) async {
    emit(AddingTrip());
    final result = await _addTrip(trip);
    result.fold(
      (failure) => emit(TripError(failure.message)),
      (_) => emit(TripAdded()),
    );
  }

  void getTrips() {
    emit(LoadingTrips());
    tripsSubscription = _getTrips().listen(
      (result) {
        result.fold(
          (failure) => emit(TripError(failure.errorMasaage)),
          (trips) => emit(TripsLoaded(trips)),
        );
      },
      onError: (error) => emit(TripError(error.toString())),
    );
  }
}
