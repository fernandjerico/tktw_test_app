import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tktw_test_app/data/datasources/store_remote_datasource.dart';
import 'package:tktw_test_app/data/models/customers_response_model.dart';

part 'get_store_event.dart';
part 'get_store_state.dart';
part 'get_store_bloc.freezed.dart';

class GetStoreBloc extends Bloc<GetStoreEvent, GetStoreState> {
  StoreRemoteDatasource storeRemoteDatasource = StoreRemoteDatasource();
  GetStoreBloc() : super(_Initial()) {
    on<_GetAllStores>((event, emit) async {
      emit(_Loading());

      final result = await storeRemoteDatasource.fetchStores();
      result.fold(
        (failure) => emit(_Error(failure)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
