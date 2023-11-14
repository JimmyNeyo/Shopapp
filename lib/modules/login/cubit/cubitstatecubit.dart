import 'package:todo/models/data_login.dart';

abstract class ShopLoginStates {}

class ShopInitialLoginState extends ShopLoginStates {}


class ShopLoginLoadingState extends ShopLoginStates {}


class ShopLoginSuccessState extends ShopLoginStates {
    final DataLogin loginmodel;
   
    ShopLoginSuccessState(this.loginmodel);
}


class ShopLoginErrorState extends ShopLoginStates {
  final String error ;
   ShopLoginErrorState(this.error);
}

class ChangePassword extends ShopLoginStates {}




// class ShopRegnState extends ShopLoginStates {}


// class ShopLoginRegngState extends ShopLoginStates {}


// class ShopRegSuccessState extends ShopLoginStates {}


// class ShopRegErrorState extends ShopLoginStates {
//   final String error ;
//    ShopRegErrorState(this.error);
// }



