
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/On_boarding/onboarding.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/modules/home/internet/internet.dart';
import 'package:todo/modules/login/shoplogin.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/cubit/bloc_observer.dart';
import 'package:todo/shared/cubit/main_cupit.dart';
import 'package:todo/shared/cubit/main_states.dart';
import 'package:todo/shared/cubit/newcupit.dart';
import 'package:todo/shared/cubit/newstates.dart';
import 'package:todo/shared/network/local/cache_helper.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';
import 'package:todo/shared/styles/themes.dart';

void main()async {
  // بيتأكد ان كل حاجه ف المثود خلصت وبعدين يفتح الابلكشن
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  var connectivityResult = await Connectivity().checkConnectivity();
  bool isConnected = connectivityResult != ConnectivityResult.none;

  bool? isDark = CacheHelper.getBool(key: 'isDark');

  
  Widget widget;
  bool? onboarding = CacheHelper.getData(key:'onboarding');
   token =CacheHelper.getData(key:'token');
    //print(token);

          if(onboarding != null ){
                if(token != null){
                  widget = const HomeShop();
                }
                else{
                  widget = const ShopLogin();
                }
          } 
          else
          {
            widget = const OnBoardingScreen();
          }


   
  runApp(
    ShopApp(
      isDark:isDark, startwidget: widget ,isConnected: isConnected,
      
      ));
}


class ShopApp extends StatelessWidget {

   final bool? isDark;
 
   final Widget startwidget;

   final bool? isConnected;
   
   const ShopApp( {super.key , required this.isDark , required this.startwidget , this.isConnected});
    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context) => NewCupit(NewsInitialize())..getBusiness()..getSport()..getscience(),),
        BlocProvider(create: (BuildContext context) => Maincubit(InitialStatemain())..themode(fromshared: isDark),),
        BlocProvider(create: (BuildContext context) => ShopHomeCubit(ShopHOmeInitialstate())..getHomeData()..getCatData()..getfavourites()..getProfile(),),

      ],
      child: BlocConsumer<Maincubit, MainStates>(
          listener: (BuildContext context, MainStates state) {},
          builder: (BuildContext context, MainStates state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              
              //isDark ?? false ? ThemeMode.dark : ThemeMode.light,
         //      Maincubit.get(context).isDark
        //  ? ThemeMode.dark
        // : ThemeMode.light,
    
    
               home: isConnected! ? Directionality(
              textDirection: TextDirection.ltr,
              child: startwidget,
            ) : const NoInternetPage(),
            );
          },
        ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo/modules/On_boarding/onboarding.dart';
// import 'package:todo/modules/home/cubit/homecubit.dart';
// import 'package:todo/modules/home/cubit/homestates.dart';
// import 'package:todo/modules/login/shoplogin.dart';
// import 'package:todo/layout/home_layout.dart';
// import 'package:todo/shared/constant/constant.dart';
// import 'package:todo/shared/cubit/bloc_observer.dart';
// import 'package:todo/shared/cubit/main_cupit.dart';
// import 'package:todo/shared/cubit/main_states.dart';
// import 'package:todo/shared/cubit/newcupit.dart';
// import 'package:todo/shared/cubit/newstates.dart';
// import 'package:todo/shared/network/local/cache_helper.dart';
// import 'package:todo/shared/network/remote/dio_helper.dart';
// import 'package:todo/shared/styles/themes.dart';
// import 'package:connectivity/connectivity.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DioHelper.init();
//   await CacheHelper.init();
//   Bloc.observer = MyBlocObserver();

//   // Check internet connection
//   var connectivityResult = await Connectivity().checkConnectivity();
//   bool isConnected = connectivityResult != ConnectivityResult.none;

//   bool? isDark = CacheHelper.getBool(key: 'isDark');

//   Widget widget;
//   bool? onboarding = CacheHelper.getData(key: 'onboarding');
//   token = CacheHelper.getData(key: 'token');
//   print(token);

//   if (onboarding != null) {
//     if (token != null) {
//       widget = const HomeShop();
//     } else {
//       widget = const ShopLogin();
//     }
//   } else {
//     widget = const OnBoardingScreen();
//   }

//   runApp(
//     ShopApp(
//       isDark: isDark,
//       startwidget: widget,
//       isConnected: isConnected,
//     ),
//   );
// }

// class ShopApp extends StatelessWidget {
//   final bool? isDark;
//   final Widget startwidget;
//   final bool isConnected;

//   const ShopApp({Key? key, required this.isDark, required this.startwidget, required this.isConnected})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (BuildContext context) => NewCupit(NewsInitialize())..getBusiness()..getSport()..getscience(),),
//         BlocProvider(create: (BuildContext context) => Maincubit(InitialStatemain())..themode(fromshared: isDark),),
//         BlocProvider(create: (BuildContext context) => ShopHomeCubit(ShopHOmeInitialstate())..getHomeData()..getCatData()..getfavourites()..getProfile(),),
//       ],
//       child: BlocConsumer<Maincubit, MainStates>(
//         listener: (BuildContext context, MainStates state) {},
//         builder: (BuildContext context, MainStates state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: lightTheme,
//             darkTheme: darkTheme,
//             themeMode: isConnected ? ThemeMode.light : ThemeMode.dark,
//             home: isConnected ? Directionality(
//               textDirection: TextDirection.ltr,
//               child: startwidget,
//             ) : NoInternetPage(),
//           );
//         },
//       ),
//     );
//   }
// }

// class NoInternetPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('No Internet Connection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.signal_wifi_off,
//               size: 100,
//               color: Colors.red,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'No internet connection. Please check your connection and try again.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
