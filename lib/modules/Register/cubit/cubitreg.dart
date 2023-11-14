// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/Register/cubit/cubittstatecubit.dart';
import 'package:todo/models/data_login.dart';
import 'package:todo/shared/network/endpoint/end_point.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

class ShopRegCubit extends Cubit<ShopRegStates> {
  ShopRegCubit(super.initialState);

  static ShopRegCubit get(context) => BlocProvider.of(context);

   DataLogin? loginmodel ;

   

void userRegister({
    required String name ,
    required var phone ,
    required String email,
    required String password,
    String? image,
    BuildContext? context,
    
}){
  emit(ShopLoadingRegnState());
  DioHelper.postData(url: register, data: {

      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
	    "image": 'https://student.valuxapps.com/storage/uploads/users/v2KpWJjmYA_1698675759.jpeg'
    }).then((value) {
       print(' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ${value.data}');
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
      //  );
      // }
       emit(ShopRegSuccessState(loginmodel!));
    }).catchError((e) {
      print(' ##### in user Reg ${e.toString()} ');
      emit(ShopRegErrorState(e));
    });
}


  IconData suffix = Icons.visibility_outlined;
  bool ispaswordshow = true;

  void changeEyePass() {
    ispaswordshow = !ispaswordshow;
    suffix = ispaswordshow
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(ChangePasswordd());
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
