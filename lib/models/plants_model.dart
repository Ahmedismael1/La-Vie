class PlantsModel {
  String  type;
  String  message;
  List<PlantsData>  plantsData;

  PlantsModel({this.type, this.message, this.plantsData});

  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      plantsData = <PlantsData>[];
      json['data'].forEach((v) {
        plantsData.add(new PlantsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.plantsData != null) {
      data['data'] = this.plantsData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlantsData {
  String  plantId;
  String  name;
  String  description;
  String  imageUrl;
  int  waterCapacity;
  int  sunLight;
  int  temperature;

  PlantsData(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  PlantsData.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this.plantId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['waterCapacity'] = this.waterCapacity;
    data['sunLight'] = this.sunLight;
    data['temperature'] = this.temperature;
    return data;
  }
}
