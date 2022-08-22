

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/models/blogs_model.dart';
import 'package:la_vie/models/forums_model.dart';
import 'package:la_vie/models/my_forums_model.dart';
import 'package:la_vie/models/plant_details_model.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/seeds_model.dart';
import 'package:la_vie/models/tools_model.dart';
import 'package:la_vie/shared/constants/access_token.dart';
import 'package:la_vie/shared/dio/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStatesInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  PlantsModel plantsModel;

  void getPlants(){
    emit(GetPlantsLoadingState());

    DioHelper.getData(url: 'api/v1/plants')
        .then((value) {
          plantsModel=PlantsModel.fromJson(value.data);
          emit(GetPlantsSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetPlantsErrorState(error: error.toString()));

    });

  }

  ToolsModel toolsModel;
  void getTools(){
    emit(GetToolsLoadingState());

    DioHelper.getData(url: 'api/v1/tools')
        .then((value) {
          toolsModel=ToolsModel.fromJson(value.data);
          emit(GetToolsSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetToolsErrorState(error: error.toString()));

    });

  }
  SeedsModel seedsModel;
  void getSeeds(){
    emit(GetSeedsLoadingState());

    DioHelper.getData(url: 'api/v1/seeds')
        .then((value) {
          seedsModel=SeedsModel.fromJson(value.data);
          emit(GetSeedsSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetSeedsErrorState(error: error.toString()));

    });

  }

  PlantDetailsModel plantDetails;
  void getPlantDetails(
  {    String plantId}){
emit(GetPlantDetailsLoadingState());
    DioHelper.getData(url: 'api/v1/products/${plantId}')
        .then((value) {
      plantDetails=PlantDetailsModel.fromJson(value.data);
      print(plantDetails.data.productId);
      emit(GetPlantDetailsSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(GetPlantDetailsErrorState(error: error.toString()));

    });
  }

  void insertItemToCard (Map<String , dynamic>  data){
    DioHelper.postData(
        url: 'api/v1/products',
        data: data,
      token: accessToken
    ).then((value) {
      print("Insert Item Success : ${value.data}");
      emit(InsertItemSuccessState());
    }).catchError((error){
      print('error when insert item to card : ${error}');
      emit(InsertItemErrorState());
    });
  }

  BlogsModel blogsModel;
  void getBlogs(
  {    String plantId}){
emit(GetBlogsLoadingState());
    DioHelper.getData(url: 'api/v1/products/blogs')
        .then((value) {
      blogsModel=BlogsModel.fromJson(value.data);
      emit(GetBlogsSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(GetBlogsErrorState(error: error.toString()));

    });
  }

MyForumsModel myForumsModel;
  void getMyForums(){

    emit(GetMyForumsLoadingState());
    DioHelper.getData(
      url: 'api/v1/forums/me' ,
    ).then((value) {
      myForumsModel=MyForumsModel.fromJson(value.data);

      emit(GetMyForumsSuccessState());
    }).catchError((error){

      print('Error in GetMyForums is ${error.toString()}');
      emit(GetMyForumsErrorState(error: error.toString()));

    });
  }

  ForumsModel forumsModel;
  void getALLForums(){

    emit(GetAllForumsLoadingState());
    DioHelper.getData(
      url: 'api/v1/forums' ,
    ).then((value) {
      forumsModel=ForumsModel.fromJson(value.data);

      emit(GetAllForumsSuccessState());
    }).catchError((error){

      print('Error in GetAllForums is ${error.toString()}');
      emit(GetAllForumsErrorState(error: error.toString()));

    });
  }


  bool isAllForums=true;
  void changeForumsType(){
    isAllForums=!isAllForums;
    emit(ChangeForumsState());
  }

  void createPost({
     String title,
     String description,
     File image,

  }){

    emit(CreatePostLoadingState());

    DioHelper.postData(
        url: 'api/v1/forums',
        data: {
          "title": title,
          "description": description,
          "imageBase64": image
        }
    ).then((value) {

      print(value.data);
      emit(CreatePostSuccessState());

    }).catchError((error){

      print('Error in CreatePost is ${error.toString()}');
      emit(CreatePostErrorState());
    });


  }

  File postImage ;
  var picker = ImagePicker();

  Future <void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(GetPostImageSuccessState());
    } else {
      print('No Image selected.');
      emit(GetPostImageErrorState());
    }
  }

  int quality =1;

  void increase (){
    quality++;
    emit(IncreaseQualityState());
  }


  void decrease (){
    quality--;
    emit(DecreaseQualityState());
  }

  bool isPressed=false;

  void showAnswer(){
    isPressed =!isPressed;
    emit(ShowAnswerState());
  }
  bool isTrue=false;
  bool isFalse=false;


  void checkTrue(){
    isTrue =!isTrue;
    emit(CheckTrueState());
  }
  void checkFalse(){
    isFalse =!isFalse;
    emit(CheckTrueState());
  }
}