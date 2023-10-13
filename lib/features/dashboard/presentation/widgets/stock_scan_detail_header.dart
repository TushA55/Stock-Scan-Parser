// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:stock_scan_parser/core/util/parser.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';

class StockScanDetailHeader extends StatelessWidget {
  const StockScanDetailHeader({super.key, required this.stockScan});

  final StockScanEntity stockScan;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stockScan.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            stockScan.tag,
            style: TextStyle(
              fontSize: 10,
              color: Parser.resolveColor(stockScan.color),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
