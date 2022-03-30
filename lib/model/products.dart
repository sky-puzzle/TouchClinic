import 'dart:convert';



class ProductsModel {
  String? id;
  List? categories;
  String? title;
  String? description;
  String? imageUrl;
  List? imagesUrl;
  int? price;
  int? oldPrice;
  String? discount;
  String? quantity;
  bool? inFavorites;
  bool? inCart;
  String? payment;
  String? address1;
  String? address2;

  ProductsModel(
      {this.id,
      this.categories,
      this.title,
      this.description,
      this.imageUrl,
      this.imagesUrl,
      this.price,
      this.oldPrice,
      this.discount,
      this.quantity,
      this.inFavorites,
        this.payment,
        this.address1,
        this.address2,
      this.inCart});





  Map<String, dynamic> toMap(ProductsModel productsModel) {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'description': description,
      'image': imageUrl,
      'imagesUrl': imagesUrl,
      'price': price,
      'oldPrice': oldPrice,
      'discount': discount,
      'quantity': quantity,
      'inFavorites': inFavorites,
      'inCart': inCart,
    };
  }

 ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
     categories = json['categories'];
    title = json['text'];
     description = json['description'];
    imageUrl = json['image'];

    price = json['price'];
    oldPrice = json['oldPrice'];
    discount = json['discount'];
    quantity = json['quantity'];
     inFavorites = json['inFavorites'];
     inCart = json['inCart'];
  }
  // List<ProductsModel> model = (json.decode(response.body) as List)
  //     .map((data) => ProductsModel.fromJson(data))
  //     .toList();



  static String encode(List<ProductsModel> models) => json.encode(
    models
        .map<Map<String, dynamic>>((model) => ProductsModel().toMap(model))
        .toList(),
  );

  static List<ProductsModel> decode(String models) =>
      (json.decode(models) as List<dynamic>)
          .map<ProductsModel>((item) => ProductsModel.fromJson(item))
          .toList();

}
