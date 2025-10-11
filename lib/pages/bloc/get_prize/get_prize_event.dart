part of 'get_prize_bloc.dart';

@freezed
class GetPrizeEvent with _$GetPrizeEvent {
  const factory GetPrizeEvent.started() = _Started;
  const factory GetPrizeEvent.getPrize() = _GetPrize;
}
