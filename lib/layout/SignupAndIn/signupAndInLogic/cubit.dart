

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/states.dart';
import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signupModel.dart';
import 'package:la_vie/shared/dio/dio_helper.dart';

class SignupAndInCubit extends Cubit<SignupAndInStates> {
  SignupAndInCubit() : super(SignupAndInInitialState());

  static SignupAndInCubit get(context) => BlocProvider.of(context);


  SignupModel signUpModel;

  void userRegister({
     String fName,
    String sName,
    String email,
     String password,
  })
  {
    emit(SignupLoadingState());

    DioHelper.postData(
      url: 'api/v1/auth/signup',
      data:
      {
        'firstName': fName,
        'lastName': sName,
        'email':email,
        'password': password,
      },
    ).then((value)
    {
      signUpModel = SignupModel.fromJson(value.data);
      print(value.data);

      emit(SignupSuccessState(token: signUpModel.data.accessToken));
    }).catchError((error)
    {
      if(error is DioError){
        print(error.response);
        emit(SignupErrorState(error: "error"));
      }
    });
  }
  LogInModel loginModel;
  void userLogin({String email, String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: "api/v1/auth/signin",
      data: {'email': email, 'password': password},
    ).then((value) {
      loginModel = LogInModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error: error.toString()));
    });
  }

  bool isSignIn = false;

  void changeSignState() {
    isSignIn = !isSignIn;
    emit(IsSignState());
  }

  bool isRegisterPasswordVisibility = true;

  void RegisterVisiblePassword() {
    isRegisterPasswordVisibility = !isRegisterPasswordVisibility;

    emit(RegisterVisibilityState());
  }

  bool isRegisterConfirmPasswordVisibility = true;

  void RegisterVisibleConfirmPassword() {
    isRegisterConfirmPasswordVisibility = !isRegisterConfirmPasswordVisibility;

    emit(RegisterVisibilityState());
  }
  bool isLigInPasswordVisibility = true;

  void LogInVisiblePassword() {
    isLigInPasswordVisibility = !isLigInPasswordVisibility;

    emit(LogInVisibilityState());
  }






  void forgetPassword({

     String email,

  }){

    emit(ForgetPasswordLoadingState());
    DioHelper.postData(
        url: 'api/v1/auth/forget-password',
        data: {
          "email": email,
        }
    ).then((value) {

      print(value.data['message']);
      emit(ForgetPasswordSuccessState());
    }).catchError((error){

      print('Error in ForgetPassword is ${error.toString()}');
      emit(ForgetPasswordErrorState());

    });

  }

  void verifyOtp({

     String email,
     String otpCode,

  }){

    emit(VerifyOTPLoadingState());
    DioHelper.postData(
        url: 'api/v1/auth/verify-otp',
        data: {
          "email": email,
          "otp":otpCode
        }
    ).then((value) {

      print(value.data['message']);
      emit(VerifyOTPSuccessState());
    }).catchError((error){

      print('Error in VerifiyOTP is ${error.toString()}');
      emit(VerifyOTPErrorState());

    });

  }


  void resetPassword({

     String email,
     String otpCode,
     String password,


  }){

    emit(ResetPasswordLoadingState());
    DioHelper.postData(
        url: 'api/v1/auth/reset-password',
        data: {
          "email": email,
          "otp":otpCode,
          "password":password
        }
    ).then((value) {

      print(value.data['message']);
      print(value.data);
      emit(ResetPasswordSuccessState());
    }).catchError((error){

      print('Error in ResetPassword is ${error.toString()}');
      emit(ResetPasswordErrorState());

    });

  }


}
