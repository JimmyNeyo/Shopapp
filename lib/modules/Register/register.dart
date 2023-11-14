// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/modules/Register/cubit/cubitreg.dart';

import 'package:todo/modules/Register/cubit/cubittstatecubit.dart';
import 'package:todo/modules/login/shoplogin.dart';

import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/network/local/cache_helper.dart';


class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    //final formkey = GlobalKey<FormState>();
    //var formkey   =  GlobalKey<FormState>();
    var namectrl  = TextEditingController();
    var phonectrl = TextEditingController();
    var emailctrl = TextEditingController();
    var passctrl  = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopRegCubit(ShopInitRegnState()),
      child: BlocConsumer< ShopRegCubit, ShopRegStates>(
        builder: (BuildContext context, ShopRegStates state) {
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
                          'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                          //style: Theme.of(context).textTheme.headlineLarge.copyWith(color: Colors.amberAccent),
                        ),
                        const SizedBox(height: 40),
                        myTFF(
                          controller: namectrl,
                          type: TextInputType.text,
                          label: 'name ',
                          valida: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Name ';
                            }
                          },
                          prefix: Icons.person,
                        ),
                        const SizedBox(height: 40),
                         myTFF(
                          controller: phonectrl,
                          type: TextInputType.number,
                          label: 'Phone ',
                          valida: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Phone ';
                            }
                          },
                          prefix: Icons.phone,
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
                          },
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(height: 40),               
                        myTFF(
                            controller: passctrl,
                            label: 'Enter password',
                            prefix: Icons.lock,
                            suffix: ShopRegCubit.get(context).suffix,
                            ispassword:
                                ShopRegCubit.get(context).ispaswordshow,
                            type: TextInputType.visiblePassword,
                            // ispassword: ispassshow,
                            suffixpressd: () {
                              ShopRegCubit.get(context).changeEyePass();
                            },
                            valida: (value) {
                              if (value.isEmpty) {
                                print('pass should be not empty');
                              }
                              return null;
                            },
                            onSubmit: (value) {
                              if (formkey.currentState!.validate()) {
                                ShopRegCubit.get(context).userRegister(
                                    email: emailctrl.text,
                                    password: passctrl.text,
                                    name: namectrl.text,
                                    phone: phonectrl.text,
                                    );
                                emailctrl.clear();
                                passctrl.clear();
                               
                              }
                            }),
                        const SizedBox(height: 40),
                        state is ShopLoadingRegnState
                            ? const Center(child: CircularProgressIndicator())
                            : myButton(
                                fun: () {
                                  if (formkey.currentState!.validate()) {
                                    print(emailctrl.text);
                                    print(passctrl.text);

                                    ShopRegCubit.get(context).userRegister(
                                      
                                        email: emailctrl.text,
                                        password: passctrl.text,
                                        context: context,
                                        name: namectrl.text, 
                                        phone: phonectrl.text
                                        
                                         );

                                    emailctrl.clear();
                                    passctrl.clear();
                                    navigator(context, const ShopLogin());
                                  }
                                  return null;
                                },
                                text: 'Register',
                                isuppercase: true,
                              ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, ShopRegStates state) {
           if (state is ShopRegSuccessState) {
            if (state.loginmodel.status!) {
              print(state.loginmodel.status);
               CacheHelper.saveData(key:'token', value: state.loginmodel.data?.token ).then((value){
                token = state.loginmodel.data!.token;
              navigatorFinish(context, const ShopLogin());
              
              });
               Fluttertoast.showToast(
                 msg: state.loginmodel.message!,
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 5,
                 backgroundColor: Colors.green,
                 textColor: Colors.white,
                 fontSize: 16.0,
               );
             } else {
              Fluttertoast.showToast(
                msg: state.loginmodel.message!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
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
