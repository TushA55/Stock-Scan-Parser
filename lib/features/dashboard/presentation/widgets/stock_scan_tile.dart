// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:stock_scan_parser/core/util/parser.dart';
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';

class StockScanTile extends StatelessWidget {
  const StockScanTile({
    super.key,
    required this.stockScan,
  });

  final StockScanEntity stockScan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/stock-scan-detail',
          arguments: stockScan,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stockScan.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              stockScan.tag,
              style: TextStyle(
                fontSize: 10,
                color: Parser.resolveColor(stockScan.color),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
