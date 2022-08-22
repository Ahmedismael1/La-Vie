
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/models/blogs_model.dart';

class BlogsLayout extends StatelessWidget {

  int childAspectRatio=1078;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(listener: (context,state){},
      builder: (context,state){
      return
        (AppCubit.get(context).blogsModel !=null)?
        LayoutBuilder(builder: (context,constraints){
      if(constraints.minWidth.toInt() >=1330 ) {
        return Scaffold(
          body: ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image(
                    image: AssetImage('images/homeBackground.jpeg'),
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text("Blogs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),),
                          Expanded(
                              flex: 5,
                              child:
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Search in Blogs',
                                prefixIcon: Icon(Icons.search),
                                prefixIconColor: Color(0xff1abc00),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:  BorderSide(
                                    color: Color(0xff1abc00),
                                    width: 1.0),
                              ),),
                              ),
                          )
                          ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
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
                      ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Plants",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    Container(

                      child: GridView.count(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.98,
                        children: List.generate(
                          AppCubit.get(context).blogsModel.data.plants.length,
                              (index) => builderBlogsPlants(AppCubit.get(context).blogsModel.data.plants[index]),

                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Seeds",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    Container(

                      child: GridView.count(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.98,
                        children: List.generate(
                          AppCubit.get(context).blogsModel.data.seeds.length,
                              (index) => builderBlogsSeeds(AppCubit.get(context).blogsModel.data.seeds[index]),

                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Tools",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      Container(

                        child: GridView.count(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          childAspectRatio: 1/0.98,
                          children: List.generate(
                            AppCubit.get(context).blogsModel.data.tools.length,
                                (index) => builderBlogsTools(AppCubit.get(context).blogsModel.data.tools[index]),

                          ),
                        ),
                      ),
                  ],)
                ],)
            ],
          ),

        );
      }
      else if(constraints.minWidth.toInt()>=1055){
        return Scaffold(
          body: ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image(
                    image: AssetImage('images/homeBackground.jpeg'),
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text("Blogs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),),
                          Expanded(
                              flex: 5,
                              child:
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search in Blogs',
                                    prefixIcon: Icon(Icons.search),
                                    prefixIconColor: Color(0xff1abc00),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:  BorderSide(
                                          color: Color(0xff1abc00),
                                          width: 1.0),
                                    ),),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
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
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Plants",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Container(

                      child: GridView.count(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.98,
                        children: List.generate(
                                AppCubit.get(context).blogsModel.data.plants.length,
                                    (index) => builderBlogsPlants(AppCubit.get(context).blogsModel.data.plants[index]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Seeds",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Container(

                      child: GridView.count(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.98,
                        children: List.generate(
                          AppCubit.get(context).blogsModel.data.seeds.length,
                              (index) => builderBlogsSeeds(AppCubit.get(context).blogsModel.data.seeds[index]),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Tools",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Container(

                      child: GridView.count(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1/0.98,
                        children: List.generate(
                          AppCubit.get(context).blogsModel.data.tools.length,
                              (index) => builderBlogsTools(AppCubit.get(context).blogsModel.data.tools[index]),

                        ),
                      ),
                    ),
                  ],)
                ],)
            ],
          ),

        );
      }
      return Scaffold(
        body: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image(
                  image: AssetImage('images/homeBackground.jpeg'),
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                Column(
crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text("Blogs",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),),
                        Expanded(
                            flex: 5,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search in Blogs',
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: Color(0xff1abc00),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:  BorderSide(
                                        color: Color(0xff1abc00),
                                        width: 1.0),
                                  ),),
                              ),
                            )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50,
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
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Plants",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(

                    child: GridView.count(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1/0.87,
                      children: List.generate(
                        AppCubit.get(context).blogsModel.data.plants.length,
                            (index) => builderBlogsPlants(AppCubit.get(context).blogsModel.data.plants[index]),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Seeds",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(

                    child: GridView.count(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1/0.87,
                      children: List.generate(
                        AppCubit.get(context).blogsModel.data.seeds.length,
                            (index) => builderBlogsSeeds(AppCubit.get(context).blogsModel.data.seeds[index]),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Tools",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(

                    child: GridView.count(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1/0.87,
                      children: List.generate(
                        AppCubit.get(context).blogsModel.data.tools.length,
                            (index) => builderBlogsTools(AppCubit.get(context).blogsModel.data.tools[index]),


                      ),
                    ),
                  ),
                ],)
              ],)
          ],
        ),

      );

    })
            :Container(
          height: 600,
          child: Center(child:
          CircularProgressIndicator(strokeWidth: 2
              ,backgroundColor: Colors.grey)),
        );
      }, );
  }
  Widget builderBlogsPlants(Plants plants) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        elevation: 3,
        child: Container(
          child: ListView(

            children: [
              if(plants.imageUrl=='')
              Image.network('images/blogs.png',
                fit: BoxFit.cover,
                width: 240,
                height: 140,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 200,height: 140,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

              ),
              if(plants.imageUrl!='')
              Image.network('https://lavie.orangedigitalcenteregypt.com${plants.imageUrl}',
                fit: BoxFit.cover,
                width: 240,
                height: 140,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 200,height: 140,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${plants.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${plants.description}',
                  style: TextStyle(
                    color: Color(0xff7D7B7B),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    onTap: (){
    },);

  Widget builderBlogsSeeds(Seeds seeds) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        elevation: 3,
        child: Container(
          child: ListView(

            children: [
              if(seeds.imageUrl=='')
                Image.network('images/blogs.png',
                  fit: BoxFit.cover,
                  width: 240,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 200,height: 140,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),
              if(seeds.imageUrl!='')
                Image.network('https://lavie.orangedigitalcenteregypt.com${seeds.imageUrl}',
                  fit: BoxFit.cover,
                  width: 240,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 200,height: 140,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),


              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${seeds.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${seeds.description}',
                  style: TextStyle(
                    color: Color(0xff7D7B7B),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    onTap: (){
    },);

  Widget builderBlogsTools(Tools tools) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        elevation: 3,
        child: Container(
          child: ListView(

            children: [
              if(tools.imageUrl=='')
                Image.network('images/blogs.png',
                  fit: BoxFit.cover,
                  width: 240,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 200,height: 140,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),
              if(tools.imageUrl!='')
                Image.network('https://lavie.orangedigitalcenteregypt.com${tools.imageUrl}',
                  fit: BoxFit.cover,
                  width: 240,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 200,height: 140,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),


              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${tools.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${tools.name}',
                  style: TextStyle(
                    color: Color(0xff7D7B7B),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    onTap: (){
    },);

}
