class CustomAnalysisOptions {
  final bool isAvoidPrintEnabled;
  final bool isSortPubEnabled;
  final bool isSortConstructorsFirstEnabled;
  final bool isPreferExpressionBodiesEnabled;

  CustomAnalysisOptions({
    required this.isAvoidPrintEnabled,
    required this.isSortPubEnabled,
    required this.isSortConstructorsFirstEnabled,
    required this.isPreferExpressionBodiesEnabled,
  });

  String get toAnalysisOptionsFormat {
    return '''
    avoid_print: $isAvoidPrintEnabled
    sort_pub_dependencies: $isSortPubEnabled
    sort_constructors_first: $isSortConstructorsFirstEnabled
    prefer_expression_function_bodies: $isPreferExpressionBodiesEnabled
        ''';
  }
}
/*
abstract class Parent {}

class SampleAnalysisOptions {
  String get toAnalysisOptionsFormat {
    return '''
    avoid_print: false
    sort_pub_dependencies: false
    sort_constructors_first: false
    prefer_expression_function_bodies: false
        ''';
  }
}
*/
