

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/layout/home/home_layout.dart';
import 'package:la_vie/layout/questions/question_list.dart';
import 'package:la_vie/shared/my_widget.dart';

import '../../shared/reusables/reusables_appbar.dart';

class QuestionLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return BlocConsumer<AppCubit,AppStates>( listener: (context,state){},
        builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child:Stack(
              alignment: AlignmentDirectional.topEnd,

              children: [
                Image(
                  image: AssetImage('images/homeBackground.jpeg'),
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                buildAppbar(context),
                Padding(
                  padding: const EdgeInsets.all(150.0),
                  child: Card(
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(children: const [
                                TextSpan(text: 'Question of this week.. ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),


                              ])),
                              myDivider(),
                              SizedBox(height: 20,),
                              Text('${questions[0].question}',
                                style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400) ,),


                              for(int i=0;i<questions[0].answer.length;i++)
                                Container(
                                  width: double.infinity,
                                  height: 58,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color:(AppCubit.get(context).isPressed)?
                                      (questions[0].answer.entries.toList()[i].value)?
                                      Colors.green:Colors.red
                                      :Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          color: Color(0xff6F6F6F))),
                                  child: TextButton(onPressed: (){

                                    if(AppCubit.get(context).isPressed==false) {
                                      AppCubit.get(context).showAnswer();
                                      if(questions[0].answer.entries.toList()[i].value)
                                        AppCubit.get(context).checkTrue();

                                      if(questions[0].answer.entries.toList()[i].value==false)
                                        AppCubit.get(context).checkFalse();

                                    }
                                  },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text('${questions[0].answer.keys.toList()[i]}'
                                          ,style: TextStyle(fontSize: 14,color: Colors.black,)),
                                    ),
                                  ),

                                ),


                              if(AppCubit.get(context).isTrue)
                             Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('You have background about plant keep going :)'
                                        ,style: TextStyle(fontSize: 14,color: Colors.black,)),
                                  ),
                                Spacer(),
                                  Container(
                                    width: 150,
                                    height: 58,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Color(0xff1ABC00))),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context)=>HomeLayout()));

                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [

                                            Text(
                                              'Submit',
                                              style: TextStyle(
                                                color: Color(0xff1ABC00),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),

                              if(AppCubit.get(context).isFalse)
                             Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text('You need to read more about planet'
                                        ,style: TextStyle(fontSize: 14,color: Colors.black,)),
                                  ),
                                Spacer(),
                                  Container(
                                    width: 140,
                                    height: 48,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Color(0xff6F6F6F))),
                                    child: TextButton(
                                        onPressed: () {


                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [

                                            Text(
                                              'Read More',
                                              style: TextStyle(
                                                color: Color(0xff6F6F6F),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 48,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Color(0xff1ABC00))),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context)=>HomeLayout()));

                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [

                                            Text(
                                              'Later',
                                              style: TextStyle(
                                                color: Color(0xff1ABC00),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),

                            ],),
                        ),
                      )
                  ),
                )

              ],
            ) ,),


        );
      },);
  }
}
// Column(
// children: [
//
// Padding(
// padding: const EdgeInsets.all(18.0),
// child: Container(
// width: double.infinity,
// height: 50,
// decoration: BoxDecoration(
// color: Colors.white,
// border: Border.all(color: Color(0xff3f4768),width: 2),
// borderRadius: BorderRadius.all(Radius.circular(30))
//
// ),
// child: Stack(
// children: [
// LayoutBuilder(
// builder: (context, constrains)=>  Container(
// width: constrains.maxWidth*0.5,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [Color(0xFF46A0AE),
// Color(0xFF00FFCB)],
// begin: Alignment.centerLeft,
// end: Alignment.centerRight,
// ),
// borderRadius: BorderRadius.all(Radius.circular(30))
// ),
// ),
//
// ),
// Positioned.fill(
//
//
// child: Padding(
// padding: const EdgeInsets.all(12.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('30 sec',style: TextStyle(color: Colors.white),),
// Icon( Icons.watch_later_outlined),
//
// ],
// ),
// ))
// ],
// ),
// ),
// )
// ],
// ),