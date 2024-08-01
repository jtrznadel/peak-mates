import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:peak_mates/core/errors/exceptions.dart';
import 'package:peak_mates/core/utilities/datasource_utils.dart';
import 'package:peak_mates/features/trips/data/models/trip_model.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';

abstract class TripRemoteDatasource {
  const TripRemoteDatasource();

  Stream<List<Trip>> getTrips();
  Future<void> addTrip(Trip trip);
}

class TripRemoteDatasourceImpl implements TripRemoteDatasource {
  const TripRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _storage = storage,
        _auth = auth;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final FirebaseAuth _auth;

  @override
  Future<void> addTrip(Trip trip) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw const ServerException(
            message: 'User is not authenticated', statusCode: 401);
      }
      final tripRef = _firestore.collection('trips').doc();

      //TODO: Implement chats
      //
      // final chatRef = _firestore.collection('chats').doc();

      var tripModel = (trip as TripModel).copyWith(
        id: tripRef.id,
        createdBy: user.uid,
        participants: [user.uid],
        chatRoomId: 'chatRef.id',
      );

      await tripRef.set(tripModel.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? 'Unknown error occured', statusCode: e.code);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Stream<List<Trip>> getTrips() {
    try {
      DatasourceUtils.authorizeUser(auth: _auth);
      final tripsStream =
          _firestore.collection('trips').snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => TripModel.fromMap(doc.data()))
            .toList();
      });
      return tripsStream.handleError(
        (error) {
          if (error is FirebaseException) {
            throw ServerException(
                message: error.message ?? 'Unknown error occured',
                statusCode: error.code);
          } else {
            throw ServerException(message: error.toString(), statusCode: 505);
          }
        },
      );
    } on FirebaseException catch (e) {
      throw ServerException(
          message: e.message ?? 'Unknown error occured', statusCode: e.code);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
