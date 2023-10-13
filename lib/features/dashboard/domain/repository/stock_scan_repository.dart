// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';

abstract class StockScanRepository {
  Future<DataState<List<StockScanEntity>>> getStockScan();
}
