import 'dart:convert';

IngredientsModel ingredientsModelFromJson(String str) => IngredientsModel.fromJson(json.decode(str));

String ingredientsModelToJson(IngredientsModel data) => json.encode(data.toJson());

class IngredientsModel {
  String? name;
  int? id;
  String? timeToPrepare;
  Ingredients? ingredients;

  IngredientsModel({
    this.name,
    this.id,
    this.timeToPrepare,
    this.ingredients,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) => IngredientsModel(
    name: json["name"],
    id: json["id"],
    timeToPrepare: json["timeToPrepare"],
    ingredients: Ingredients.fromJson(json["ingredients"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "timeToPrepare": timeToPrepare,
    "ingredients": ingredients?.toJson(),
  };
}

class Ingredients {
  List<Spice>? vegetables;
  List<Spice>? spices;
  List<Appliance>? appliances;

  Ingredients({
    this.vegetables,
    this.spices,
    this.appliances,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
    vegetables: List<Spice>.from(json["vegetables"].map((x) => Spice.fromJson(x))),
    spices: List<Spice>.from(json["spices"].map((x) => Spice.fromJson(x))),
    appliances: List<Appliance>.from(json["appliances"].map((x) => Appliance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "vegetables": List<dynamic>.from(vegetables!.map((x) => x.toJson())),
    "spices": List<dynamic>.from(spices!.map((x) => x.toJson())),
    "appliances": List<dynamic>.from(appliances!.map((x) => x.toJson())),
  };
}

class Appliance {
  String? name;
  String? image;

  Appliance({
    this.name,
    this.image,
  });

  factory Appliance.fromJson(Map<String, dynamic> json) => Appliance(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}

class Spice {
  String? name;
  String? quantity;

  Spice({
    this.name,
    this.quantity,
  });

  factory Spice.fromJson(Map<String, dynamic> json) => Spice(
    name: json["name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
  };
}
