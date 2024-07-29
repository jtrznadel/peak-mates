import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

class Streams {
  const Streams._();

  static Stream<UserModel> get userDataStream => sl<FirebaseFirestore>()
      .collection('users')
      .doc(sl<FirebaseAuth>().currentUser!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromMap(snapshot.data()!));
}
