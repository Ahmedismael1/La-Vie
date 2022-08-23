

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/shared/my_widget.dart';
import 'package:la_vie/shared/reusables/reusables_appbar.dart';

import '../../shared/reusables/reusable_text_filed.dart';

class MyProfileLayout extends StatelessWidget {

  var addressController = TextEditingController();
  var uploadPhotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context,state){},
        builder: (context,state){

       return Scaffold(
         body: SingleChildScrollView(
           child: Column(children: [
             buildAppbar(context),
             SizedBox(
               height: 20,
             ),
             Text(
               'My Profile',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 28,
                 fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox(
               height: 5,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                   child: TextButton(
                       onPressed: () {
                         if(AppCubit.get(context).isChangeProfile) {
                           AppCubit.get(context).changeInfoType();
                         }
                       },
                       style: TextButton.styleFrom(
                         fixedSize: Size(170, 50),
                       ),
                       child: Text(
                         'Personal Information',
                         style: TextStyle(
                           fontSize: 16,
                           color: (AppCubit.get(context).isChangeProfile==false)?Color(0xff1abc00):Colors.black,
                           fontWeight: FontWeight.w600,
                         ),
                       )),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                   child: TextButton(
                       onPressed: () {
                         if(AppCubit.get(context).isChangeProfile==false) {
                           AppCubit.get(context).changeInfoType();
                         }
                       },
                       style: TextButton.styleFrom(
                         fixedSize: Size(150, 50),
                       ),
                       child: Text(
                         'Profile picture',
                         style: TextStyle(
                           fontSize: 16,
                           color:  (AppCubit.get(context).isChangeProfile)?Color(0xff1abc00):Colors.black,
                           fontWeight: FontWeight.w600,
                         ),
                       )),
                 )
               ],
             ),
             SizedBox(
               height: 5,
             ),
             Row(

               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(
                   width: 40,
                 ),
                 Container(
                   color: (AppCubit.get(context).isChangeProfile==false)?Color(0xff1abc00):Color(0xff1abc00).withOpacity(0),
                   height: 1.5,
                   width: 140,
                 ),
                 SizedBox(
                   width: 100,
                 ),
                 Container(
                   color: (AppCubit.get(context).isChangeProfile==false)?Color(0xff1abc00).withOpacity(0):Color(0xff1abc00),
                   height: 1.5,
                   width: 110,
                 ),
               ],
             ),
             myDivider(),
             Padding(
               padding: const EdgeInsets.all(18.0),
               child: Container(
                 color: Color(0xffe8f1e6),
                 height: 50,
                 child:
                 Row(
                   children: [
                     Padding(
                       padding: EdgeInsets.only(
                           left: 30,right: 30
                       ),
                       child: Image.asset('images/points_image.png',
                           fit: BoxFit.fill, width: 40, height: 40),
                     ),
                     Text(
                       'You have 30 points',
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.black,
                         fontWeight: FontWeight.w600,
                       ),
                     )
                   ],
                 ),
               ),
             ),

             (AppCubit.get(context).isChangeProfile==false)?
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
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
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Must not be empty";
                                }

                                return null;
                              },
                              textController:
                              AppCubit.get(context).currentFirstNameController,

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
                            AppCubit.get(context).currentSecondNameController,


                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
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
                              onChange: (val) {
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Must not be empty";
                                }

                                return null;
                              },
                              textController:
                              AppCubit.get(context).currentEmailController,

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
                            'Address',
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
                            hintText: 'Address',
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Must not be empty";
                              }

                              return null;
                            },
                            textController:
                            addressController,

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],):Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(5)),
                    border:
                    Border.all(color: Color(0xff6F6F6F))),
                height: 200,
                width: MediaQuery.of(context).size.width*0.3,
                child: Icon(Icons.add,size: 35,),
              ),
            ),
                 Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: Row(children: [
                     Expanded(
                         flex: 4,
                         child: InkWell(
                           onTap: (){
                           },
                           child: TextFormField(
                             controller: uploadPhotoController,
                             validator: (value){
                               if (value.isEmpty) {
                                 return "This filed must not be empty";
                               }
                               return null;
                             },
                             decoration: InputDecoration(
                                 enabled: false,
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                   borderSide: const BorderSide(
                                       color: Color(0xff1abc00),
                                       width: 1.0),)

                             ),
                           ),
                         )),
                     SizedBox(width: 25,),
                     Expanded(
                       flex: 1,
                       child: Container(
                         height: 45,
                         child: TextButton(
                             onPressed: () {
                               AppCubit.get(context).getPostImage2();
                             },
                             style: TextButton.styleFrom(
                               backgroundColor: Color(0xff1abc00),
                             ),
                             child: Text(
                               'Upload',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                                 fontWeight: FontWeight.w300,
                               ),
                             )),
                       ),
                     ),

                   ],),
                 ),

               ],),

             SizedBox(height: 10,),

            SizedBox(height: 20,),
            TextButton(
                       onPressed: () {

                      AppCubit.get(context).updateCurrentUser(
                           email: AppCubit.get(context).currentEmailController.text,
                           address: addressController.text??'',
                           firstName: AppCubit.get(context).currentFirstNameController.text,
                           lastName: AppCubit.get(context).currentSecondNameController.text,
                         );
                       },
                       style: TextButton.styleFrom(
                         fixedSize: Size(172, 40),
                         backgroundColor: Color(0xff1abc00),
                       ),
                       child: Text(
                         'Save',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontWeight: FontWeight.w300,
                         ),
                       )),
           ],),
         ),
       );
        },);
  }
}
