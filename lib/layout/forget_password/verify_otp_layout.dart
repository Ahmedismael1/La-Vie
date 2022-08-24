

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/cubit.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/states.dart';
import 'package:la_vie/layout/forget_password/reset_password_layout.dart';

class VerifyOtpLayout extends StatelessWidget {

  String email;
  VerifyOtpLayout({this.email});
  var otpController1=TextEditingController();
  var otpController2=TextEditingController();
  var otpController3=TextEditingController();
  var otpController4=TextEditingController();
  var otpController5=TextEditingController();
  var otpController6=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:
        (context) => SignupAndInCubit(),
    child: BlocConsumer<SignupAndInCubit,SignupAndInStates>(
      listener: (context,state){

      if(state is VerifyOTPSuccessState){
        Fluttertoast.showToast(
            msg: 'Correct',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ResetPasswordLayout(email:email,
            otpCode: otpController1.text+otpController2.text+otpController3.text+
                otpController4.text+otpController5.text+otpController6.text,
            )));
      }
      if (state is VerifyOTPErrorState) {
        Fluttertoast.showToast(
            msg: 'OTP Is incorrect',
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
                  SizedBox(height: 18,),
                  Image(
                    height: 100,
                    width: double.infinity,
                    image: const AssetImage('images/userimage.jpg'),
                  ),
                  SizedBox(height: 18,),
                  Text('Please enter the 6-digit code sent to',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(height: 15,),
                  Text('${email}',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff1ABC00),
                  ),
                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 25,),
                  Row(

                    children: [
                      const SizedBox(width: 15,),
                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController1,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController2,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController3,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value .isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController4,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value .isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController5,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value .isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      Container(

                        height: 40,
                        width: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
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
                          controller: otpController6,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value .isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 5,),


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
                          SignupAndInCubit.get(context).verifyOtp(email: email,
                          otpCode:  otpController1.text+otpController2.text+otpController3.text+
                              otpController4.text+otpController5.text+otpController6.text
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
                  )

                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}
