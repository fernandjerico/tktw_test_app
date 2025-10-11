import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tktw_test_app/data/datasources/store_remote_datasource.dart';
import 'package:tktw_test_app/data/models/customers_response_model.dart';

part 'get_store_by_id_event.dart';
part 'get_store_by_id_state.dart';
part 'get_store_by_id_bloc.freezed.dart';

class GetStoreByIdBloc extends Bloc<GetStoreByIdEvent, GetStoreByIdState> {
  final StoreRemoteDatasource storeRemoteDatasource = StoreRemoteDatasource();
  GetStoreByIdBloc() : super(_Initial()) {
    on<_GetStoreById>((event, emit) async {
      emit(_Loading());

      final result = await storeRemoteDatasource.fetchStoreById(id: event.id);
      result.fold(
        (failure) => emit(_Error(failure)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
