part of 'remote_stock_scan_bloc.dart';

sealed class RemoteStockScanState extends Equatable {
  final List<StockScanEntity>? stockScanList;
  final DioException? error;

  const RemoteStockScanState({
    this.stockScanList,
    this.error,
  });

  @override
  List<Object> get props => [
        if (stockScanList != null) stockScanList!,
        if (error != null) error!,
      ];
}

final class RemoteStockScanLoading extends RemoteStockScanState {}

final class RemoteStockScanDone extends RemoteStockScanState {
  const RemoteStockScanDone({
    required List<StockScanEntity> stockScanList,
  }) : super(stockScanList: stockScanList);
}

final class RemoteStockScanError extends RemoteStockScanState {
  const RemoteStockScanError({
    required DioException error,
  }) : super(error: error);
}
