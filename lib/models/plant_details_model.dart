class PlantDetailsModel {
  String  type;
  String  message;
  PlantDetailsData  data;

  PlantDetailsModel({this.type, this.message, this.data});

  PlantDetailsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new PlantDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class PlantDetailsData {
  String  productId;
  String  name;
  String  description;
  String  imageUrl;
  String  type;
  int  price;
  bool  available;
  Plant  plant;

  PlantDetailsData(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.available,
        this.plant,
        });

  PlantDetailsData.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    plant = json['plant'] != null  ? new Plant.fromJson(json['plant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['type'] = this.type;
    data['price'] = this.price;
    data['available'] = this.available;
    if (this.plant != null) {
      data['plant'] = this.plant.toJson();
    }
    return data;
  }
}

class Plant {
  String  plantId;
  String  name;
  String  description;
  String  imageUrl;
  int  waterCapacity;
  int  sunLight;
  int  temperature;

  Plant(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
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
