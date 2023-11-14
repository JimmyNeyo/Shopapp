// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/login/cubit/cubitstatecubit.dart';
import 'package:todo/models/data_login.dart';
import 'package:todo/shared/network/endpoint/end_point.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit(super.initialState);

  static ShopLoginCubit get(context) => BlocProvider.of(context);

   DataLogin? loginmodel ;

      void userLogin({
        required String email,
        required String password,
        BuildContext? context,
      }) {
        emit(ShopLoginLoadingState());
        DioHelper.postData(url: login, data: {
          'email': email,
          'password': password,
        }).then((value) {
          print('@@@@@ ${value.data}');

         // Userdata.fromjason(value.data);

          loginmodel = DataLogin.fromjason(value.data);
          
          emit(ShopLoginSuccessState(loginmodel!));


        }).catchError((error) {
              final errorMessage = error.toString();
              print(error.toString());
              emit(ShopLoginErrorState(errorMessage));
            });

      }






  IconData suffix = Icons.visibility_outlined;
  bool ispaswordshow = true;

  void changeEyePass() {
    ispaswordshow = !ispaswordshow;
    suffix = ispaswordshow
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(ChangePassword());
  }



    // if (value.data[0] == null) {

       
      //   ScaffoldMessenger.of(context!).showSnackBar(
      //     const SnackBar(
      //       content: Text(
      //         'Data is wrong',
      //         style: TextStyle(
      //             color: Colors.white, fontSize: 22, fontFamily: 'family'),
      //       ),
      //       backgroundColor: Colors.red,
      //       duration: Duration(seconds: 3),
      //     ),
      //   );
      // }
}
