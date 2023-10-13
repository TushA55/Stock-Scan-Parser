// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/data/data_sources/remote/stock_scan_api_service.dart';
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/domain/repository/stock_scan_repository.dart';

class StockScanRepositoryImpl implements StockScanRepository {
  final StockScanApiService stockScanApiService;

  StockScanRepositoryImpl({
    required this.stockScanApiService,
  });

  @override
  Future<DataState<List<StockScanModel>>> getStockScan() async {
    try {
      final httpResponse = await stockScanApiService.getStockScan();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final stockScanList = httpResponse.data;
        return DataSuccess(stockScanList);
      }

      return DataError(
        DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
        ),
      );
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
