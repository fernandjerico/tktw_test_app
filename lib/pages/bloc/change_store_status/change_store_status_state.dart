part of 'change_store_status_bloc.dart';

@freezed
class ChangeStoreStatusState with _$ChangeStoreStatusState {
  const factory ChangeStoreStatusState.initial() = _Initial;
  const factory ChangeStoreStatusState.loading() = _Loading;
  const factory ChangeStoreStatusState.loaded(
    ChangeStatusStoreResponseModel data,
  ) = _Loaded;
  const factory ChangeStoreStatusState.error(dynamic error) = _Error;
}
