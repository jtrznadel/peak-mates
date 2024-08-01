import 'package:firebase_auth/firebase_auth.dart';
import 'package:peak_mates/core/errors/exceptions.dart';

class DatasourceUtils {
  const DatasourceUtils._();

  static Future<void> authorizeUser({required FirebaseAuth auth}) async {
    final user = auth.currentUser;
    if (user == null) {
      throw const ServerException(
          message: 'User is not authenticated', statusCode: 401);
    }
  }
}
