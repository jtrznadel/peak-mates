import 'package:peak_mates/core/utilities/typedefs.dart';

abstract class FutureUsecaseWithParams<T, Params> {
  const FutureUsecaseWithParams();

  ResultFuture<T> call(Params params);
}

abstract class FutureUsecaseWithoutParams<T> {
  const FutureUsecaseWithoutParams();

  ResultFuture<T> call();
}

abstract class StreamUsecaseWithParams<T, Params> {
  const StreamUsecaseWithParams();

  ResultStream<T> call(Params params);
}

abstract class SteramUsecaseWithoutParams<T> {
  const SteramUsecaseWithoutParams();

  ResultStream<T> call();
}
