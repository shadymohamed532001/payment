class Falier {
  final String error;
  Falier(this.error);
}

class ServerError extends Falier {
  ServerError(super.error);
}
