// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/pages/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/pages/stock_scan_detail.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/pages/variable_detail.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const StockScan());
      case '/stock-scan-detail':
        return _materialRoute(
          StockScanDetail(
            stockScan: settings.arguments as StockScanEntity,
          ),
        );
      case '/variable-detail':
        final arguments = settings.arguments as Map<String, dynamic>;
        return _materialRoute(
          VariableDeatil(
            variable: arguments["variable"] as VariableEntity,
            type: arguments["type"],
            title: arguments["title"],
          ),
        );
      default:
        return _materialRoute(const StockScan());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
