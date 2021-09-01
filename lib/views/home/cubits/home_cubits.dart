import 'package:breaking_bad/views/home/model/home_model.dart';
import 'package:breaking_bad/views/home/states/home_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

static HomeCubit of(context) => BlocProvider.of(context);


  Dio dio = Dio();
  List<ResponseData> charactersList = [];

  Future<List<ResponseData>> getData() async {
    emit(HomeLoadingState());
   try {
     final response =
     await dio.get('https://www.breakingbadapi.com/api/characters');
     final app = response.data as List;
     app.forEach((value  ) {
       ResponseData name = ResponseData.fromJson(value );
       charactersList.add(name);
     });
   } catch (e) {
     print(e.toString());
   }
   emit(HomeInitialState());
  }

}



