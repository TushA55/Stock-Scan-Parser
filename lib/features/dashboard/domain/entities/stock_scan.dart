// Package imports:
import 'package:equatable/equatable.dart';

class StockScanEntity extends Equatable {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<CriteriaEntity> criterias;

  const StockScanEntity({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criterias,
  });

  factory StockScanEntity.empty() {
    return StockScanEntity(
      id: 0,
      name: '',
      tag: '',
      color: '',
      criterias: [
        CriteriaEntity.empty(),
      ],
    );
  }

  @override
  List<Object> get props {
    return [id, name, tag, color, criterias];
  }
}

class CriteriaEntity extends Equatable {
  final String type;
  final String text;
  final Map<String, VariableEntity> variables;

  const CriteriaEntity({
    required this.type,
    required this.text,
    required this.variables,
  });

  factory CriteriaEntity.empty() {
    return CriteriaEntity(
      type: '',
      text: '',
      variables: {
        '': VariableEntity.empty(),
      },
    );
  }

  @override
  List<Object?> get props => [type, text, variables];
}

class VariableEntity extends Equatable {
  final String type;
  final List<num>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  const VariableEntity({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory VariableEntity.empty() {
    return const VariableEntity(
      type: '',
      values: [],
      studyType: '',
      parameterName: '',
      minValue: 0,
      maxValue: 0,
      defaultValue: 0,
    );
  }

  @override
  List<Object?> get props => [
        type,
        values,
        studyType,
        parameterName,
        minValue,
        maxValue,
        defaultValue,
      ];
}
