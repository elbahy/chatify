sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginFaildState extends AuthState {
  final String errorMsg;
  LoginFaildState({required this.errorMsg});
}

final class LoginSuccessState extends AuthState {}
