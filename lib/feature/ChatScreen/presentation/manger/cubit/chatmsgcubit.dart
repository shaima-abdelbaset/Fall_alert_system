// ignore_for_file: depend_on_referenced_packages
/*
import 'package:bloc/bloc.dart';
import 'package:fall_detection/core/services/network/api/api_consumer.dart';
import 'package:fall_detection/core/services/network/error/exceptions.dart';
import 'package:fall_detection/feature/ChatScreen/presentation/manger/cubit/chatmsgstatus.dart';

import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../core/services/shared_prefrences/shared_pref.dart';
import '../../../data/model/chatmsgmodel.dart';


// States


class ChatmsgCubit extends Cubit<ChatmsgState> {
  ChatmsgCubit(this.api) : super(ChatmsgInitialState());
  final ApiConsumer api;
  ChatData?chatdata;



  Future<void> fetchChats() async {
    emit(ChatmsgLoading());

    try {
      final response = await api.get(
        EndPoints.getMessagesofOtheruser,
          queryParameters: {
            'url': '${EndPoints.baseUrl}chat/${CacheHelper().getData(
                key: ApiKey.homeUserId)}',
            'token': CacheHelper().getData(key: ApiKey.token),
          }, );
      final chatResponse = chatmessage.fromJson(response);
      emit(ChatmsgLoadedSuccess(chatResponse));
    }
    on ServerException catch (error) {
      emit(ChatmsgError(message: error.errModel.message!));
    }
  }
}
*/