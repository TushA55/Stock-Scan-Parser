part of 'remote_stock_scan_bloc.dart';

sealed class RemoteStockScanEvent extends Equatable {
  const RemoteStockScanEvent();

  @override
  List<Object> get props => [];
}

final class RemoteStockScanFetch extends RemoteStockScanEvent {
  const RemoteStockScanFetch();
}