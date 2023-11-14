
// ...

// void userLogin({
//   required String email,
//   required String password,
//   BuildContext context, // Pass the BuildContext
// }) {
//   emit(ShopLoginLoadingState());
//   DioHelper.postData(
//     url: login,
//     data: {
//       'email': email,
//       'password': password,
//     },
//   ).then((value) {
//     if (value.data[0] == null) {
      // Data is wrong, show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Data is wrong'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     } else {
     // Data is correct
//       emit(ShopLoginSuccessState());
//     }
//   }).catchError((e) {
//     print(' ##### in user log ${e.toString()} ');
//     emit(ShopLoginErrorState(e));
//   });
// }

// // ...

// myButton(
//   fun: () {
//     if (formkey.currentState!.validate()) {
//       print(emailctrl.text);
//       print(passctrl.text);

//       ShopLoginCubit.get(context).userLogin(
//         email: emailctrl.text,
//         password: passctrl.text,
//         context: context, // Pass the BuildContext
//       );

//       emailctrl.clear();
//       passctrl.clear();
//     }
//   },
//   text: 'login',
//   isuppercase: true,
// ),

//   }
// }