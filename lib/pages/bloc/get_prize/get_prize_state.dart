part of 'get_prize_bloc.dart';

@freezed
class GetPrizeState with _$GetPrizeState {
  const factory GetPrizeState.initial() = _Initial;
  const factory GetPrizeState.loading() = _Loading;
  const factory GetPrizeState.loaded(PrizesResponseModel data) = _Loaded;
  const factory GetPrizeState.error(dynamic error) = _Error;
}
