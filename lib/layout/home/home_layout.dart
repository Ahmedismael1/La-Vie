import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/layout/product_details/product_details_layout.dart';
import 'package:la_vie/layout/questions/question_layout.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/seeds_model.dart';
import 'package:la_vie/models/tools_model.dart';
import 'package:la_vie/shared/reusables/reusables_appbar.dart';
import 'package:la_vie/shared/reusables/reusables_end_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/shared_preference/shared_preferences.dart';

class HomeLayout extends StatelessWidget {
var todayDateTime ;
var savedTime=CashHelper.getData(key: 'todayDateTime');
var now = DateTime.now().millisecondsSinceEpoch.toInt();
final Uri _playStoreUrl = Uri.parse('https://play.google.com/store/games');

Future<void> _launchPlayStoreUrl() async {
  if (!await launchUrl(_playStoreUrl)) {
    throw 'Could not launch $_playStoreUrl';
  }
}

final Uri __appStoreUrl = Uri.parse('https://www.apple.com/app-store/');

Future<void> _launchAppStoreUrl() async {
  if (!await launchUrl(__appStoreUrl)) {
    throw 'Could not launch $__appStoreUrl';
  }
}
final Uri _url = Uri.parse('https://aboutplants.com/');

Future<void> _plantUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: BlocConsumer<AppCubit,AppStates>(
          listener:(context,state){},
          builder: (context,state){
            var cubit= AppCubit.get(context);
            return
              (cubit.plantsModel!= null&&cubit.toolsModel!=null&&cubit.seedsModel!=null
                  &&cubit.currentUserModel!=null)?
              SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image(
                      image: AssetImage('images/homeBackground.jpeg'),
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       buildAppbar(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                cubit.changeTree();
                              },
                              child: AnimatedContainer(
                                width: cubit.isTree?MediaQuery.of(context).size.width * 0.50:MediaQuery.of(context).size.width * 0.49,
                                duration: Duration(seconds: 1),
                                child:Image(
                                  image:(cubit.isTree)? AssetImage('images/tree.jpeg'): AssetImage('images/leaves_image.png'),
                                )
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                (savedTime!=null)?
                                (now-savedTime>=604800000)?
                                TextButton(
                                    onPressed: () {
                                      todayDateTime =DateTime.now().millisecondsSinceEpoch.toInt();
                                      CashHelper.saveData(
                                        key: 'todayDateTime',value: todayDateTime
                                      ).then((value) {
                                        print(todayDateTime-now);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionLayout()));

                                      });

                                    },
                                    onHover: (value) {

                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff1abc00),
                                      child: Icon(
                                        Icons.question_mark,
                                        color: Color(0xfff7f7f7),
                                      ),
                                    )):SizedBox(): TextButton(
                                    onPressed: () {
                                      todayDateTime =DateTime.now().millisecondsSinceEpoch.toInt();
                                      CashHelper.saveData(
                                          key: 'todayDateTime',value: todayDateTime
                                      ).then((value) {
                                        print(todayDateTime-now);
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionLayout()));

                                      });

                                    },
                                    onHover: (value) {

                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff1abc00),
                                      child: Icon(
                                        Icons.question_mark,
                                        color: Color(0xfff7f7f7),
                                      ),
                                    )),
                                SizedBox(height: 130,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Perfect way to plant in house'
                                      ,style: TextStyle(
                                          color: Color(0xff1abc00),fontSize: 25,fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Text(
                                        'leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals.',
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff1ABC00),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              _plantUrl();
                                            },
                                            style: TextButton.styleFrom(
                                              fixedSize: Size(172, 40),
                                              backgroundColor: Color(0xff1abc00),
                                            ),
                                            child: Text(
                                              'Explore Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Plants',style:  TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          height: 280,
                          child: ListView.separated(
                              physics:const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  builderPlanets(AppCubit.get(context).plantsModel.plantsData[index],context),
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              itemCount:cubit.plantsModel.plantsData.length,
                              scrollDirection: Axis.horizontal),
                        ),
                        SizedBox(height: 40,),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Tools',style:  TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          height: 300,
                          child: ListView.separated(
                              physics:const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => builderTools(index,cubit.toolsModel.toolsData[index],context),
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              itemCount:cubit.toolsModel.toolsData.length,
                              scrollDirection: Axis.horizontal),
                        ),


                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Seeds',style:  TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 250,
                          child: ListView.separated(
                              physics:const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => builderSeeds( cubit.seedsModel.data[index],context),
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 6,
                              ),
                              itemCount:cubit.seedsModel.data.length,
                              scrollDirection: Axis.horizontal),
                        ),
                        SizedBox(height: 40,),

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
                        SizedBox(height: 40,),
                        Row(children: [
                          Image(
                            image: AssetImage('images/installApp.png'),
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Text('Mobile Application',style:  TextStyle(
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
                                    'You can install La Vie mobile application and enjoy with new featurs, earn more points and get discounts Also you can scan QR codes in your plants’ pots so that you can get discount on everything in the website up to 70%'
                                    ,
                                    style: TextStyle(
                                      color: Color(0xff7D7B7B),
                                      fontSize: 12,
                                    ),
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                                child: Text(
                                  'Install by:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 150,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Color(0xff6F6F6F))),
                                    child: TextButton(
                                        onPressed: () {
                                          _launchPlayStoreUrl();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [
                                            Image(
                                              image: NetworkImage(

                                                  'https://i0.wp.com/entertainmentbox.com/wp-content/uploads/2019/12/Google-Play-Store-4gnews-1-6.jpg?resize=800%2C494&ssl=1'                                      ),
                                              width: 50,
                                              height: 50,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Play Store',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
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
                                            Image(
                                              image: AssetImage('images/appStore image.jpg'),width: 50,height: 50,),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'App Store',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),


                            ],
                          ),

                        ],),

                        SizedBox(height: 20,),

                        buildEndBar(context)

                      ],
                    )
                  ],
                ),
              )
                  :SingleChildScrollView(
                    child: Container(
                height: 600,
                child: Center(child:
                CircularProgressIndicator(strokeWidth: 2
                      ,backgroundColor: Colors.grey)),
              ),
                  );


          },
        ),
      );
  }
  Widget builderPlanets(PlantsData plantsData,context) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(plantsData.imageUrl=='')
              Image.network('images/bestSeller.png',
                fit: BoxFit.cover,
                width: 170,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 170,height: 150,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

              ),
            if(plantsData.imageUrl!='')
            Image.network('https://lavie.orangedigitalcenteregypt.com${plantsData.imageUrl}',
              fit: BoxFit.cover,
              width: 130,
              height: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return  Container(
                  width: 170,
                  height: 200,
                  child:
                Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
              },

            ),
            SizedBox(height: 10,),
            Text(

              '${plantsData.name}',

              style: TextStyle(

                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      ),
    ),
    onTap: (){
      print(plantsData.plantId);

      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ProductDetailsLayout(
            id: plantsData.plantId,name:plantsData.name ,imageUrl:plantsData.imageUrl
            ,description: plantsData.description,)));
       },);


  Widget builderTools(int index,ToolsData toolsData,context) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 170,
        child: Column(

          mainAxisAlignment: (index%2==0)? MainAxisAlignment.end : MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(toolsData.imageUrl=='')
              Image.network('https://lavie.orangedigitalcenteregypt.com/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png',
                fit: BoxFit.fill,
                width: 170,
                height: 140,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(width: 170,height: 150,child:
                  Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

              ),
            if(toolsData.imageUrl!='')
              Image.network('https://lavie.orangedigitalcenteregypt.com${toolsData.imageUrl}',
                fit: BoxFit.fill,
                width: 170,
                height: 140,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return  Container(
                    width: 170,
                    height: 200,
                    child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                  // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                },

              ),
            SizedBox(height: 10,),
            Text(
              '${toolsData.name}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${toolsData.description}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),


          ],
        ),
      ),
    ),
    onTap: (){
      print(toolsData.toolId);
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ProductDetailsLayout(
            id: toolsData.toolId,name:toolsData.name ,imageUrl:toolsData.imageUrl
            ,description: toolsData.description,)));
    },);

  Widget builderSeeds(SeedsData seedsData,context) =>InkWell(
    child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
elevation: 3,
        child: Container(
          width: 200,
          child: ListView(

            children: [

              if(seedsData.imageUrl=='')
                Image.network('https://lavie.orangedigitalcenteregypt.com/uploads/dcbbe466-416c-4797-a496-7e054495d47b.jpg',
                  fit: BoxFit.fill,
                  width: 171,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(width: 170,height: 150,child:
                    Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),
              if(seedsData.imageUrl!='')
                Image.network('https://lavie.orangedigitalcenteregypt.com${seedsData.imageUrl}',
                  fit: BoxFit.fill,
                  width: 170,
                  height: 140,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return  Container(
                      width: 170,
                      height: 200,
                      child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                    // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                  },

                ),
              SizedBox(height: 10,),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${seedsData.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Text(
                  '${seedsData.description}',
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

      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ProductDetailsLayout(
            id: seedsData.seedId,name:seedsData.name ,imageUrl:seedsData.imageUrl
            ,description: seedsData.description,)));
    },);

}
