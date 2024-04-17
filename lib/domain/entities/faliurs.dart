class Failures {
  String errorMessage;
  Failures({
    required this.errorMessage,
  });
}

class ServerError extends Failures {
  ServerError({required super.errorMessage});
}

class NetWorkError extends Failures {
  NetWorkError({required super.errorMessage});
}
