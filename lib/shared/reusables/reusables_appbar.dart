


import 'package:flutter/material.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/layout/Cart/cart_layout.dart';
import 'package:la_vie/layout/Forums/forums_layout.dart';
import 'package:la_vie/layout/about_us/about_us_layout.dart';
import 'package:la_vie/layout/blogs/blogs_layout.dart';
import 'package:la_vie/layout/home/home_layout.dart';
import 'package:la_vie/layout/my_profile/my_profile_layout.dart';

Color homeColor =Color(0xff1abc00);
Color shopColor =Colors.black;
Color blogColor =Colors.black;
Color aboutColor =Colors.black;
Color communityColor =Colors.black;
Widget buildAppbar(context){

  return  Row(
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
              style:
              TextButton.styleFrom(padding: EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
                homeColor=Color(0xff1abc00);
                 shopColor =Colors.black;
                 blogColor =Colors.black;
                 aboutColor =Colors.black;
                 communityColor =Colors.black;
              },
              child: Text(
                'Home',
                style: TextStyle(
                    color: homeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style:
              TextButton.styleFrom(padding: EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartLayout()));
                shopColor=Color(0xff1abc00);
                blogColor =Colors.black;
                aboutColor =Colors.black;
                communityColor =Colors.black;
                homeColor =Colors.black;

              },
              child: Text(
                'Shop',
                style: TextStyle(
                    color: shopColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style:
              TextButton.styleFrom(padding: EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BlogsLayout()));
                blogColor=Color(0xff1abc00);
                shopColor =Colors.black;
                aboutColor =Colors.black;
                communityColor =Colors.black;
                homeColor =Colors.black;
              },
              child: Text(
                'Blog',
                style: TextStyle(
                    color: blogColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style:
              TextButton.styleFrom(padding: EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsLayout()));
                aboutColor=Color(0xff1abc00);
                blogColor =Colors.black;
                shopColor =Colors.black;
                communityColor =Colors.black;
                homeColor =Colors.black;
              },
              child: Text(
                'About',
                style: TextStyle(
                    color: aboutColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style:
              TextButton.styleFrom(padding: EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForumsLayout()));
                communityColor=Color(0xff1abc00);
                blogColor =Colors.black;
                aboutColor =Colors.black;
                shopColor =Colors.black;
                homeColor =Colors.black;
              },
              child: Text(
                'Community',
                style: TextStyle(
                    color: communityColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartLayout()));

              },
              icon: Icon(Icons.shopping_cart),
              iconSize: 20,
            ),
              PopupMenuButton(itemBuilder: (BuildContext context) =>[
                PopupMenuItem(child:notificationItemWithOutComment(context),),
                PopupMenuItem(child:notificationItemWithComment(context),),
              PopupMenuItem(child:notificationItemWithOutComment(context),)
              ],child: Icon(Icons.notifications),elevation: 5,),


            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileLayout()));

              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  AppCubit.get(context).currentUserModel.data.imageUrl,
                ),
                radius: 10,
              ),
            )
          ],
        ),
      )
    ],
  );
}
Widget notificationItemWithComment (context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    child: Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                AppCubit.get(context).currentUserModel.data.imageUrl,
              ),
              radius: 16.0,
            ),
            Text(
              'Joy Arnold ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              height: 70.0,
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                      width: 4.0,
                      color: Colors.grey,
                    )
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Yesterday at 11:42 PM',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);

Widget notificationItemWithOutComment (context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    child: Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:  NetworkImage(
                AppCubit.get(context).currentUserModel.data.imageUrl,
              ),
              radius: 16.0,
            ),
            SizedBox(width: 10,),
            Text(
              'Joy Arnold ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Joy Arnold left 6 comments on Your Post',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              'Yesterday at 11:42 PM',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);