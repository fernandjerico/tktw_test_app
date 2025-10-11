import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tktw_test_app/data/datasources/prize_remote_datasource.dart';
import 'package:tktw_test_app/data/models/prizes_response_model.dart';

part 'get_prize_event.dart';
part 'get_prize_state.dart';
part 'get_prize_bloc.freezed.dart';

class GetPrizeBloc extends Bloc<GetPrizeEvent, GetPrizeState> {
  final PrizeRemoteDatasource prizeRemoteDatasource = PrizeRemoteDatasource();
  GetPrizeBloc() : super(_Initial()) {
    on<_GetPrize>((event, emit) async {
      emit(_Loading());

      final result = await prizeRemoteDatasource.fetchStores();
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
