

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _facebookUrl = Uri.parse('https://www.facebook.com/profile.php?id=100008303749288');

Future<void> _launchFacebookUrl() async {
  if (!await launchUrl(_facebookUrl)) {
    throw 'Could not launch $_facebookUrl';
  }
}
Widget buildEndBar(context)=>  Container(
  height: 160,
  width: MediaQuery.of(context).size.width,
  color: Color(0xffFAFAFA
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Container(
          width: MediaQuery.of(context).size.width*0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/logo.jpeg',
                  fit: BoxFit.fill, width: 100, height: 50),
              SizedBox(height: 10,),
              RichText(text: TextSpan(children: [
                TextSpan(text: 'LA VIE',style: TextStyle(color:Color(0xff1abc00) )),
                TextSpan(text: ' We\'re dedicated to giving you the very best of plants, with a focus on dependability'),

              ])),
            ],),
        ),
      ),
      SizedBox(width: MediaQuery.of(context).size.width*0.01,),

      Container(
        width: MediaQuery.of(context).size.width*0.13,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Sections",style: TextStyle(
              color: Color(0xff1abc00),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 5,),
            Text("Home",style: TextStyle(
              color: Color(0xff979797),
              fontSize: 14,
            ),),
            SizedBox(height: 5,),

            Text("category",style: TextStyle(
              color: Color(0xff979797),
              fontSize: 14,
            ),),
            SizedBox(height: 5,),

            Text("new",style: TextStyle(
                color: Color(0xff979797),
                fontSize: 14
            ),),
            SizedBox(height: 5,),

            Text("request to be seller",style: TextStyle(
                color: Color(0xff979797),
                fontSize: 14
            ),),
          ],),
      ),
      SizedBox(width: MediaQuery.of(context).size.width*0.01,),

      Container(
        width: MediaQuery.of(context).size.width*0.15,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("CONTACT US",style: TextStyle(
              color: Color(0xff1abc00),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 8,),
            Text("Phone: 010978327050 ",style: TextStyle(
              color: Color(0xff979797),
              fontSize: 12,
            ),),
            SizedBox(height: 8,),

            Text("Telephone: 02246832755",style: TextStyle(
                color: Color(0xff979797),
                fontSize: 12
            ),),
            SizedBox(height: 8,),

            Text(" Email : ahmed@gmail.com",style: TextStyle(
              color: Color(0xff979797),
              fontSize: 12,
            ),),

            SizedBox(height: 8,),

            Text("Address : 6 October city ,Giza ,egypt",style: TextStyle(
                color: Color(0xff979797),
                fontSize: 12
            ),),
          ],),
      ),
      SizedBox(width: MediaQuery.of(context).size.width*0.01,),

      Expanded(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              child: Text("SIGN FOR OUR NEWLETEER AND GET A 10% DISCOUNT"
                ,style: TextStyle(

                  color: Color(0xff1abc00),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),maxLines: 2,),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.16,
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),

                        hintText: 'Your email address'
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width*0.1,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)),
                      border: Border.all(
                          color: Color(0xff6F6F6F))),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: const [

                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )),
                ),

              ],
            ),
            Text("OUR SOCIAL"
              ,style: TextStyle(

                color: Color(0xff1abc00),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),maxLines: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  _launchFacebookUrl();
                }, icon: Icon(Icons.facebook)),

                InkWell(onTap: (){},
                  child: Image(image: AssetImage('images/insta.png'),height:   20,width: 20,),
                ),
                SizedBox(width: 10,),
                InkWell(onTap: (){},
                  child: Image(image: AssetImage('images/twit.png'),height:   20,width: 20,),
                ),
              ],)


          ],),
      ),

    ],),

);
