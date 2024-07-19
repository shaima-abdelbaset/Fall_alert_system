
class ActivateUserState {}

class ActivateUserInitial extends ActivateUserState {}

class ActivateUserLoading extends ActivateUserState {}

class ActivateUserSuccess extends ActivateUserState {
  // final ActivateUserModel activateUserModel;
  // ActivateUserSuccess(this.activateUserModel);

  // @override
  // List<Object> get props => [activateUserModel];
}

class ActivateUserError extends ActivateUserState {
  final String error;

  ActivateUserError(this.error);
}


class OTPResendInitial extends ActivateUserState {}

class OTPResendLoading extends ActivateUserState {}

class OTPResendSuccess extends ActivateUserState {
  final String message;

  OTPResendSuccess(this.message);
}

class OTPResendFailure extends ActivateUserState {
  final String error;

  OTPResendFailure({required this.error});
}


class ForgotPasswordLoading extends ActivateUserState {}

class ForgotPasswordSuccess extends ActivateUserState {
  final String message;

  ForgotPasswordSuccess(this.message);
}

class ForgotPasswordError extends ActivateUserState {
  final String error;

  ForgotPasswordError({required this.error});
}


class ResetPasswordLoading extends ActivateUserState {}

class ResetPasswordSuccess extends ActivateUserState {
  final String message;

  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends ActivateUserState {
  final String error;

  ResetPasswordError({required this.error});
}
