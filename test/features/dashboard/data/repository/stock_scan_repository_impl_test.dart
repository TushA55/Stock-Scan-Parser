// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/data/repository/stock_scan_repository_impl.dart';

class MockStockScanRepositoryImpl extends Mock
    implements StockScanRepositoryImpl {}

void main() {
  late StockScanRepositoryImpl repositoryImpl;

  setUp(() {
    repositoryImpl = MockStockScanRepositoryImpl();
  });

  final tModel = StockScanModel.empty();

  final tException = DioException(
    requestOptions: RequestOptions(),
    error: '',
    response: Response(
      requestOptions: RequestOptions(),
      statusCode: HttpStatus.badRequest,
    ),
    type: DioExceptionType.badResponse,
  );

  group('getStockScan', () {
    test(
      'should call the [StockScanRepositoryImpl.getStockScan] and return [List<StockScanModel>] when call to remote source is successful',
      () async {
        when(() => repositoryImpl.getStockScan()).thenAnswer(
          (_) async => DataSuccess([tModel]),
        );

        final result = await repositoryImpl.getStockScan();

        identical(result, DataSuccess([tModel]));

        verify(() => repositoryImpl.getStockScan()).called(1);

        verifyNoMoreInteractions(repositoryImpl);
      },
    );

    test(
        'should return a [DataError] when the call to the remote source is unsuccessful',
        () async {
      when(() => repositoryImpl.getStockScan()).thenAnswer(
        (_) async => DataError(tException),
      );

      final result = await repositoryImpl.getStockScan();

      identical(result, DataError(tException));

      verify(() => repositoryImpl.getStockScan()).called(1);

      verifyNoMoreInteractions(repositoryImpl);
    });
  });
}
