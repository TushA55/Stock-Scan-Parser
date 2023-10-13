// Project imports:
import 'package:stock_scan_parser/features/dashboard/domain/entities/stock_scan.dart';

class StockScanModel extends StockScanEntity {
  const StockScanModel({
    required super.id,
    required super.name,
    required super.tag,
    required super.color,
    required super.criterias,
  });

  factory StockScanModel.empty() {
    return StockScanModel(
      id: 0,
      name: '',
      tag: '',
      color: '',
      criterias: [CriteriaModel.empty()],
    );
  }

  factory StockScanModel.fromJson(Map<String, dynamic> json) {
    return StockScanModel(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criterias: List<CriteriaModel>.from(
          json['criteria'].map((x) => CriteriaModel.fromJson(x))),
    );
  }
}

class CriteriaModel extends CriteriaEntity {
  const CriteriaModel({
    required super.type,
    required super.text,
    required super.variables,
  });

  factory CriteriaModel.empty() {
    return CriteriaModel(
      type: '',
      text: '',
      variables: {
        '': VariableModel.empty(),
      },
    );
  }

  factory CriteriaModel.fromJson(Map<String, dynamic> json) {
    Map<String, VariableModel> variables = {};
    if (json['variable'] != null) {
      json['variable'].forEach((key, value) {
        variables[key] = VariableModel.fromJson(value);
      });
    }
    return CriteriaModel(
      type: json['type'],
      text: json['text'],
      variables: variables,
    );
  }
}

class VariableModel extends VariableEntity {
  const VariableModel({
    required super.type,
    required super.values,
    required super.studyType,
    required super.parameterName,
    required super.minValue,
    required super.maxValue,
    required super.defaultValue,
  });

  factory VariableModel.empty() {
    return const VariableModel(
      type: '',
      values: [],
      studyType: '',
      parameterName: '',
      minValue: 0,
      maxValue: 0,
      defaultValue: 0,
    );
  }

  factory VariableModel.fromJson(Map<String, dynamic> json) {
    return VariableModel(
      type: json['type'],
      values: json['values'] != null ? List<num>.from(json['values']) : null,
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
    );
  }
}
