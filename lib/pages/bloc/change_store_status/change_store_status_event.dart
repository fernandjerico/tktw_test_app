part of 'change_store_status_bloc.dart';

@freezed
class ChangeStoreStatusEvent with _$ChangeStoreStatusEvent {
  const factory ChangeStoreStatusEvent.started() = _Started;
  const factory ChangeStoreStatusEvent.changeStatus({
    required int id,
    required String status,
    String? failedReason,
  }) = _ChangeStatus;
}
