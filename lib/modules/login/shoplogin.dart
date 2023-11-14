// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/modules/Register/register.dart';
import 'package:todo/modules/login/cubit/cubitlogin.dart';
import 'package:todo/modules/login/cubit/cubitstatecubit.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/network/local/cache_helper.dart';

class ShopLogin extends StatelessWidget {
  const ShopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    // final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    // final formkey = GlobalKey<FormState>();
    //var formkey   =  GlobalKey<FormState>();
    var emailctrl = TextEditingController();
    var passctrl = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(ShopInitialLoginState()),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        builder: (BuildContext context, ShopLoginStates state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                          //style: Theme.of(context).textTheme.headlineLarge.copyWith(color: Colors.amberAccent),
                        ),
                        const SizedBox(height: 40),
                        myTFF(
                          controller: emailctrl,
                          type: TextInputType.emailAddress,
                          label: 'Email address',
                          valida: (value) {
                            
                            if (value.isEmpty) {
                              return 'Please Enter Your Email Address';
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                   
                        ),
                        const SizedBox(height: 40),
                        myTFF(
                            controller: passctrl,
                            label: 'Enter password',
                            prefix: Icons.lock,
                            suffix: ShopLoginCubit.get(context).suffix,
                            ispassword:
                                ShopLoginCubit.get(context).ispaswordshow,
                            type: TextInputType.visiblePassword,
                            // ispassword: ispassshow,
                            suffixpressd: () {
                              ShopLoginCubit.get(context).changeEyePass();
                            },
                            valida: (value) {
                              if (value.isEmpty) {
                                return 'pass should be not empty';
                              }
                              return null;
                            },
                            onSubmit: (value) {
                              if (formkey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailctrl.text,
                                  password: passctrl.text,
                                );
                                emailctrl.clear();
                                passctrl.clear();
                              }
                            }),
                        const SizedBox(height: 40),
                        state is ShopLoginLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : myButton(
                                fun: () {
                                  if (formkey.currentState?.validate() ??
                                      false) {


                                    print(emailctrl.text);
                                    print(passctrl.text);

                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailctrl.text,
                                        password: passctrl.text);

                                        

                                    emailctrl.clear();
                                    passctrl.clear();

                                    
                                                               
                                  }

                                  return null;
                                },
                                text: 'login',
                                isuppercase: true,
                              ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(fontSize: 22),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigator(context, const Register());
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                      color: Colors.indigoAccent, fontSize: 22),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, ShopLoginStates state)  {
          if (state is ShopLoginSuccessState) {
            if (state.loginmodel.status!) {

              print(state.loginmodel.status);
               CacheHelper.saveData(key:'token', value: state.loginmodel.data?.token ).then((value){
                token = state.loginmodel.data!.token;
              navigatorFinish(context, const HomeShop());
              
              });
               Fluttertoast.showToast(
                 msg: state.loginmodel.message!,
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 2,
                 backgroundColor: Colors.green,
                 textColor: Colors.white,
                 fontSize: 16.0,
               );
             } else {
              Fluttertoast.showToast(
                msg: state.loginmodel.message!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
      ),
    );
  }
}
