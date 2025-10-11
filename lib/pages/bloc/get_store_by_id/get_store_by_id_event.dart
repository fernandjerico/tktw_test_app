part of 'get_store_by_id_bloc.dart';

@freezed
class GetStoreByIdEvent with _$GetStoreByIdEvent {
  const factory GetStoreByIdEvent.started() = _Started;
  const factory GetStoreByIdEvent.getStoreById({int? id}) = _GetStoreById;
}
