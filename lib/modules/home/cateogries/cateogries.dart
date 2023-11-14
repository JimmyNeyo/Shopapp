import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/category.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';



class Cateogries  extends StatelessWidget {
  const Cateogries ({super.key});

  @override
  Widget build(BuildContext context ) {


    return BlocConsumer<ShopHomeCubit ,ShopHomeStates>(

       
      builder: (BuildContext context, ShopHomeStates state) { 

            ShopHomeCubit cubit = ShopHomeCubit.get(context);
       
       
        return   cubit.model == null
              ? const Center(child: CircularProgressIndicator())
              :
        
         ListView.separated(
        itemBuilder: (context , index)=> buildcat(cubit.model!.data!.data![index] ),
       separatorBuilder: (context , index) => const Divider(),
        itemCount: ShopHomeCubit.get(context).model!.data!.data!.length
        );
   
       },
      listener: (BuildContext context, ShopHomeStates state) {  },
      );
     
  }


Widget buildcat(DataIntoDataCat? model) =>   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
              image: NetworkImage(
                '${model!.image}',
                 
    
              ),
              height: 150,
              width: 150,
            ), 
          const SizedBox(width: 20.0,),
          Text(
               '${model.name}',
               
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'family',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
}