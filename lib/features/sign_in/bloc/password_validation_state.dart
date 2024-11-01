part of 'password_validation_bloc.dart';

sealed class PasswordValidationState extends Equatable {
  const PasswordValidationState();

  @override
  List<Object?> get props => [];
}

final class PasswordValid extends PasswordValidationState {
  const PasswordValid();

  @override
  List<Object?> get props => [];
}

final class PasswordInvalid extends PasswordValidationState {
  final ValidationStatus status;

  const PasswordInvalid({
    required this.status,
  });

  @override
  List<Object?> get props => [status];
}

final class PasswordEmpty extends PasswordValidationState {
  const PasswordEmpty();
}
