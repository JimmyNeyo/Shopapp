// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/constant/constant.dart';



class Setting extends StatelessWidget {
  const Setting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = ShopHomeCubit.get(context).objAllDatatProf;
  
    var namec = TextEditingController();
    var phonec = TextEditingController();
    var emailc = TextEditingController();

    if (state != null && state.dataprof != null) {
      namec.text = state.dataprof!.name ?? '';
      emailc.text = state.dataprof!.email ?? '';
      phonec.text = state.dataprof!.phone ?? '';
    }
    //  namec.text = state!.dataprof!.name! ;
    //  emailc.text = state.dataprof!.email! ;
    //  phonec.text = state.dataprof!.phone! ;

    var namy = namec.text;
    var emaily = emailc.text;
    var phoney = phonec.text;

    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(

      
      builder: (BuildContext context, ShopHomeStates state) {
        ShopHomeCubit cubit =  ShopHomeCubit.get(context);
        return state is ShopLoadingProfState
            ? const Center(child: CircularProgressIndicator())
            : ShopHomeCubit.get(context).objAllDatatProf == null
                ? const Center(child: CircularProgressIndicator())
               : cubit.homedata == null && cubit.model == null
              ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                (Icons.person),
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                    fontFamily: 'family', fontSize: 25),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // User details section
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage:
                                            AssetImage('images/tes.png'),
                                      ),
                                      const SizedBox(height: 15.0),

                                      
                                      Text(
                                        namy,
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Text(
                                        emaily,
                                        style: const TextStyle(
                                            fontFamily: 'family', fontSize: 25),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Text(
                                        ' phone : $phoney',
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    
                                    
                                    ],
                                  ),
                                ),

                                // Actions section
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                    
                                      const SizedBox(height: 8.0),
                                      myButton(fun: (){
                                        signout(context);
                                      
                                      }, text: 'Logout'
                                      , font: 27,
                                      ),

                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
      },
      listener: (BuildContext context, ShopHomeStates state) {},
    );
  }
}
