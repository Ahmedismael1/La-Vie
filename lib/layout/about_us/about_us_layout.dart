

import 'package:flutter/material.dart';
import 'package:la_vie/shared/reusables/reusables_appbar.dart';

class AboutUsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image(
              image: AssetImage('images/homeBackground.jpeg'),
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            Column(children: [
              buildAppbar(context),
              SizedBox(
                height: 20,
              ),
              Text(
                'About US',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('About Us',style:  TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Text(
                            'Welcome to La Vie, your number one source for planting. We\'re dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ',
                            style: TextStyle(
                              color: Color(0xff7D7B7B),
                              fontSize: 12,
                            ),
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],

                  ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.09,),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Container(
                        height: 230,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Color(0xfff7f7f7),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)),
                            border: Border.all(
                                color: Color(0xff1ABC00))),
                      ),
                      Container(
                        width: 320,

                        child: Image(
                          image: AssetImage('images/aboutUs.png'),
                          height: 220,
                        ),
                      ),

                    ],
                  )
                ],
              ),

            ],),
          ],
        ),
      ),
    );
  }
}
