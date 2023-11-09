abstract class Failure {
  final String message;

  Failure(this.message);
}

class SomeSpecificErrors extends Failure {
  SomeSpecificErrors(String message) : super(message);
}
