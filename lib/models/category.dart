class Categorymodel {

  bool? status;
  Datacat? data;
  
  Categorymodel.fromJason(Map<String , dynamic> jason){
    status = jason['status'];
    data  = Datacat.fromJason(jason['data']); 

  }
}

class Datacat {

    int? currentPage;

    List<DataIntoDataCat>? data =[];

    Datacat.fromJason(Map<String , dynamic> jason){
        currentPage = jason['current  _page'];

        jason['data'].forEach((element){
              data?.add(DataIntoDataCat.fromJason(element));
        });

      
    }

}

class DataIntoDataCat {

    int? id ;
    String? name;
    String? image;

    DataIntoDataCat.fromJason(Map<String , dynamic> jason){
    id   =  jason['id'];
    name =  jason['name'];
    image = jason['image'];
    }

}