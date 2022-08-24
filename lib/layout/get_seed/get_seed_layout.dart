

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/layout/home/home_layout.dart';
import 'package:la_vie/shared/reusables/reusable_text_filed.dart';

class GetSeedLayout extends StatelessWidget {
  var addressController = TextEditingController();
  var getSeedFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<AppCubit,AppStates>(listener: (context,state){
        if(state is AddAddressSuccessState){
          Fluttertoast.showToast(
              msg:'Success',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          AppCubit.get(context).getSeeds();
          AppCubit.get(context).getALLForums();
          AppCubit.get(context).getMyForums();
          AppCubit.get(context).getTools();
          AppCubit.get(context).getBlogs();
          AppCubit.get(context).getPlants();
          AppCubit.get(context).getCurrentUser();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeLayout()));

        }
        else if(state is AddAddressErrorState){
          Fluttertoast.showToast(
              msg:state.error.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context,state){
        return  Form(
          key: getSeedFormKey,
          child: Row(children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Image(height: double.infinity,fit: BoxFit.fill,
                      image: AssetImage('images/get_seed.png')),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Image.asset('images/logo.jpeg',
                          fit: BoxFit.fill, width: 100, height: 50),
                    ),
                    Text('Get Seeds For Free',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Enter your Address',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    ReusableTextFiled(
                      hintText: 'Address',
                      textController:addressController ,
                    ),
                    TextButton(
                        onPressed: () {
                          if(getSeedFormKey.currentState.validate())
                          {

                            AppCubit.get(context).sendAddress(
                                address: addressController.text
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              50),
                          backgroundColor: Color(0xff1abc00),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          AppCubit.get(context).getSeeds();
                          AppCubit.get(context).getALLForums();
                          AppCubit.get(context).getMyForums();
                          AppCubit.get(context).getTools();
                          AppCubit.get(context).getBlogs();
                          AppCubit.get(context).getPlants();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HomeLayout()));
                        },
                        style: TextButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              50),
                          backgroundColor: Colors.grey,
                        ),
                        child: Text(
                          'Later',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],),
              ),
            )
          ],),
        );
      },),
    );
  }
}
