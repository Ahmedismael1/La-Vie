import 'package:flutter/material.dart';
import 'package:la_vie/shared/my_widget.dart';
import 'package:la_vie/shared/reusables/reusable_text_filed.dart';

class ForumsLayout extends StatelessWidget {

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
            Column(

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
                                padding: EdgeInsets.all(35)),
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
                                padding: EdgeInsets.all(35)),
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
                                padding: EdgeInsets.all(35)),
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
                                padding: EdgeInsets.all(35)),
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
                                padding: EdgeInsets.all(35)),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart),
                            iconSize: 20,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.park),
                              iconSize: 20),
                          TextButton(
                            onPressed: () {},
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'images/userimage.jpg',
                              ),
                              radius: 10,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(children: [
                  Text(
                    'Forums',
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

                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size(150, 50),
                            ),
                            child: Text(
                              'All Forums',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                        child: TextButton(
                            onPressed: () {

                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size(150, 50),
                            ),
                            child: Text(
                              'My Forums',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff1abc00),
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
                        width: 45,
                      ),
                      Container(
                        color: Color(0xff1abc00).withOpacity(0),
                        height: 1.5,
                        width: 110,
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Container(
                        color: Color(0xff1abc00),
                        height: 1.5,
                        width: 110,
                      ),
                    ],
                  ),
                  myDivider(),
                  Row(
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                          child:
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(children: [
                             Card(
                               elevation: 10,
                               child: Container(
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.all(3),
                                       child: Card(
                                         child: Column(
                                           children: [
                                             Row(
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(2),
                                                   child: CircleAvatar(
                                                     backgroundImage: AssetImage('images/userimage.jpg'),
                                                     radius: 24,
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: Padding(
                                                     padding: EdgeInsets.symmetric(horizontal: 8),
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text('Ahmed ismael',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.bold, fontSize: 16)),
                                                         SizedBox(
                                                           height: 3,
                                                         ),
                                                         Text('12:50 pm 20:8:2022',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.w400,
                                                                 fontSize: 12,
                                                                 color: Colors.grey.shade500)),
                                                       ],
                                                     ),
                                                   ),
                                                 ),

                                               ],
                                             ),
                                             SizedBox(
                                               height: 10,
                                             ),
                                             myDivider(),
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Text(
                                                     "How To  treat cactus plant ?",
                                                     style: TextStyle(fontWeight: FontWeight.w600),
                                                   ),
                                                 ),      Padding(
                                                   padding: EdgeInsets.all(17),
                                                   child: Text(
                                                     "leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and",
                                                     style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14),
                                                   ),
                                                 ),
                                                 //    if (postModel.postImage != '')
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Image(
                                                     image: AssetImage('images/bestSeller.png'),
                                                     height: 250,
                                                     width: double.infinity,
                                                     fit: BoxFit.cover,
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(horizontal: 7),
                                                   child: Row(
                                                     children: [
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {},
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               children: const [
                                                                 Icon(
                                                                   Icons.favorite_border,
                                                                   color: Colors.grey,
                                                                 ),
                                                                 SizedBox(width: 4,),
                                                                 Text("Like")
                                                               ],
                                                             ),
                                                           )),
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {

                                                               // Navigator.push(
                                                               //     context,
                                                               //     MaterialPageRoute(
                                                               //         builder: (context) => CommentPage(postId:   SocialCubit.get(context).postId[index],
                                                               //
                                                               //         )));
                                                             },
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               mainAxisAlignment: MainAxisAlignment.end,
                                                               children: [
                                                                 Icon(
                                                                   Icons.comment,
                                                                   color: Colors.grey.shade700,
                                                                 ),
                                                                 Text("Comment")
                                                               ],
                                                             ),
                                                           ))
                                                     ],
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(vertical: 0),
                                                   child: Card(
                                                       elevation: 0,
                                                       color: Colors.grey.shade50,
                                                       child:
                                                       InkWell(child:
                                                       Row(
                                                         children: [
                                                           CircleAvatar(
                                                             backgroundImage: NetworkImage('images/userimage.jpg'),
                                                           ),
                                                           Expanded(
                                                               child: Container(
                                                                 height: 60,
                                                                 padding: EdgeInsets.all(12),
                                                                 child: TextFormField(
                                                                   enabled: false,

                                                                   decoration: InputDecoration(
                                                                     labelText: 'Write a comment',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(10.0),
                                                                     ),
                                                                   ),
                                                                 ),
                                                               )),
                                                           IconButton(onPressed: (){

                                                           }, icon:  const Icon(
                                                             Icons.comment,
                                                             size: 28,
                                                             color: Colors.black,
                                                           ))
                                                         ],
                                                       ),
                                                         onTap: (){
                                                         },)
                                                   ),
                                                 ),
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Card(
                               elevation: 10,
                               child: Container(
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.all(3),
                                       child: Card(
                                         child: Column(
                                           children: [
                                             Row(
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(2),
                                                   child: CircleAvatar(
                                                     backgroundImage: AssetImage('images/userimage.jpg'),
                                                     radius: 24,
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: Padding(
                                                     padding: EdgeInsets.symmetric(horizontal: 8),
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text('Ahmed ismael',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.bold, fontSize: 16)),
                                                         SizedBox(
                                                           height: 3,
                                                         ),
                                                         Text('12:50 pm 20:8:2022',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.w400,
                                                                 fontSize: 12,
                                                                 color: Colors.grey.shade500)),
                                                       ],
                                                     ),
                                                   ),
                                                 ),

                                               ],
                                             ),
                                             SizedBox(
                                               height: 10,
                                             ),
                                             myDivider(),
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Text(
                                                     "How To  treat cactus plant ?",
                                                     style: TextStyle(fontWeight: FontWeight.w600),
                                                   ),
                                                 ),      Padding(
                                                   padding: EdgeInsets.all(17),
                                                   child: Text(
                                                     "leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and",
                                                     style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14),
                                                   ),
                                                 ),
                                                 //    if (postModel.postImage != '')
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Image(
                                                     image: AssetImage('images/bestSeller.png'),
                                                     height: 250,
                                                     width: double.infinity,
                                                     fit: BoxFit.cover,
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(horizontal: 7),
                                                   child: Row(
                                                     children: [
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {},
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               children: const [
                                                                 Icon(
                                                                   Icons.favorite_border,
                                                                   color: Colors.grey,
                                                                 ),
                                                                 SizedBox(width: 4,),
                                                                 Text("Like")
                                                               ],
                                                             ),
                                                           )),
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {

                                                               // Navigator.push(
                                                               //     context,
                                                               //     MaterialPageRoute(
                                                               //         builder: (context) => CommentPage(postId:   SocialCubit.get(context).postId[index],
                                                               //
                                                               //         )));
                                                             },
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               mainAxisAlignment: MainAxisAlignment.end,
                                                               children: [
                                                                 Icon(
                                                                   Icons.comment,
                                                                   color: Colors.grey.shade700,
                                                                 ),
                                                                 Text("Comment")
                                                               ],
                                                             ),
                                                           ))
                                                     ],
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(vertical: 0),
                                                   child: Card(
                                                       elevation: 0,
                                                       color: Colors.grey.shade50,
                                                       child:
                                                       InkWell(child:
                                                       Row(
                                                         children: [
                                                           CircleAvatar(
                                                             backgroundImage: NetworkImage('images/userimage.jpg'),
                                                           ),
                                                           Expanded(
                                                               child: Container(
                                                                 height: 60,
                                                                 padding: EdgeInsets.all(12),
                                                                 child: TextFormField(
                                                                   enabled: false,

                                                                   decoration: InputDecoration(
                                                                     labelText: 'Write a comment',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(10.0),
                                                                     ),
                                                                   ),
                                                                 ),
                                                               )),
                                                           IconButton(onPressed: (){

                                                           }, icon:  const Icon(
                                                             Icons.comment,
                                                             size: 28,
                                                             color: Colors.black,
                                                           ))
                                                         ],
                                                       ),
                                                         onTap: (){
                                                         },)
                                                   ),
                                                 ),
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Card(
                               elevation: 10,
                               child: Container(
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.all(3),
                                       child: Card(
                                         child: Column(
                                           children: [
                                             Row(
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(2),
                                                   child: CircleAvatar(
                                                     backgroundImage: AssetImage('images/userimage.jpg'),
                                                     radius: 24,
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: Padding(
                                                     padding: EdgeInsets.symmetric(horizontal: 8),
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text('Ahmed ismael',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.bold, fontSize: 16)),
                                                         SizedBox(
                                                           height: 3,
                                                         ),
                                                         Text('12:50 pm 20:8:2022',
                                                             style: TextStyle(
                                                                 fontWeight: FontWeight.w400,
                                                                 fontSize: 12,
                                                                 color: Colors.grey.shade500)),
                                                       ],
                                                     ),
                                                   ),
                                                 ),

                                               ],
                                             ),
                                             SizedBox(
                                               height: 10,
                                             ),
                                             myDivider(),
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Text(
                                                     "How To  treat cactus plant ?",
                                                     style: TextStyle(fontWeight: FontWeight.w600),
                                                   ),
                                                 ),      Padding(
                                                   padding: EdgeInsets.all(17),
                                                   child: Text(
                                                     "leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and",
                                                     style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14),
                                                   ),
                                                 ),
                                                 //    if (postModel.postImage != '')
                                                 Padding(
                                                   padding: EdgeInsets.all(7),
                                                   child: Image(
                                                     image: AssetImage('images/bestSeller.png'),
                                                     height: 250,
                                                     width: double.infinity,
                                                     fit: BoxFit.cover,
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(horizontal: 7),
                                                   child: Row(
                                                     children: [
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {},
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               children: const [
                                                                 Icon(
                                                                   Icons.favorite_border,
                                                                   color: Colors.grey,
                                                                 ),
                                                                 SizedBox(width: 4,),
                                                                 Text("Like")
                                                               ],
                                                             ),
                                                           )),
                                                       Expanded(
                                                           child: InkWell(
                                                             onTap: () {

                                                               // Navigator.push(
                                                               //     context,
                                                               //     MaterialPageRoute(
                                                               //         builder: (context) => CommentPage(postId:   SocialCubit.get(context).postId[index],
                                                               //
                                                               //         )));
                                                             },
                                                             highlightColor: Colors.blue.shade300,
                                                             child: Row(
                                                               mainAxisAlignment: MainAxisAlignment.end,
                                                               children: [
                                                                 Icon(
                                                                   Icons.comment,
                                                                   color: Colors.grey.shade700,
                                                                 ),
                                                                 Text("Comment")
                                                               ],
                                                             ),
                                                           ))
                                                     ],
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding: EdgeInsets.symmetric(vertical: 0),
                                                   child: Card(
                                                       elevation: 0,
                                                       color: Colors.grey.shade50,
                                                       child:
                                                       InkWell(child:
                                                       Row(
                                                         children: [
                                                           CircleAvatar(
                                                             backgroundImage: NetworkImage('images/userimage.jpg'),
                                                           ),
                                                           Expanded(
                                                               child: Container(
                                                                 height: 60,
                                                                 padding: EdgeInsets.all(12),
                                                                 child: TextFormField(
                                                                   enabled: false,

                                                                   decoration: InputDecoration(
                                                                     labelText: 'Write a comment',
                                                                     border: OutlineInputBorder(
                                                                       borderRadius: BorderRadius.circular(10.0),
                                                                     ),
                                                                   ),
                                                                 ),
                                                               )),
                                                           IconButton(onPressed: (){

                                                           }, icon:  const Icon(
                                                             Icons.comment,
                                                             size: 28,
                                                             color: Colors.black,
                                                           ))
                                                         ],
                                                       ),
                                                         onTap: (){
                                                         },)
                                                   ),
                                                 ),
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ],),
                         )
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 4,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                     Container(
                                       height: 40,
                                       child: ReusableTextFiled(
                                         prefixIcon: Icon(Icons.search,),
                                         hintText: 'Search in Forums',
                                       ),
                                     ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 40,
                                        child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor: Color(0xff1abc00),
                                            ),
                                            child: Text(
                                              'Search',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      myDivider(),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height: 40,
                                        decoration: BoxDecoration(
                                      
                                            border: Border.all(
                                                color: Color(0xff1abc00)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                          
                                            ),
                                            child: Text(
                                              'Add Post',
                                              style: TextStyle(
                                                color: Color(0xff1abc00),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))

                  ],)
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }
}
