
class Product{

  int p_id = 0;
  int p_cost = 0;
  int p_availability = 0;

  String p_details = "";
  String p_category = "";

  String p_image = "assets/apple.webp";
  String p_name = '';

  Product();

  Product.fromJson(Map map){
    p_name = map["p_name"];

    p_id = map['p_id'];
    p_cost = map['p_cost'];
    p_availability = map['p_availability'];

    p_details = map['p_details'];
    p_category = map['p_category'];

    p_image = map['p_image'];
  }

  Map<String,dynamic> toJson(){
    return {
      'p_image' : p_image,
      "p_name" : p_name,
      'p_id' : p_id,
      'p_cost' : p_cost,
      'p_details' : p_details,
      'p_category' : p_category,
      'p_availability' : p_availability
    };
  }



}