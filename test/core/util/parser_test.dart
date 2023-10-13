import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/core/util/parser.dart';

void main() {
  group('resolveColor', () {
    test(
        '[Parser.resolveColor] should return [Colors.red] for correct red color input',
        () {
      final color = Parser.resolveColor("red");
      expect(color, Colors.red);
    });

    test(
        '[Parser.resolveColor] should return [Colors.green] for correct green color input',
        () {
      final color = Parser.resolveColor("green");
      expect(color, Colors.green);
    });
  });
}
