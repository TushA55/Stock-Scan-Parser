// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = StockScanModel.empty();

  test('sould be a subclass of [StockScan] entity', () {
    expect(tModel, isA<StockScanModel>());
  });

  final tJson = fixture("data.json");
  final tMap = jsonDecode(tJson) as Map<String, dynamic>;

  group('fromJson', () {
    test(
      'should return a [StockScanModel] with the right data',
      () {
        final result = StockScanModel.fromJson(tMap);
        identical(result, tModel);
      },
    );
  });
}
