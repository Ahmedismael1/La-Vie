abstract class AppStates{}
class AppStatesInitialState extends AppStates{}
class AppStatesLoadingState extends AppStates{}
class AppStatesSuccessState extends AppStates{}
class AppStatesErrorState extends AppStates{
  String error;
  AppStatesErrorState({this.error});
}
class ShowAnswerState extends AppStates{}
class CheckTrueState extends AppStates{}

class GetPlantsLoadingState extends  AppStates{}
class  GetPlantsSuccessState extends  AppStates{}
class  GetPlantsErrorState extends  AppStates{
  String error;
   GetPlantsErrorState({this.error});
}
class GetToolsLoadingState extends  AppStates{}
class  GetToolsSuccessState extends  AppStates{}
class  GetToolsErrorState extends  AppStates{
  String error;
   GetToolsErrorState({this.error});
}
class GetSeedsLoadingState extends  AppStates{}
class  GetSeedsSuccessState extends  AppStates{}
class  GetSeedsErrorState extends  AppStates{
  String error;
   GetSeedsErrorState({this.error});
}
class GetPlantDetailsLoadingState extends  AppStates{}
class  GetPlantDetailsSuccessState extends  AppStates{}
class  GetPlantDetailsErrorState extends  AppStates{
  String error;
   GetPlantDetailsErrorState({this.error});
}

class GetBlogsLoadingState extends  AppStates{}
class  GetBlogsSuccessState extends  AppStates{}
class  GetBlogsErrorState extends  AppStates{
  String error;
   GetBlogsErrorState({this.error});
}

class IncreaseQualityState extends AppStates{}
class DecreaseQualityState extends AppStates{}

