import 'package:chatify/features/auth/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;
  String? password;
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  void login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );

// all code with try and catch
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFaildState(errorMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFaildState(errorMsg: 'Wrong password provided for that user.'));
      } else if (e.code == 'firebase_auth/invalid-credential') {
        emit(LoginFaildState(errorMsg: 'Check your Email and password!'));
      } else if (e.code == 'user-not-found') {
        emit(LoginFaildState(errorMsg: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(LoginFaildState(errorMsg: e.toString()));
    }
  }
}
