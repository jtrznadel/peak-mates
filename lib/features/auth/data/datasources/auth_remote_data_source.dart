import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/core/errors/exceptions.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';

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

  Future<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _auth = auth,
        _firestore = firestore,
        _storage = storage;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

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

  @override
  Future<void> updateUser(
      {required UpdateUserAction action, required dynamic userData}) async {
    try {
      switch (action) {
        case UpdateUserAction.firstName:
          await _updateUserData({'firstName': userData});
          break;
        case UpdateUserAction.lastName:
          await _updateUserData({'lastName': userData});
          break;
        case UpdateUserAction.nationality:
          await _updateUserData({'nationality': userData});
          break;
        case UpdateUserAction.city:
          await _updateUserData({'city': userData});
          break;
        case UpdateUserAction.profilePicture:
          final ref = _storage
              .ref()
              .child('profile_pictures/${_auth.currentUser!.uid}');
          await ref.putFile(userData as File);
          final url = await ref.getDownloadURL();
          await _auth.currentUser?.updatePhotoURL(url);
          await _updateUserData({'profilePicture': url});
          break;
        case UpdateUserAction.bio:
          await _updateUserData({'bio': userData});
          break;
        case UpdateUserAction.dateOfBirth:
          await _updateUserData({'dateOfBirth': userData});
          break;
        case UpdateUserAction.verified:
          await _updateUserData({'verified': userData});
          break;
      }
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

  Future<void> _updateUserData(DataMap data) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update(data);
  }
}
