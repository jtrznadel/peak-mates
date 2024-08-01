import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:peak_mates/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:peak_mates/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:peak_mates/features/auth/domain/repositories/auth_repo.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_in.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_up.dart';
import 'package:peak_mates/features/auth/domain/usecases/update_user.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/trips/data/datasources/trip_remote_datasource.dart';
import 'package:peak_mates/features/trips/data/repositories/trip_repo.dart';
import 'package:peak_mates/features/trips/domain/repositories/trip_repo.dart';
import 'package:peak_mates/features/trips/domain/usecases/add_trip.dart';
import 'package:peak_mates/features/trips/domain/usecases/get_trips.dart';
import 'package:peak_mates/features/trips/presentation/cubit/trip_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
  await _initTrips();
}

Future<void> _initAuth() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(() => AuthCubit(
          signIn: sl(),
          signUp: sl(),
          updateUser: sl(),
        ))
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        firestore: sl(),
        auth: sl(),
        storage: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => prefs);
}

Future<void> _initTrips() async {
  sl
    ..registerFactory(() => TripCubit(
          getTrips: sl(),
          addTrip: sl(),
        ))
    ..registerLazySingleton(() => GetTrips(sl()))
    ..registerLazySingleton(() => AddTrip(sl()))
    ..registerLazySingleton<TripRepo>(() => TripRepoImpl(sl()))
    ..registerLazySingleton<TripRemoteDatasource>(
      () => TripRemoteDatasourceImpl(
        firestore: sl(),
        storage: sl(),
        auth: sl(),
      ),
    );
}
