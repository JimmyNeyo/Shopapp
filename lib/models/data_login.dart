class DataLogin {
      
     bool? status;
     String? message ;
     late Userdata? data ;

      DataLogin.fromjason(Map<String , dynamic> jason){
          status = jason['status'] as bool;
          message = jason['message'] as String;
          data = jason['data'] != null ? Userdata.fromjason(jason['data']) : null ;

      }

}


class Userdata{
    int? id ;
    String? name;
    String? email;
    String? phone;
    String? image;
    int? points;
    int? credit;
    String? token;

   Userdata.fromjason(Map<String , dynamic> jason){
    id   =  jason['id'];
    name =  jason['name'];
    email = jason['email'];
    phone = jason['phone'];
    points= jason['points'];
    image = jason['image'];
    credit= jason['credit'];
    token = jason['token']; // why data not save in cache but onboarding saved 
   }
    
}