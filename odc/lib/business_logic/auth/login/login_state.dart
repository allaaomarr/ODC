
//part of 'login_cubit.dart';



import 'package:flutter/cupertino.dart';

import '../../../data/Models/auth/login_model.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  LoginModel loginModel;
 LoginSuccessState({required this.loginModel});
}
class LoginErrorState extends LoginState {}
class PasswordVisibilityState extends LoginState {}