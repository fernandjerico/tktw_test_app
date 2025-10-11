part of 'get_store_by_id_bloc.dart';

@freezed
class GetStoreByIdState with _$GetStoreByIdState {
  const factory GetStoreByIdState.initial() = _Initial;
  const factory GetStoreByIdState.loading() = _Loading;
  const factory GetStoreByIdState.loaded(StoreResponseModel data) = _Loaded;
  const factory GetStoreByIdState.error(dynamic error) = _Error;
}
