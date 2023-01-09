abstract class SingUpState {}

class SingUpStateInitial extends SingUpState {}

class SingUpStateLoading extends SingUpState {}

class SingUpStateSuccess extends SingUpState {}

class SingUpStateError extends SingUpState {
  final String message;

  SingUpStateError(this.message);
}
