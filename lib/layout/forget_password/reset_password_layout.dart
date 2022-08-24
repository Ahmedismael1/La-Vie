

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/layout/SignupAndIn/SignupAndIn_layout.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/cubit.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/states.dart';

class ResetPasswordLayout extends StatelessWidget {
  ResetPasswordLayout({Key key,this.otpCode,this.email}) : super(key: key);

  String otpCode;
  String email;

  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:    (context) => SignupAndInCubit(),
        child: BlocConsumer<SignupAndInCubit,SignupAndInStates>(
        listener: (context,state){
      if(state is ResetPasswordSuccessState) {
        Fluttertoast.showToast(
            msg: 'Reset Password Successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignupAndInLayout()));
      }

      if (state is ResetPasswordErrorState){
        Fluttertoast.showToast(
            msg: 'OTP Is incorrect',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      },
    builder: (context,state){
          return Scaffold(body:
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  SizedBox(height: 18,),

                  SizedBox(height: 18,),
                  Text('Enter Your New Password',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                    textAlign: TextAlign.center,

                  ),

                  const SizedBox(height: 25,),
                  Column(

                    children: [
                      Container(

                        padding: const EdgeInsets.symmetric(
                            horizontal: 25
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'New Password',
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
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
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Please enter your new password';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),




                    ],
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
                          SignupAndInCubit.get(context).resetPassword(
                            otpCode:otpCode ,
                            email: email,
                            password: passwordController.text,
                          );

                        },
                        style: TextButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              50),
                          backgroundColor: Color(0xff1abc00),
                        ),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),


                ],
              ),
            ),
          ),
            );
    },
        ));
  }
}
