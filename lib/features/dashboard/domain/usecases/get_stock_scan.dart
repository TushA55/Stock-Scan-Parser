// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/core/usercase/usecase.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/domain/repository/stock_scan_repository.dart';

class GetStockUsecase
    implements UseCase<DataState<List<StockScanEntity>>, void> {
  final StockScanRepository _stockScanRepository;

  GetStockUsecase(this._stockScanRepository);

  @override
  Future<DataState<List<StockScanEntity>>> call({void params}) {
    return _stockScanRepository.getStockScan();
  }
}
