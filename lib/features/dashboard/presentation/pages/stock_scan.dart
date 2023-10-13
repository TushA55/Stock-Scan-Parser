// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/presentation/bloc/stock_scan/remote/bloc/remote_stock_scan_bloc.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/widgets/stock_scan_tile.dart';
import 'package:stock_scan_parser/injection_container.dart';

class StockScan extends StatelessWidget {
  const StockScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Stock Scan'),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteStockScanBloc, RemoteStockScanState>(
      builder: (_, state) {
        if (state is RemoteStockScanLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteStockScanError) {
          return Center(
            child: IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () =>
                  sl<RemoteStockScanBloc>().add(const RemoteStockScanFetch()),
            ),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            thickness: 0.2,
            height: 16,
            indent: 24,
            endIndent: 24,
          ),
          itemBuilder: (context, index) {
            final scan = state.stockScanList![index];
            return StockScanTile(stockScan: scan);
          },
          itemCount: state.stockScanList!.length,
        );
      },
    );
  }
}
