class  AllFavourite{


  bool? status;
  String? message;

  AllFavourite.fromJason(Map<String ,dynamic> jason){

    status = jason['status'];
    message = jason['message'];
  }


}

