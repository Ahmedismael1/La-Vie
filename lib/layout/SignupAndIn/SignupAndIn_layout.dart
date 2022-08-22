import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/cubit.dart';
import 'package:la_vie/layout/SignupAndIn/signupAndInLogic/states.dart';
import 'package:la_vie/layout/home/home_layout.dart';
import 'package:la_vie/shared/my_widget.dart';
import 'package:la_vie/shared/reusables/reusable_text_filed.dart';
import 'package:la_vie/shared/shared_preference/shared_preferences.dart';

class SignupAndInLayout extends StatelessWidget {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();
  String email, password, confirmPassword, name;
  var firstFormKey = GlobalKey<FormState>();
  var secFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupAndInCubit(),
      child: BlocConsumer<SignupAndInCubit, SignupAndInStates>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          if (state is LoginSuccessState) {
            CashHelper.saveData(
                    value: state.loginModel.data.accessToken,
                    key: 'accessToken')
                .then((value) async {
              await Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeLayout()));
            });
          } else if (state is SignupSuccessState) {
            CashHelper.saveData(
                    value: state.signUpModel.data.accessToken,
                    key: 'accessToken')
                .then((value) async {
              await Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeLayout()));
            });
          }
        },
        builder: (context, state) {
          var cubit = SignupAndInCubit.get(context);
          return Scaffold(
            body: ListView(
              children: [
                (cubit.isSignIn==false)?
                Form(
                    key: firstFormKey,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 70,
                                  ),
                                  child: Image.asset('images/logo.jpeg',
                                      fit: BoxFit.fill, width: 100, height: 50),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Home',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Shop',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Blog',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'community',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xff1ABC00),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          if (cubit.isSignIn == true) {
                                            cubit.changeSignState();
                                            emailController.clear();
                                            passwordController.clear();
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(172, 60),
                                          backgroundColor: Color(0xff1abc00),
                                        ),
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: TextButton(
                                      onPressed: () {
                                        if (cubit.isSignIn == true) {
                                          cubit.changeSignState();
                                          emailController.clear();
                                          passwordController.clear();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(150, 50),
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff1abc00),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: TextButton(
                                      onPressed: () {
                                        if (cubit.isSignIn == false) {
                                          cubit.changeSignState();
                                          emailController.clear();
                                          passwordController.clear();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(150, 50),
                                      ),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Color(0xff1abc00),
                                  height: 1.5,
                                  width: 130,
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  color: Color(0xff1abc00).withOpacity(0),
                                  height: 1.5,
                                  width: 130,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: myDivider(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 150),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'First Name',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff6F6F6F),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ReusableTextFiled(
                                              onChange: (val) {
                                                name = val;
                                              },
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Must not be empty";
                                                }

                                                return null;
                                              },
                                              textController:
                                                  firstNameController,
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(width: 25),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Second Name',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff6F6F6F),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ReusableTextFiled(
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Must not be empty";
                                                  }

                                                  return null;
                                                },
                                                textController:
                                                    secondNameController,
                                                prefixIcon: const Icon(
                                                  Icons.person,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ReusableTextFiled(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Email address must not be empty";
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return "Email is not valid ";
                                      }

                                      return null;
                                    },
                                    textController: emailController,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff1abc00),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.RegisterVisiblePassword();
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey,
                                          ),
                                        )),
                                    obscureText:
                                        cubit.isRegisterPasswordVisibility,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Password Must Not be Empty";
                                      } else if (value.length < 8) {
                                        return "Password Length Short";
                                      } else if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        return "Password Not the Same";
                                      }

                                      // else if(!RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$.').hasMatch(password)){
                                      //   return "password must have special character ";
                                      // }

                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: confirmPasswordController,
                                    obscureText: cubit
                                        .isRegisterConfirmPasswordVisibility,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff1abc00),
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit
                                                .RegisterVisibleConfirmPassword();
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey,
                                          ),
                                        )),
                                    validator: (value) {
                                      if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        return "Password Not the Same";
                                      } else if (value.length < 8) {
                                        return "Password Length Short";
                                      }
                                      // else if(!RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$.').hasMatch(password)){
                                      //   return "password must have special character ";
                                      // }

                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! SignupLoadingState,
                                    builder: (context) => TextButton(
                                        onPressed: () {
                                          if(firstFormKey.currentState == null){
                                            print('FKCS => ${firstFormKey.currentState}');
                                            return;
                                          }
                                          if (firstFormKey.currentState
                                              .validate()) {
                                            cubit.userRegister(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              fName: firstNameController.text,
                                              sName: secondNameController.text,
                                            );
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          elevation: 5,
                                          fixedSize: Size(
                                              MediaQuery.of(context).size.width,
                                              80),
                                          backgroundColor: Color(0xff1abc00),
                                        ),
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff909090))),
                                TextButton(
                                  onPressed: () {
                                    if (cubit.isSignIn == false)
                                      cubit.changeSignState();
                                  },
                                  child: Text('Sign in',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff1ABC00))),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  height: 1.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                                Text('or continue with',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff1ABC00))),
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  height: 1.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 58,
                                  width: 250,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xff6F6F6F))),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Image(
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQioJuiUE4-o1wE2JMi9S_-mcrd41y3E8FScym9EpDHz9R1d8ptHEPqqJjadHJ938IM9l4&usqp=CAU'),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: Color(0xff6F6F6F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Container(
                                  width: 250,
                                  height: 58,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xff6F6F6F))),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Image(
                                            image: NetworkImage(
                                                'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg'),
                                            width: 50,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              color: Color(0xff6F6F6F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage('images/Sign image1.jpeg'),
                          width: 140,
                          height: 250,
                        )
                      ],
                    ))
                    : Form(
                    key: secFormKey,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 70,
                                  ),
                                  child: Image.asset('images/logo.jpeg',
                                      fit: BoxFit.fill, width: 100, height: 50),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Home',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Shop',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'Blog',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.02)),
                                        onPressed: () {},
                                        child: Text(
                                          'community',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xff1ABC00),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          if (cubit.isSignIn == true) {
                                            cubit.changeSignState();
                                            emailController.clear();
                                            passwordController.clear();
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(172, 60),
                                          backgroundColor: Color(0xff1abc00),
                                        ),
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: TextButton(
                                      onPressed: () {
                                        if (cubit.isSignIn == true) {
                                          cubit.changeSignState();
                                          emailController.clear();
                                          passwordController.clear();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(150, 50),
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: TextButton(
                                      onPressed: () {
                                        if (cubit.isSignIn == false) {
                                          cubit.changeSignState();
                                          emailController.clear();
                                          passwordController.clear();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(150, 50),
                                      ),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff1abc00),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Color(0xff1abc00).withOpacity(0),
                                  height: 1.5,
                                  width: 130,
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  color: Color(0xff1abc00).withOpacity(1),
                                  height: 1.5,
                                  width: 130,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: myDivider(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 150),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),


                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ReusableTextFiled(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Email address must not be empty";
                                      } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return "Email is not valid ";
                                      }

                                      return null;
                                    },
                                    textController: emailController,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff1abc00),
                                              width: 1.0),
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.RegisterVisiblePassword();
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey,
                                          ),
                                        )),
                                    obscureText:
                                    cubit.isRegisterPasswordVisibility,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Password Must Not be Empty";
                                      } else if (value.length < 8) {
                                        return "Password Length Short";
                                      }

                                      // else if(!RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$.').hasMatch(password)){
                                      //   return "password must have special character ";
                                      // }

                                      return null;
                                    },
                                  ),


                                  SizedBox(
                                    height: 30,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! SignupLoadingState,
                                    builder: (context) => TextButton(
                                        onPressed: () {

                                          if (secFormKey.currentState
                                              .validate()) {
                                            cubit.userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,

                                            );
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          elevation: 5,
                                          fixedSize: Size(
                                              MediaQuery.of(context).size.width,
                                              80),
                                          backgroundColor: Color(0xff1abc00),
                                        ),
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    fallback: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff909090))),
                                TextButton(
                                  onPressed: () {
                                    if (cubit.isSignIn == true)
                                      cubit.changeSignState();
                                  },
                                  child: Text('Signup',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff1ABC00))),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  height: 1.5,
                                  width:
                                  MediaQuery.of(context).size.width * 0.35,
                                ),
                                Text('or continue with',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff1ABC00))),
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  height: 1.5,
                                  width:
                                  MediaQuery.of(context).size.width * 0.35,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 58,
                                  width: 250,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                      border:
                                      Border.all(color: Color(0xff6F6F6F))),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: const [
                                          Image(
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQioJuiUE4-o1wE2JMi9S_-mcrd41y3E8FScym9EpDHz9R1d8ptHEPqqJjadHJ938IM9l4&usqp=CAU'),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: Color(0xff6F6F6F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Container(
                                  width: 250,
                                  height: 58,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                      border:
                                      Border.all(color: Color(0xff6F6F6F))),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: const [
                                          Image(
                                            image: NetworkImage(
                                                'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg'),
                                            width: 50,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              color: Color(0xff6F6F6F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage('images/Sign image1.jpeg'),
                          width: 140,
                          height: 250,
                        )
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
