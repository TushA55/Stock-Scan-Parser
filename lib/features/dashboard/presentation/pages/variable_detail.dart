// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';
import 'package:stock_scan_parser/features/dashboard/presentation/widgets/variable_detail_parameter_card.dart';

class VariableDeatil extends StatelessWidget {
  const VariableDeatil({
    super.key,
    required this.variable,
    required this.type,
    required this.title,
  });

  final VariableEntity variable;
  final String type;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: variable.values == null
          ? Text(
              title.split(" ").first,
            )
          : null,
      leading: IconButton(
        icon: const Icon(
          Icons.keyboard_backspace_rounded,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  _buildBody() {
    if (type == "value") {
      final values = variable.values!;
      return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          thickness: 0.2,
          height: 32,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        itemBuilder: (context, index) {
          return Text(
            "${values[index]}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        },
        itemCount: values.length,
      );
    }
    return VariableDetailParameterCard(variable: variable);
  }
}
