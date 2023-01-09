abstract class SingInState {}

class SingInStateInitial extends SingInState {}

class SingInStateLoading extends SingInState {}

class SingInStateSuccess extends SingInState {}

class SingInStateError extends SingInState {
  final String message;

  SingInStateError(this.message);
}
