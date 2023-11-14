
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/category.dart';
import 'package:todo/models/data_home.dart';
import 'package:todo/models/data_login.dart';
import 'package:todo/models/fav.dart';
import 'package:todo/models/intofav.dart';
import 'package:todo/models/profilemodel.dart';
import 'package:todo/modules/home/cateogries/cateogries.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/modules/home/favourite/favourite.dart';
import 'package:todo/modules/home/product/product.dart';
import 'package:todo/modules/home/setting/setting.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/network/endpoint/end_point.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

class ShopHomeCubit extends Cubit<ShopHomeStates> {
  ShopHomeCubit(super.initialState);

  static ShopHomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    const Prroduct(),
    const Cateogries(),
    const Favourite(),
    const Setting(),
  ];
  int current = 0;

  void changeNavBottom(int index) {
    current = index;
    emit(ShopChangeBottomstate());
  }

  Map<int, bool>? favourites = {};
  Homedata? homedata;
  void getHomeData() {
    emit(ShopHOmeInitialstate());

    DioHelper.getData(url: home, token: token).then((value) {
      homedata = Homedata.fromjason(value.data);

      //  print(homedata?.toString());
      //  print(homedata?.data!.banners?[0].image);
      for (var element in homedata!.data!.products!) {
        favourites!.addAll({
          element.id ?? 0: element.inFavorites ?? false,
        });
      }
      //  print(favourites.toString());

      emit(ShopSuccessHOmeState());
    }).catchError((error) {
     // print(' error in  ShopErrorHOmeState ${error.toString()}');
      emit(ShopErrorHOmeState());
    });
  }

  Categorymodel? model;

  void getCatData() {
    DioHelper.getData(url: category).then((value) {
      model = Categorymodel.fromJason(value.data);

      emit(ShopSuccessCatState());
    }).catchError((error) {
      //print(' error in ShopErrorCatState  ${error.toString()}');
      emit(ShopErrorCatState());
    });
  }

  AllFavourite? allfav;

  void changefav(int productId) {
    favourites?[productId] = !favourites![productId]!;
    emit(ShopchangeFavState());

    DioHelper.postData(
      url: fav,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      allfav = AllFavourite.fromJason(value.data);

      if (!allfav!.status!) {
        //status = false
        favourites?[productId] = !favourites![productId]!;
      } else {
        getfavourites();
      }
     // print('in ShopSuccessFavState occure ${value.data})');
      emit(ShopSuccessFavState(allfav!));
    }).catchError((e) {
      favourites?[productId] = !favourites![productId]!;
     // print(' error in  ShopErroFavState  ${e.toString()}');
      emit(ShopErroFavState());
    });
  }

  DataInotFavourite? datagetfav;

  void getfavourites() {
    emit(ShopLoadingGetFavState());

    DioHelper.getData(url: fav, token: token).then((value) {
      datagetfav = DataInotFavourite.fromJson(value.data);
      // print(value.data);
      emit(ShopSuccessGetFavState());
    }).catchError((error) {
     // print("erro in ShopErrorGetFavState ${error.toString()} ");
      emit(ShopErrorGetFavState());
    });
  }

  ALLDataprofile? objAllDatatProf;

  void getProfile() {
    emit(ShopLoadingProfState());

    DioHelper.getData(url: prof, token: token).then((value) {
      objAllDatatProf = ALLDataprofile.fromJason(value.data);
     // print(" name : ${objAllDatatProf?.dataprof?.name ?? "No Name "}");

      emit(ShopSuccessProfState(objAllDatatProf));
    }).catchError((error) {
     // print("erro in ShopErrorProfState ${error.toString()} ");
      emit(ShopErrorProfState());
    });
  }

  DataLogin? loginmodel;

// void getUpdate({
  //   required String name ,
  //   required String email ,
  //   required String phone ,
  // }){

  //     emit(ShopLoadingUpdateState());

  //     DioHelper.putData(
  //      url: update,
  //      token: token,
  //      data: {
  //       'name':name,
  //       'email':email,
  //       'phone':phone,

  //      }
  //      ).then((value){
  //         loginmodel = DataLogin.fromjason(value.data);
  //      // print(" name : ${loginmodel?.data?.name ?? "No Name "}");

  //       emit(ShopSuccesUpdateState(loginmodel));

  //      } ).catchError((error){

  //         print("erro in ShopErrorProfState ${error.toString()} ");
  //       emit(ShopErrorProfState());
  //      });

// }

  void getUpdate({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateState());

    DioHelper.putData(
      url: update,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      loginmodel = DataLogin.fromjason(value.data);
      emit(ShopSuccesUpdateState(loginmodel));
      //print(value.data);
      // Call refreshData to update other parts of the UI with the new data
      refreshData();
    }).catchError((error) {
     // print("error in ShopErrorProfState ${error.toString()}");
      emit(ShopErrorUpdateState());
    });
  }

  Future<void> refreshData() async {
    try {
      // Fetch the home data again
      getHomeData();

      // Fetch the category data again
      getCatData();

      // Fetch the favorites again
      getfavourites();

      // Fetch the profile data again
      getProfile();

      // Emit a state indicating successful refresh
      emit(ShopSuccessRefreshState());
    } catch (error) {
      // Handle any errors during refresh
      //print('Error during refresh: $error');
      emit(ShopErrorRefreshState());
    }
  }
}
