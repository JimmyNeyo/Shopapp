import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/models/category.dart';
import 'package:todo/models/data_home.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/shared/styles/colors.dart';

class Prroduct extends StatelessWidget {
  const Prroduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      builder: (BuildContext context, ShopHomeStates state) {
        ShopHomeCubit cubit = ShopHomeCubit.get(context);
        return Scaffold(
          
          body: cubit.homedata == null && cubit.model == null
              ? const Center(child: CircularProgressIndicator())
              : productsBuilder(cubit.homedata, cubit.model , context),
        );
      },
      listener: (BuildContext context, ShopHomeStates state) {
        if(state is ShopSuccessFavState){
            if(!state.allfavv!.status!){
                Fluttertoast.showToast(
                 msg: state.allfavv!.message!,
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

  Widget productsBuilder(Homedata? homedata, Categorymodel? model , context) {
    if (homedata == null ||
        homedata.data == null ||
        homedata.data?.banners == null) {
      // Handle the case where homedata or its properties are null
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homedata.data!.banners!
                .map(
                  (e) => Image(
                    image: NetworkImage(

                        // '${homedata.data!.banners?[0].image}'
                        '${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Handle the error gracefully, e.g., show a placeholder image
                      return Image.asset('tes.png');
                    },
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              viewportFraction: 1.0, // صوره واحده اللى تكون موجوده ف الوش
              enableInfiniteScroll: true, // يلف حوالين نفسه ع طول
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    fontFamily: 'family',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          category(model.data!.data![index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20.0,
                          ),
                      itemCount: model!.data!.data!.length),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(
                    fontFamily: 'family',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 3.9),
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, // المنتجات تتقسم على كام عمود
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.9,
              
              children: 
              List.generate(
                homedata.data!.products!.length,
                (index) => columnProduct(homedata.data!.products![index] , context),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget columnProduct(Productmodel product) => Container(
  //       child : ClipRRect(borderRadius: BorderRadius.circular(12.0),),
  //       color: Colors.white,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Stack(
  //             alignment: AlignmentDirectional.bottomStart,
  //             children: [
  //               Image(
  //                 image: NetworkImage(
  //                   '${product.image}',
  //                 ),
  //                 width: double.infinity,
  //                 height: 200,
  //                 //  fit: BoxFit.cover,
  //               ),
  //               if (product.discount != 0)
  //                 Container(
  //                     color: Colors.red,
  //                     padding: const EdgeInsets.symmetric(horizontal: 5.0),
  //                     child: const Text(
  //                       'discount',
  //                       style: TextStyle(fontSize: 12.0, fontFamily: 'family'),
  //                     ))
  //             ],
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   '${product.name}',
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: const TextStyle(
  //                       fontFamily: 'family', fontSize: 20, height: 1),
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       '${product.price.round()}',
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                       style: const TextStyle(
  //                           fontFamily: 'family',
  //                           fontSize: 25,
  //                           color: defaultcolor),
  //                     ),
  //                     const SizedBox(
  //                       width: 12,
  //                     ),
  //                     if (product.discount != 0)
  //                       Text(
  //                         '${product.oldPrice.round()}',
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: TextStyle(
  //                             fontFamily: 'family',
  //                             fontSize: 22.5,
  //                             color: Colors.grey.shade700,
  //                             decoration: TextDecoration.lineThrough),
  //                       ),
  //                     const Spacer(),
  //                     Expanded(
  //                         child: IconButton(
  //                             onPressed: () {},
  //                             icon: const Icon(Icons.favorite_border))),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  Widget columnProduct(Productmodel product , context) {
    bool? isProductFavorite = ShopHomeCubit.get(context).favourites?[product.id] ;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    '${product.image}',
                  ),

                  width: double.infinity,

                  height: 220,

                  //  fit: BoxFit.cover,
                ),
                if (product.discount != 0)
                  Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: const Text(
                        'discount',
                        style:
                            TextStyle(fontSize: 12.0, fontFamily: 'family'),
                      ))
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'family', fontSize: 20, height: 1),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        '${product.price.round()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            //fontFamily: 'family',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: defaultcolor),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      
                      if (product.discount != 0)
                        Text(
                          '${product.oldPrice.round()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                             // fontFamily: 'family',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      Expanded(
                          child: CircleAvatar(
                            backgroundColor: isProductFavorite! ? defaultcolor :Colors.grey,
                            radius: 15,
                            child: IconButton(
                                onPressed: () {
                                 ShopHomeCubit.get(context).changefav(product.id!);
                                 
                                },
                                icon: const Icon(Icons.favorite_border , color: Colors.white, size: 15,) ),
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
}


  Widget category(DataIntoDataCat model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        
        children: [
          Image(
            image: NetworkImage(
              '${model.image}',
            ),
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.black.withOpacity(.8),
            width: 100,
            child: Text(
              '${model.name}',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'family',
                color: Colors.white,
              ),
            ),
          )
        ],
      );


}
