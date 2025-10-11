import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tktw_test_app/data/datasources/store_remote_datasource.dart';
import 'package:tktw_test_app/data/models/change_status_store_response_model.dart';

part 'change_store_status_event.dart';
part 'change_store_status_state.dart';
part 'change_store_status_bloc.freezed.dart';

class ChangeStoreStatusBloc
    extends Bloc<ChangeStoreStatusEvent, ChangeStoreStatusState> {
  final StoreRemoteDatasource storeRemoteDatasource = StoreRemoteDatasource();
  ChangeStoreStatusBloc() : super(_Initial()) {
    on<_ChangeStatus>((event, emit) async {
      emit(_Loading());

      final result = await storeRemoteDatasource.changeStoreStatus(
        id: event.id,
        status: event.status,
        failedReason: event.failedReason,
      );
      result.fold(
        (failure) => emit(_Error(failure)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
