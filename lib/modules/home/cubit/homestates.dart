
import 'package:todo/models/data_login.dart';
import 'package:todo/models/fav.dart';
import 'package:todo/models/profilemodel.dart';

abstract class ShopHomeStates {}

class ShopHOmeInitialstate extends ShopHomeStates{}

class ShopChangeBottomstate extends ShopHomeStates{}

class ShopLoadingHOmeState extends ShopHomeStates{}

class ShopSuccessHOmeState extends ShopHomeStates{}

class ShopErrorHOmeState extends ShopHomeStates{}


class ShopSuccessCatState extends ShopHomeStates{}

class ShopErrorCatState extends ShopHomeStates{}


class ShopSuccessbannerState extends ShopHomeStates{}

class ShopErrorbannerState extends ShopHomeStates{}



class ShopSuccessFavState extends ShopHomeStates{//message to user from model
   final AllFavourite? allfavv ;
  ShopSuccessFavState(this.allfavv);
}

class ShopErroFavState extends ShopHomeStates{}

class ShopchangeFavState extends ShopHomeStates{}



class ShopLoadingGetFavState extends ShopHomeStates{}

class ShopSuccessGetFavState extends ShopHomeStates{}

class ShopErrorGetFavState extends ShopHomeStates{}




class ShopLoadingProfState extends ShopHomeStates{}

class ShopSuccessProfState extends ShopHomeStates{
  late final ALLDataprofile? allDataprofile;
      ShopSuccessProfState(allDataprofile);

}

class ShopErrorProfState extends ShopHomeStates{}


class ShopLoadingUpdateState extends ShopHomeStates{}

class ShopSuccesUpdateState extends ShopHomeStates{
  late final  DataLogin? loginmodel;
      ShopSuccesUpdateState(this.loginmodel);

}

class ShopErrorUpdateState extends ShopHomeStates{}



class ShopSuccessRefreshState extends ShopHomeStates{}
class ShopErrorRefreshState extends ShopHomeStates{}

