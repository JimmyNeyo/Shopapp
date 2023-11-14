import 'package:todo/models/data_login.dart';

abstract class ShopRegStates {}


class ShopInitRegnState extends ShopRegStates {}

class ShopLoadingRegnState extends ShopRegStates {}


class ShopRegSuccessState extends ShopRegStates {
    final DataLogin loginmodel;
   
    ShopRegSuccessState(this.loginmodel);
}


class ShopRegErrorState extends ShopRegStates { String error ;
   ShopRegErrorState(this.error);
}

class ChangePasswordd extends ShopRegStates {}




