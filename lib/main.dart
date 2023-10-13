// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:stock_scan_parser/config/routes/routes.dart';
import 'package:stock_scan_parser/config/theme/app_themes.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/bloc/stock_scan/remote/bloc/remote_stock_scan_bloc.dart';
import 'package:stock_scan_parser/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteStockScanBloc>(
          create: (context) => sl()..add(const RemoteStockScanFetch()),
        ),
      ],
      child: MaterialApp(
        title: 'Stock Scan Parser',
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
