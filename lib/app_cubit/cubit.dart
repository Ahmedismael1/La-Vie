

import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/states.dart';
import 'package:la_vie/models/blogs_model.dart';
import 'package:la_vie/models/plant_details_model.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/seeds_model.dart';
import 'package:la_vie/models/tools_model.dart';
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