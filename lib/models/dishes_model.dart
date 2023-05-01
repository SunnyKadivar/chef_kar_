import 'dart:convert';

DishesModel dishesModelFromJson(String str) => DishesModel.fromJson(json.decode(str));

String dishesModelToJson(DishesModel data) => json.encode(data.toJson());

class DishesModel {
  List<Dish>? dishes;
  List<PopularDish>? popularDishes;

  DishesModel({
    this.dishes,
    this.popularDishes,
  });

  factory DishesModel.fromJson(Map<String, dynamic> json) => DishesModel(
    dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
    popularDishes: List<PopularDish>.from(json["popularDishes"].map((x) => PopularDish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dishes": List<dynamic>.from(dishes!.map((x) => x.toJson())),
    "popularDishes": List<dynamic>.from(popularDishes!.map((x) => x.toJson())),
  };
}

class Dish {
  String? name;
  double? rating;
  String? description;
  List<String>? equipments;
  String? image;
  int? id;

  Dish({
    this.name,
    this.rating,
    this.description,
    this.equipments,
    this.image,
    this.id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
    name: json["name"],
    rating: json["rating"].toDouble(),
    description: json["description"],
    equipments: List<String>.from(json["equipments"].map((x) => x)),
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rating": rating,
    "description": description,
    "equipments": List<dynamic>.from(equipments!.map((x) => x)),
    "image": image,
    "id": id,
  };
}

class PopularDish {
  String? name;
  String? image;
  int? id;

  PopularDish({
    this.name,
    this.image,
    this.id,
  });

  factory PopularDish.fromJson(Map<String, dynamic> json) => PopularDish(
    name: json["name"],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "id": id,
  };
}
