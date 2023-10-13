// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:stock_scan_parser/core/resources/data_state.dart';
import 'package:stock_scan_parser/features/dashboard/data/models/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/domain/usecases/get_stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/bloc/stock_scan/remote/bloc/remote_stock_scan_bloc.dart';

class MockGetStockUsecase extends Mock implements GetStockUsecase {}

void main() {
  late GetStockUsecase usecase;
  late RemoteStockScanBloc bloc;

  setUp(() {
    usecase = MockGetStockUsecase();
    bloc = RemoteStockScanBloc(usecase);
  });

  group('RemoteStockScanBloc', () {
    test(
      'initial state should be empty/loading',
      () {
        expect(bloc.state, RemoteStockScanLoading());
      },
    );

    final tModel = StockScanModel.empty();
    final tException = DioException(requestOptions: RequestOptions());

    blocTest<RemoteStockScanBloc, RemoteStockScanState>(
      'should emit [RemoteStockScanDone] when data is fetch sucessfully',
      build: () {
        when(() => usecase()).thenAnswer(
          (_) async {
            return DataSuccess([tModel]);
          },
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const RemoteStockScanFetch()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        RemoteStockScanDone(stockScanList: [tModel]),
      ],
    );

    blocTest<RemoteStockScanBloc, RemoteStockScanState>(
      'should emit [RemoteStockScanError] when data is fetch unsucessfully',
      build: () {
        when(() => usecase()).thenAnswer(
          (_) async {
            return DataError(tException);
          },
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const RemoteStockScanFetch()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        RemoteStockScanError(error: tException),
      ],
    );
  });
}
