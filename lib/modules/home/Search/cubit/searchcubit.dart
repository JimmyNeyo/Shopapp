// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/searchmodel.dart';
import 'package:todo/modules/home/Search/cubit/searchstates.dart';
import 'package:todo/shared/constant/constant.dart';
import 'package:todo/shared/network/endpoint/end_point.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

class Searchcubit extends Cubit<Searchstates> {
  Searchcubit() : super(SearchStateInitial());

  static Searchcubit get(context) => BlocProvider.of(context);

  AllSearch? allsearch;

  void seearch(String text) {
    emit(SearchStateLoading());
    DioHelper.postData(url: ssearch,  token: token , data: {'text': text})
        .then((value) {

          allsearch = AllSearch.fromJson(value.data);
          if (allsearch != null) {
       print('ssssssssssssssss$allsearch');
          emit(SearchStateSuccess());
          }

        })
        .catchError((e) {
          print('SearchStateError${e.toString()}');
          emit(SearchStateError());
        });
  }
}


