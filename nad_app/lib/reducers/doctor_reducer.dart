import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/doctor.dart';
import 'package:nad_app/models/doctor_state.dart';
import 'package:redux/redux.dart';

Reducer<DoctorState> doctorReducer = combineReducers([
  new TypedReducer<DoctorState, SyncResponseReceived>(syncResponseReceivedReducer),
]);

DoctorState syncResponseReceivedReducer(DoctorState doctorState, SyncResponseReceived action) {
  if (action.response.doctors == null) {
    return doctorState;
  }

  final List<Doctor> newDoctors = List.from(action.response.doctors);
  return doctorState.copyWith(
    doctors: newDoctors,
  );
}