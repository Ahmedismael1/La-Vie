import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/models/plant_details_model.dart';

class ProductDetailsLayout extends StatelessWidget {

  String name ,imageUrl,description;
  ProductDetailsLayout({this.description,this.name,this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
      builder: (context,state){
          PlantDetailsModel plantDetailsModel;
        plantDetailsModel =  AppCubit.get(context).plantDetails  ;

        return
            (AppCubit.get(context).plantDetails !=null)?
            Scaffold(
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
                Row(

                  children: [
                    if(imageUrl=='')
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 80.0, top: 100),
                          child: Image.network('images/bestSeller.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 500,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return  Container(width: 170,height: 150,child:
                              Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                              // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                            },

                          ),
                        ),
                      ),
                    if(imageUrl!='')

                      Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80.0, top: 100),
                        child: Image(
                          image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${imageUrl}'),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 500,
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return  Container(width: 170,height: 150,child:
                            Center(child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.grey)),);
                            // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              child: Text(
                                'EGP ${plantDetailsModel.data.price}.00',
                                style: TextStyle(
                                    color: Color(0xff1ABC00),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 85,height: 80,
                                      color: Color(0xff9fd9d9).withOpacity(0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: '${plantDetailsModel.data.plant.sunLight/10}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold),),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(2, -4),
                                                        child: Text(
                                                          '%',
                                                          //superscript is usually smaller in size
                                                          textScaleFactor: 0.7,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                                SizedBox(width: 3,),
                                                Icon(Icons.wb_sunny,color: Colors.yellowAccent,size: 14,)
                                              ],
                                            ),
                                            Text('Sun light',style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))
                                          ],
                                        ),
                                      )),
                                  SizedBox(width: 40,),
                                  Container(
                                      width: 85,height: 80,
                                      color: Color(0xff9fd9d9).withOpacity(0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: '${plantDetailsModel.data.plant.waterCapacity/10}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold),),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(2, -4),
                                                        child: Text(
                                                          '%',
                                                          //superscript is usually smaller in size
                                                          textScaleFactor: 0.7,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                                SizedBox(width: 3,),
                                                Icon(Icons.water_drop,color: Colors.blueAccent,size: 14,)
                                              ],
                                            ),
                                            Text('Water',style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))
                                          ],
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 40,),
                                  Container(
                                      width: 85,height: 80,
                                      color: Color(0xff9fd9d9).withOpacity(0.3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: '${plantDetailsModel.data.plant.temperature/10}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold),),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(2, -4),
                                                        child: Text(
                                                          'c',
                                                          //superscript is usually smaller in size
                                                          textScaleFactor: 0.7,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                                SizedBox(width: 3,),
                                                Icon(Icons.device_thermostat,color: Colors.pink,size: 14,)
                                              ],
                                            ),
                                            Text('Temperature',style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text('Information',
                                style: TextStyle(
                                  color: Color(0xff979797),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Text('${description}',
                                maxLines: 6,
                                style: TextStyle(
                                  color: Color(0xff979797),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(children: [
                                Text('Qty',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                TextButton(onPressed: (){
                                  AppCubit.get(context).increase();
                                },
                                  child: Text('+',
                                      style: TextStyle(

                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),),
                                Text('${AppCubit.get(context).quality}'),
                                TextButton(onPressed: (){
                                  if(AppCubit.get(context).quality!=1)
                                  AppCubit.get(context).decrease();
                                },
                                  child: Text('-',
                                      style: TextStyle(

                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),),
                              ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextButton(
                                  onPressed: () {


                                  },
                                  style: TextButton.styleFrom(
                                    elevation: 5,
                                    fixedSize: Size(
                                        MediaQuery.of(context)
                                            .size
                                            .width,
                                        60),
                                    backgroundColor: Color(0xff1abc00),
                                  ),
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),

                          ],
                        ))
                  ],
                ),
              ],
            )
          ],
        )
      ),
    ):Container(
              height: 600,
              child: Center(child:
              CircularProgressIndicator(strokeWidth: 2
                  ,backgroundColor: Colors.grey)),
            );
          }
          ,);
  }
}
