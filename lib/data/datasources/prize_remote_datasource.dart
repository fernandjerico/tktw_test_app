import 'package:dartz/dartz.dart';
import 'package:tktw_test_app/data/models/prizes_response_model.dart';

import '../../core/constant/app_urls.dart';
import '../../core/services/dio_service.dart';

class PrizeRemoteDatasource {
  final DioService dio = DioService();

  Future<Either<String, PrizesResponseModel>> fetchStores() async {
    try {
      final response = await dio.get(AppUrls.getAllPrizes);
      if (response.statusCode == 200) {
        final data = PrizesResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
          response.data?['message']?.toString() ?? "Fetch data failed.",
        );
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
