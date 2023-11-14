import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/constant/constant.dart';

class Setting1 extends StatelessWidget {
  const Setting1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formkey = GlobalKey<FormState>();
    var namec = TextEditingController();
    var phonec = TextEditingController();
    var emailc = TextEditingController();
        ShopHomeCubit cubit =  ShopHomeCubit.get(context);
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      
      builder: (BuildContext context, state) {
        var state = ShopHomeCubit.get(context).objAllDatatProf;
        namec.text = state!.dataprof!.name!;
        emailc.text = state.dataprof!.email!;
        phonec.text = state.dataprof!.phone!;

         return 

         cubit.homedata == null && cubit.model == null
              ? const Center(child: CircularProgressIndicator())
            : state is ShopLoadingUpdateState ?
              const  LinearProgressIndicator()
                         

            : Scaffold(
                appBar: AppBar(

                title: const Text('Setting' ,style: TextStyle(color: Colors.white),),
                actions: const [Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.settings , color: Colors.white,),
                )],
                ),
                body: 
                
                //  RefreshIndicator(
                //   onRefresh: () async {
                //     // Add logic to refresh the data
                //     await ShopHomeCubit.get(context).refreshData();
                //   },child :
                  
                  
                   Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Form(

                    key: formkey,
                    child: SingleChildScrollView(
                      
                      child: Expanded(
                        child: Column(
                          
                          children: [
                            
                          state is ShopLoadingUpdateState ?
                           const  LinearProgressIndicator()
                           : const SizedBox(height: 75.0,),
                          
                            myTFF(
                              controller: namec,
                              type: TextInputType.name,
                              label: 'Name',
                              valida: (value) {
                                if (value.isEmpty) {
                                  return 'should be not empty';
                                }
                                return null;
                              },
                              prefix: Icons.person,
                            ),
                            const SizedBox(height: 10.0,),
                            myTFF(
                              controller: emailc,
                              type: TextInputType.emailAddress,
                              label: 'Email Address',
                              valida: (value) {
                                if (value.isEmpty) {
                                  return 'should be not empty';
                                }
                                return null;
                              },
                              prefix: Icons.email_sharp,
                            ),
                            const SizedBox(height: 10.0,),
                            myTFF(
                              controller: phonec,
                              type: TextInputType.number,
                              label: 'Number',
                              valida: (value) {
                                if (value.isEmpty) {
                                  return 'should be not empty';
                                }
                                return null;
                              },
                              prefix: Icons.numbers,
                            ),
                            const SizedBox(height: 20.0),                    
                            myButton(
                              fun: (){
                                if(formkey.currentState!.validate()){
                                    ShopHomeCubit.get(context).getUpdate(            
                                  name: namec.text,
                                  email: emailc.text,
                                  phone: phonec.text,
                                  );
                                  }
                              },
                             text:'Edit Profile',
                             font: 25
                             
                             ),
                            const SizedBox(height: 20.0),                    
                            myButton(
                              fun: (){
                                 signout(context);
                              },
                             text:'Logout',
                             font: 25
                             
                             ),
                             
                          
                          ],
                        ),
                      ),
                    ),
                  
                  ),
                ),
              );
      },
      listener: (BuildContext context, Object? state) {
        // if (state is ShopSuccessProfState) {
        //   namec.text = state.allDataprofile!.dataprof!.name!;
        //   emailc.text = state.allDataprofile!.dataprof!.email!;
        //   phonec.text = state.allDataprofile!.dataprof!.phone!;
        // }
          if (state is ShopSuccesUpdateState) {
            if (state.loginmodel!.status!) {

            //  print(state.loginmodel.status);
              //  CacheHelper.saveData(key:'token', value: state.loginmodel!.data?.token ).then((value){
              //   token = state.loginmodel!.data!.token;
              
              
              //});
               Fluttertoast.showToast(
                 msg: state.loginmodel!.message!,
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 2,
                 backgroundColor: Colors.green,
                 textColor: Colors.white,
                 fontSize: 16.0,
               );
             } else {
              Fluttertoast.showToast(
                msg: state.loginmodel!.message!,
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
    );
  }
}
