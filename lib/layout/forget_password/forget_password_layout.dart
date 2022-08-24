

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/cubit.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/states.dart';
import 'package:la_vie/layout/forget_password/verify_otp_layout.dart';

import '../home/home_layout.dart';

class ForgetPasswordLayout extends StatelessWidget {
  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SignupAndInCubit(),
      child: BlocConsumer<SignupAndInCubit,SignupAndInStates>(
          listener: (context,state){
            if(state is ForgetPasswordSuccessState){
              Fluttertoast.showToast(
                  msg: 'Check your email OTP sent to your email',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => VerifyOtpLayout(email: emailController.text,)));

            }
            if (state is ForgetPasswordErrorState){
              Fluttertoast.showToast(
                  msg: 'Email is invalid',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);

            }
          },
        builder: (context,state){
            return Scaffold(
        body:  SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [

                SizedBox(height: 13,),
                Image(
                  height: 200,
                  width: double.infinity,
                  image:  AssetImage('images/userimage.jpg'),
                ),
                SizedBox(height: 7,),
                Text('Please enter your email address to \n receive verification code ',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
                  textAlign: TextAlign.center,

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:'E-mail',
                      hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter your email address';
                      }
                      else
                      {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 25

                  ),
                  width: double.infinity,
                  height: 50,
                  child:TextButton(
                      onPressed: () {
                        SignupAndInCubit.get(context).forgetPassword(email: emailController.text);

                      },
                      style: TextButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            50),
                        backgroundColor: Color(0xff1abc00),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                )

              ],
            ),
          ),
        ),
      );}, ),
    );
  }
}
