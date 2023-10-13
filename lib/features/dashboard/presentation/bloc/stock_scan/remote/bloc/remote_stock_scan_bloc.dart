// Package imports:
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/domain/usecases/get_stock_scan.dart';

part 'remote_stock_scan_event.dart';
part 'remote_stock_scan_state.dart';

class RemoteStockScanBloc
    extends Bloc<RemoteStockScanEvent, RemoteStockScanState> {
  final GetStockUsecase _getStockUsecase;

  RemoteStockScanBloc(this._getStockUsecase) : super(RemoteStockScanLoading()) {
    on<RemoteStockScanFetch>(onGetStockScan);
  }

  void onGetStockScan(
      RemoteStockScanFetch event, Emitter<RemoteStockScanState> emit) async {
    final dataState = await _getStockUsecase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteStockScanDone(stockScanList: dataState.data!));
    } else if (dataState is DataError) {
      emit(RemoteStockScanError(error: dataState.error!));
    }
  }
}
