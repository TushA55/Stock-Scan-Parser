// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'package:stock_scan_parser/core/constants/constants.dart';
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';

part 'stock_scan_api_service.g.dart';

@RestApi(baseUrl: stockScanAPIBaseURL)
abstract class StockScanApiService {
  factory StockScanApiService(Dio dio, {String baseUrl}) = _StockScanApiService;

  @GET("/data.json")
  Future<HttpResponse<List<StockScanModel>>> getStockScan();
}
