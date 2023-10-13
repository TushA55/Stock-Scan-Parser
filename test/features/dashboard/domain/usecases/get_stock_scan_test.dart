// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/domain/repository/stock_scan_repository.dart';
import 'package:stock_scan_parser/features/dashboard/domain/usecases/get_stock_scan.dart';

class MockStockScanRepository extends Mock implements StockScanRepository {}

void main() {
  late GetStockUsecase usecase;
  late StockScanRepository repository;

  setUp(() {
    repository = MockStockScanRepository();
    usecase = GetStockUsecase(repository);
  });

  final tResponse = [StockScanEntity.empty()];

  test(
      'should call the [StockScanRepository.getStockScan] and return List<StockScanEntity>',
      () async {
    when(() => repository.getStockScan()).thenAnswer(
      (_) async => DataSuccess(tResponse),
    );

    final resp = await usecase();

    identical(resp, DataSuccess(tResponse));

    verify(() => repository.getStockScan()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
