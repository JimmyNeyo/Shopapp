import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/home/Search/search.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/modules/setting2/setting2.dart';
import 'package:todo/shared/components/components.dart';

class HomeShop extends StatelessWidget {
  const HomeShop({super.key});

  @override
  Widget build(BuildContext context) {
      
    return  BlocConsumer< ShopHomeCubit , ShopHomeStates>
    (
      builder: (BuildContext context, ShopHomeStates state) { 

       ShopHomeCubit cubit =  ShopHomeCubit.get(context);
        return Scaffold(
        
      // appBar: AppBar(
                //     actions: [
                //       IconButton(onPressed: (){
                //         CacheHelper.putbool(key: 'isDark', value: true);
                //       }, icon: const Icon(Icons.dark_mode)) ,
                //      IconButton(onPressed: (){
                //     navigator(context, SearchShop());
                //  }, icon:const Icon(Icons.search,size: 35,) ),
                //     ],
                //   ),
                //     
          appBar: AppBar(
            backgroundColor: Colors.white, // Background color of the AppBar
            elevation: 0, // No shadow
           
           titleSpacing: 45,
            title:
            
             const Text(
              
              'Shop App', // Your app's title
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'family',
                 
              ),
              
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search), // Add a search icon
                onPressed: () {
                  navigator(context, SearchShop());
                },
              ),
             
              IconButton(
                icon: const Icon(Icons.settings), // Add a user profile icon
                onPressed: () {
                  // Navigate to the user profile page
                  navigator(context, const Setting1());
                },
              ),
            ],
          ),

      body: cubit.screen[cubit.current],
       
       
      bottomNavigationBar: BottomNavigationBar(
        
      onTap: (index){
          cubit.changeNavBottom(index);
       }, 
      currentIndex: cubit.current, 
       items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home)     ,  label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category) , label: 'Cateogries'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: 'Favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.person_4_rounded) , label: 'Profile'),
      ]
      
      ),
       
      );
   
        }, listener: (BuildContext context, ShopHomeStates state) {  }, 
    
     );
  }
}

