// ignore_for_file: file_names

class DataInotFavourite {
  bool? status;
  String? message;
  Dataa? data;


  DataInotFavourite.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Dataa.fromJson(json['data']) : null;
  }

}

class Dataa {
  int? currentPage;
  List<Dataupproductid>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

 
  Dataa.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    
    if (json['data'] != null) {
      data = <Dataupproductid>[];
      json['data'].forEach((v) {
        data!.add( Dataupproductid.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class Dataupproductid {
  int? id;
  Product? product;


  Dataupproductid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =  json['product'] != null ?  Product.fromJson(json['product']) : null;
  }

  
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}