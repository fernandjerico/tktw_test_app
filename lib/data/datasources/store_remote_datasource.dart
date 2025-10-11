import 'package:dartz/dartz.dart';
import 'package:tktw_test_app/core/constant/app_urls.dart';
import 'package:tktw_test_app/core/services/dio_service.dart';
import 'package:tktw_test_app/data/models/change_status_store_response_model.dart';
import 'package:tktw_test_app/data/models/error_validation_response.dart';
import 'package:tktw_test_app/data/models/store_response_model.dart';

class StoreRemoteDatasource {
  final DioService dio = DioService();

  Future<Either<String, StoreResponseModel>> fetchStores() async {
    try {
      final response = await dio.get(AppUrls.getAllStores);
      if (response.statusCode == 200) {
        final data = StoreResponseModel.fromJson(response.data);
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

  Future<Either<String, StoreResponseModel>> fetchStoreById({int? id}) async {
    try {
      final url = id == null
          ? AppUrls.getAllStores
          : '${AppUrls.getAllStores}?id=$id';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = StoreResponseModel.fromJson(response.data);
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

  Future<Either<ErrorValidationResponse, ChangeStatusStoreResponseModel>>
  changeStoreStatus({
    required String id,
    required String status,
    String? failedReason,
  }) async {
    try {
      final response = await dio.put(
        '${AppUrls.changeStoreStatus}/$id',
        data: {"status": status, "failed_reason": failedReason},
      );
      if (response.statusCode == 200) {
        final data = ChangeStatusStoreResponseModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 422) {
        final errorData = ErrorValidationResponse.fromJson(response.data);
        return Left(errorData);
      } else if (response.statusCode == 422 || response.statusCode == 400) {
        final errorData = response.data;
        if (errorData is Map<String, dynamic>) {
          throw ErrorValidationResponse.fromJson(errorData);
        } else {
          throw ErrorValidationResponse(
            message: "Validation failed",
            errors: {},
          );
        }
      } else {
        throw ErrorValidationResponse(
          message:
              response.data?['message']?.toString() ?? "Fetch data failed.",
          errors: {},
        );
      }
    } catch (e) {
      throw ErrorValidationResponse(message: e.toString(), errors: {});
    }
  }
}
