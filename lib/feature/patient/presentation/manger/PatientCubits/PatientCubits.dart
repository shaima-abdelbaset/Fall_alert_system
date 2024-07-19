import 'package:fall_detection/core/services/network/api/api_consumer.dart';
import 'package:fall_detection/feature/patient/data/model/PatientModel.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';
import '../../../../../core/services/shared_prefrences/shared_pref.dart';

class PatientCubit extends Cubit<PatientState> {

  PatientCubit( this.api) :super(PatientInitial());
  final ApiConsumer api;

  Future<void> fetchPatientData() async {
    emit(PatientLoading());
    try {
      final response = await api.get(
        '${EndPoints.baseUrl}patients/${CacheHelper().getData(key: ApiKey.homeUserId)}',
        queryParameters: {'deep': true},
        token: CacheHelper().getData(key: ApiKey.token),
      );

      if (response != null) {
        final patient = User.fromJson(response);
        emit(PatientLoaded(patient));
      }
    }on ServerException catch (e) {
      emit(PatientError(e.toString()));
    }
  }
}
