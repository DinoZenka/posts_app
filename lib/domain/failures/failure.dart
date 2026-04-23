import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message =
        'No internet connection. Please check your network settings.',
  ]);
}

class ServerFailure extends Failure {
  const ServerFailure([
    super.message = 'Server error. Please try again later.',
  ]);
}

class ParsingFailure extends Failure {
  const ParsingFailure([super.message = 'Data processing error.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
