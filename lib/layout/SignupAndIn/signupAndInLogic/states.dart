import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signupModel.dart';

abstract class SignupAndInStates{}
class SignupAndInInitialState extends SignupAndInStates{}
class SignupAndInLoadingState extends SignupAndInStates{}
class SignupAndInSuccessState extends SignupAndInStates{}
class SignupAndInErrorState extends SignupAndInStates{
  String error;
  SignupAndInErrorState({this.error});
}

class IsSignState extends SignupAndInStates{}
class RegisterVisibilityState extends SignupAndInStates{}
class LogInVisibilityState extends SignupAndInStates{}

class SignupLoadingState extends SignupAndInStates{}
class SignupSuccessState extends SignupAndInStates{
  final SignupModel signUpModel;
  SignupSuccessState({this.signUpModel});
}
class SignupErrorState extends SignupAndInStates{
  String error;
  SignupErrorState({this.error});
}

class LoginLoadingState extends SignupAndInStates{}
class LoginSuccessState extends SignupAndInStates{
  final LogInModel loginModel;

  LoginSuccessState(this.loginModel);

}
class LoginErrorState extends SignupAndInStates{
  final String error;
  LoginErrorState({this.error});
}
