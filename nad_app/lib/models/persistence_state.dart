import 'package:meta/meta.dart';

@immutable
class PersistenceState {
  final bool isSaving;

  PersistenceState({
    this.isSaving = false,
  });

  PersistenceState copyWith({
    bool isSaving,
  }) {
    return new PersistenceState(
      isSaving: isSaving ?? this.isSaving,
    );
  }
}