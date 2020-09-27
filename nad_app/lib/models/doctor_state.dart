import 'package:meta/meta.dart';

import 'doctor.dart';

@immutable
class DoctorState {
  final List<Doctor> doctors;

  DoctorState({
    this.doctors = const [],
  });

  DoctorState copyWith({
    List<Doctor> doctors
  }) {
    return new DoctorState(
      doctors: doctors ?? this.doctors,
    );
  }
}