// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/intofav.dart';
import 'package:todo/models/searchmodel.dart';
import 'package:todo/modules/home/Search/cubit/searchcubit.dart';
import 'package:todo/modules/home/Search/cubit/searchstates.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/styles/colors.dart';
// import 'package:todo/models/intofav.dart' as fav;
// import 'package:todo/models/searchmodel.dart' as search;

class SearchShop extends StatelessWidget {
  SearchShop({super.key});

  final searchController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Searchcubit(),
      child: BlocConsumer<Searchcubit, Searchstates>(
        builder: (BuildContext context, state) {
          var cubit = Searchcubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: myTFF(
                        controller: searchController,
                        type: TextInputType.text,
                        label: 'search',
                        valida: (String value) {
                          if (value.isEmpty) {
                            return 'must value';
                          } else {
                            return null;
                          }
                        },
                        // onTap: (){
                        //    NewCupit.get(context).gettes();
                        // },
                        // onchange: (text) {
                        //   // Call the search method to initiate the search
                        //   Searchcubit.get(context).seearch(text);
                        // },
                        onSubmit: (String text) {
                          Searchcubit.get(context).seearch(text);
                        },

                        prefix: Icons.search,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (state is SearchStateLoading)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (state is SearchStateSuccess)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildItemSearch(
                                Searchcubit.get(context)
                                    .allsearch!
                                    .data!
                                    .data![index],
                                context ,
                                isOldPrice: false
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: cubit.allsearch!.data!.data!.length),
                      )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state is Searchcubit) {}
        },
      ),
    );
  }

Widget buildItemSearch(Productt? produ, context , {bool isOldPrice =true}) {
  if (produ == null || produ.image == null) {
    return const CircularProgressIndicator();
  }

  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(produ.image!),
                width: 150,
                height: 200,
              ),
              if (produ.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text(
                    'discount',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'family',
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${produ.name ?? "Unknown"} ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'family',
                    fontSize: 20,
                    height: 1,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      produ.price.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: defaultcolor,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    if (produ.discount != 0 && isOldPrice)
                      Text(
                        produ.oldPrice.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor:
                            ShopHomeCubit.get(context).favourites![produ.id!]!
                                ? defaultcolor
                                : Colors.grey,
                        radius: 18,
                        child: IconButton(
                          onPressed: () {
                            ShopHomeCubit.get(context).changefav(produ.id!);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}


//error
//   Widget buildItemSearch(Productt? produ, context) => produ == null ||
//           produ.image == null
//       ? const CircularProgressIndicator()
//       : Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SizedBox(
//             height: 110,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomStart,
//                   children: [
//                     //   image: dataintofav.product!.image != null
//                     //       ? NetworkImage(dataintofav.product!.image!)
//                     //       : AssetImage('placeholder_image.png'), // Provide a placeholder image

//                     Image(
//                       image: NetworkImage(
//                         produ.image!,
//                       ),
//                       width: 150, // Specify a finite width here
//                       height: 200,
//                       //  fit: BoxFit.cover,
//                     ),
//                     if (produ.discount! != 0)
//                       Container(
//                           color: Colors.red,
//                           padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                           child: const Text(
//                             'discount',
//                             style:
//                                 TextStyle(fontSize: 12.0, fontFamily: 'family'),
//                           ))
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         // '${dataintofav.product?.name!}',
//                         ' ${produ.name ?? "Unknown"} ',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                             fontFamily: 'family', fontSize: 20, height: 1),
//                       ),
//                       const Spacer(),
//                       Row(
//                         children: [
//                           Text(
//                             produ.price.toString(),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 //fontFamily: 'family',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: defaultcolor),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           if (produ.discount! != 0)
//                             Text(
//                               produ.oldPrice.toString(),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   // fontFamily: 'family',
//                                   fontSize: 15,
//                                   // fontWeight: FontWeight.bold,
//                                   color: Colors.grey.shade700,
//                                   decoration: TextDecoration.lineThrough),
//                             ),
//                           const Spacer(),
//                           Expanded(
//                               child: CircleAvatar(
//                             backgroundColor: //isProductFavorite!

//                                 ShopHomeCubit.get(context)
//                                         .favourites![produ.id!]!
//                                     ? defaultcolor
//                                     : Colors.grey,
//                             // ShopHomeCubit.get(context).favourites![dataintofav.product?.id ?? -1] ? defaultcolor : Colors.grey,

//                             radius: 18,
//                             child: IconButton(
//                                 onPressed: () {
//                                   ShopHomeCubit.get(context)
//                                       .changefav(produ.id!);
//                                 },
//                                 icon: const Icon(
//                                   Icons.favorite_border,
//                                   color: Colors.white,
//                                   size: 15,
//                                 )),
//                           )),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
// }
}