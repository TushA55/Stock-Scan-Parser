// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/data/data_sources/remote/stock_scan_api_service.dart';
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';

class MockStockScanApiService extends Mock implements StockScanApiService {}

void main() {
  late MockStockScanApiService datasource;

  setUp(() {
    datasource = MockStockScanApiService();
  });

  group('getStockScan', () {
    final tModel = StockScanModel.empty();
    final tResponse = HttpResponse(
      [tModel],
      Response(
        requestOptions: RequestOptions(),
      ),
    );

    test(
      'should call the [StockScanApiService.getStockScan] and return [HttpResponse] when call to remote source is successful',
      () async {
        when(() => datasource.getStockScan()).thenAnswer(
          (_) async => tResponse,
        );

        final result = await datasource.getStockScan();

        identical(result, tResponse);

        verify(() => datasource.getStockScan()).called(1);

        verifyNoMoreInteractions(datasource);
      },
    );
  });
}
