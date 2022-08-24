import 'package:flutter/material.dart';
import 'package:la_vie/shared/reusables/reusables_appbar.dart';
import 'package:la_vie/shared/reusables/reusables_end_bar.dart';

class BlogsDetailsLayout extends StatelessWidget {
  String name ,imageUrl,description,id;
  BlogsDetailsLayout({this.description,this.name,this.imageUrl,this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppbar(context),

            if(imageUrl=='')
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.network('images/blogs.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width*.9 ,
                  height: 400,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 170,height: 150,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),
              ),
            if(imageUrl!='')

              Padding(
                padding: const EdgeInsets.all(50),
                child: Image(
                  image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${imageUrl}'),
                  width: MediaQuery.of(context).size.width*.9,
                  height: 450,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 170,height: 150,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                '${name}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Information',
                style: TextStyle(
                  color: Color(0xff979797),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s \n standard dummy textever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only fivecenturies, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like AldusPageMaker including versions of Lorem Ipsum.',
                maxLines: 10,
                style: TextStyle(
                  color: Color(0xff979797),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
            ),
            SizedBox(height: 50,),
            buildEndBar(context)
          ],),
      ),
    );
  }
}
