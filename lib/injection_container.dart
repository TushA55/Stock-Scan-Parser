// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/data/data_sources/remote/stock_scan_api_service.dart';
import 'package:stock_scan_parser/features/dashboard/data/repository/stock_scan_repository_impl.dart';
import 'package:stock_scan_parser/features/dashboard/domain/repository/stock_scan_repository.dart';
import 'package:stock_scan_parser/features/dashboard/domain/usecases/get_stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/bloc/stock_scan/remote/bloc/remote_stock_scan_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<StockScanApiService>(StockScanApiService(sl()));

  sl.registerSingleton<StockScanRepository>(
    StockScanRepositoryImpl(stockScanApiService: sl()),
  );

  sl.registerSingleton<GetStockUsecase>(GetStockUsecase(sl()));

  sl.registerFactory<RemoteStockScanBloc>(() => RemoteStockScanBloc(sl()));
}
