part of 'password_validation_bloc.dart';

sealed class PasswordValidationEvent extends Equatable {
  const PasswordValidationEvent();

  @override
  List<Object> get props => [];
}

final class PasswordChanged extends PasswordValidationEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}
