import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/home/cubit/homecubit.dart';
import 'package:todo/modules/home/cubit/homestates.dart';
import 'package:todo/shared/constant/constant.dart';


class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      builder: (BuildContext context, ShopHomeStates state) {
        ShopHomeCubit cubit = ShopHomeCubit.get(context);

        return cubit.homedata == null && cubit.model == null
            ? const Center(child: CircularProgressIndicator())
            : state is ShopLoadingGetFavState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                :
                // cubit.model == null && cubit.datagetfav == null
                //      ? const Center(child: CircularProgressIndicator()) :
                ListView.separated(
                    itemBuilder: (context, index) => buildItemGetFavourite(
                        cubit.datagetfav!.data!.data![index].product, context),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: cubit.datagetfav!.data!.data!.length);
      },
      listener: (BuildContext context, ShopHomeStates state) {},
    );
  }

}


  