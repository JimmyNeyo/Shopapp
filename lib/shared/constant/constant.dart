
import 'package:flutter/material.dart';
import 'package:todo/models/intofav.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/login/shoplogin.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/network/local/cache_helper.dart';
import 'package:todo/shared/styles/colors.dart';

void signout(context){
  
        CacheHelper.removeData(key: 'token').then((value) {
            if(value){
              navigatorFinish(context, const ShopLogin());
            }
        });
}

String? token = '';


Widget buildItemGetFavourite(Product? produ, context) =>


      produ == null ||  produ.image == null

          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 110,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                       children: [
                        //   image: dataintofav.product!.image != null
                        //       ? NetworkImage(dataintofav.product!.image!)
                        //       : AssetImage('placeholder_image.png'), // Provide a placeholder image

                        Image(
                          image: NetworkImage(
                            produ.image!,
                          ),
                          width: 150, // Specify a finite width here
                          height: 200,
                          //  fit: BoxFit.cover,
                        ),
                        if (produ.discount! != 0)
                          Container(
                              color: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: const Text(
                                'discount',
                                style: TextStyle(
                                    fontSize: 12.0, fontFamily: 'family'),
                              ))
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
                            // '${dataintofav.product?.name!}',
                            ' ${produ.name ?? "Unknown"} ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'family', fontSize: 20, height: 1),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                produ.price.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    //fontFamily: 'family',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: defaultcolor),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              if (produ.discount! != 0)
                                Text(
                                  produ.oldPrice.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      // fontFamily: 'family',
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              const Spacer(),
                              Expanded(
                                  child: CircleAvatar(
                                backgroundColor: //isProductFavorite!

                                    ShopHomeCubit.get(context).favourites![
                                            produ.id!]!
                                        ? defaultcolor
                                        : Colors.grey,
                                // ShopHomeCubit.get(context).favourites![dataintofav.product?.id ?? -1] ? defaultcolor : Colors.grey,

                                radius: 18,
                                child: IconButton(
                                    onPressed: () {
                                      ShopHomeCubit.get(context)
                                          .changefav(produ.id!);
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );


            