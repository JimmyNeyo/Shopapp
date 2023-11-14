
class ALLDataprofile{

  bool? status;
  String? message;
  Dataprofile? dataprof;

  ALLDataprofile.fromJason(Map<String ,dynamic> jason){
    
       status = jason['status'];
       message=jason['message'];

       dataprof = jason['data'] != null ? Dataprofile.fromJson(jason['data']) : null ;
  }



}

class Dataprofile{


  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Dataprofile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

}