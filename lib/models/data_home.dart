class Homedata {

  bool? status ;
  String? message ;

  Homeobject? data;

  Homedata.fromjason(Map<String , dynamic> jason){

        status = jason['status'];
        message = jason['message'];
        data = Homeobject.fromjason(jason['data']);
  }

  get image => null;
  

}



class Homeobject{

  List<Bannersmodel>? banners = [];
  List<Productmodel>? products = [];

  Homeobject.fromjason(Map<String , dynamic> jason){
          jason['banners']?.forEach((element){
            banners?.add(Bannersmodel.fromjason(element));
        });

          jason['products']?.forEach((element){
            products?.add(Productmodel.fromjason(element));
        });

  }

  

}


class Bannersmodel{

  int? id ;
  String? image;
 // String? category;
 
  
  
  Bannersmodel.fromjason(Map<String , dynamic> jason){

        id = jason['id'];
        image = jason['image'];
        //category = jason['category'];
       
  }

}


class Productmodel{

  int? id ;
  dynamic price ;
  dynamic oldPrice ;
  dynamic discount ;
  String? image;
  String? name;
  //String? description;
  bool? inFavorites;
  bool? inCart;

  Productmodel.fromjason(Map<String , dynamic> jason){
    id = jason['id'];
    price = jason['price'];
    oldPrice = jason['old_price'];
    discount = jason['discount'];
    image = jason['image'];
    name = jason['name'];
   // description = jason['description'];
    inFavorites = jason['in_favorites'];
    inCart = jason['in_cart'];
  }


}