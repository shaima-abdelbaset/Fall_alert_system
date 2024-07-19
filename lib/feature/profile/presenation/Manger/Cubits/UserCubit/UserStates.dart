import '../../../../data/Models/UserModel.dart';
import '../../../../data/Models/updateProfileModel.dart';

abstract class UserState{}
class UserLoading extends UserState{}
class UserInitialstate extends UserState{}
class UserSuccess extends UserState{
  final  UserModel user;

  UserSuccess({required this.user});
}
class Userfailer extends UserState{
  final String errorMessage;

  Userfailer({ required this.errorMessage});


}



class ProfileInitial extends UserState {}

class ProfileUpdating extends UserState {}

class ProfileUpdated extends UserState {
  final ProfileData profileData;

   ProfileUpdated(this.profileData);


}

class ProfileUpdateError extends UserState {
  final String error;

   ProfileUpdateError({required this.error});

}