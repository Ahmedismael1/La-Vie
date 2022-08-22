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

class GetAllForumsLoadingState extends  AppStates{}
class  GetAllForumsSuccessState extends  AppStates{}
class  GetAllForumsErrorState extends  AppStates{
  String error;
  GetAllForumsErrorState({this.error});
}

class GetMyForumsLoadingState extends  AppStates{}
class  GetMyForumsSuccessState extends  AppStates{}
class  GetMyForumsErrorState extends  AppStates{
  String error;
  GetMyForumsErrorState({this.error});
}

class CreatePostLoadingState extends  AppStates{}
class  CreatePostSuccessState extends  AppStates{}
class  CreatePostErrorState extends  AppStates{
  String error;
  CreatePostErrorState({this.error});
}

class ChangeForumsState extends  AppStates{}



class  InsertItemSuccessState extends  AppStates{}
class  InsertItemErrorState extends  AppStates{
  String error;
  InsertItemErrorState({this.error});
}

class  GetPostImageSuccessState extends  AppStates{}
class  GetPostImageErrorState extends  AppStates{
  String error;
  GetPostImageErrorState({this.error});
}

class IncreaseQualityState extends AppStates{}
class DecreaseQualityState extends AppStates{}

