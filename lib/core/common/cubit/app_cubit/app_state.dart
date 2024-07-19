import 'package:fall_detection/feature/messages/Models/MessagesModel/MessagesModel.dart';
import 'package:fall_detection/feature/notification/data/model/NotificationModel.dart';
import 'package:fall_detection/feature/profile/data/Models/UserModel.dart';

abstract class AppState {}

class AppLoadingState extends AppState {}

class AppInitialstate extends AppState {}

class AppSuccessState extends AppState {
  final UserModel user;

  AppSuccessState({required this.user});
}

class AppLoadedSuccess extends AppState {
  final ChatResponse chatResponse;

  AppLoadedSuccess({required this.chatResponse});


}

class AppLoadedSuccess2 extends AppState {
  final NotificationModel notifications; // Corrected line

  AppLoadedSuccess2(this.notifications);
}

class AppFailerState extends AppState {
  final String errorMessage;

  AppFailerState({required this.errorMessage});
}
