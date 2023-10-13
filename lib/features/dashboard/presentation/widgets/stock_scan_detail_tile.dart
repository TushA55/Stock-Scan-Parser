// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';

class StockScanDetailTile extends StatelessWidget {
  const StockScanDetailTile({
    super.key,
    required this.stockScan,
    required this.index,
  });

  final StockScanEntity stockScan;
  final int index;

  @override
  Widget build(BuildContext context) {
    final criteria = stockScan.criterias[index];
    if (criteria.type == "plain_text") {
      return Text(
        criteria.text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.justify,
      );
    } else if (criteria.type == "variable") {
      final texts = criteria.text.split(" ");
      return RichText(
        text: TextSpan(
          children: List.generate(
            texts.length,
            (index) {
              final variables = criteria.variables;
              if (variables[texts[index]] == null) {
                return TextSpan(
                  text: "${texts[index]} ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
              final variable = variables[texts[index]]!;
              return TextSpan(
                text: "(${variable.values?.first ?? variable.defaultValue}) ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(
                      context,
                      '/variable-detail',
                      arguments: {
                        "variable": variable,
                        "type": variable.type,
                        "title": stockScan.name,
                      },
                    );
                  },
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              );
            },
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
