import 'package:equatable/equatable.dart';
import 'exception.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ValidationFailure extends Failure {
  final Map<String, dynamic> errorsValidation;

  const ValidationFailure(String message, this.errorsValidation)
      : super(message);

  @override
  List<Object> get props => [...super.props, errorsValidation];
}

class CommonFailure extends Failure {
  final ExceptionFromCannotProcess typeException;

  const CommonFailure(String message, this.typeException) : super(message);

  @override
  List<Object> get props => [...super.props, typeException];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class FetchFailure extends Failure {
  const FetchFailure(String message) : super(message);
}
