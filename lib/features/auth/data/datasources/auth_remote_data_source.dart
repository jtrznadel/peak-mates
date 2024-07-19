import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/errors/exceptions.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  AuthRemoteDataSource();

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;

      if (user == null) {
        throw const ServerException(message: 'User not found', statusCode: 404);
      }

      var userData = await _getUserData(user.uid);

      if (userData.exists) {
        return UserModel.fromMap(userData.data()!);
      }

      await _setUserData(user, email);
      userData = await _getUserData(user.uid);
      return UserModel.fromMap(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
          message: e.message ?? 'Error occured', statusCode: e.code);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw const ServerException(message: 'Error occured', statusCode: 500);
    }
  }

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCred.user?.updateDisplayName(username);
      await _setUserData(_auth.currentUser!, email);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
          message: e.message ?? 'Error occured', statusCode: e.code);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw const ServerException(message: 'Error occured', statusCode: 500);
    }
  }

  Future<DocumentSnapshot<DataMap>> _getUserData(String uid) async {
    return _firestore.collection('users').doc(uid).get();
  }

  Future<void> _setUserData(User user, String fallbackEmail) async {
    await _firestore.collection('users').doc(user.uid).set(UserModel(
          uid: user.uid,
          email: user.email ?? fallbackEmail,
          username: user.displayName ?? '',
        ).toMap());
  }
}
