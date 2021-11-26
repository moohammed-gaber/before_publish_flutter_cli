import 'package:analysis_options_cli_generator/src/custom_analysis_options.dart';

//    prefer_final_pub global activate parameters: true
class AnalysisOptions {
  static const fileName = 'analysis_options.yaml';

  //<editor-fold desc="File Content">
  static const analyzerFileContent = '''
  
analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "**/injection_container.config.dart"
  errors:
    invalid_annotation_target: ignore
    ''';
  static const linterFileContent = '''
include: package:flutter_lints/flutter.yaml
linter:
  rules:
    avoid_type_to_string: true
    avoid_slow_async_io: true
    lowercase_with_underscores: true
    non_constant_identifier_names: true
    null_closures: true
    avoid_relative_lib_imports: true
    avoid_types_as_parameter_names: true
    avoid_web_libraries_in_flutter: true
    no_logic_in_create_state: true
    no_duplicate_case_values: true
    no_adjacent_strings_in_list: true
    list_remove_unrelated_type: true
    iterable_contains_unrelated_type: true
    avoid_double_and_int_checks: true
    avoid_equals_and_hash_code_on_mutable_classes: true
    avoid_init_to_null: true
    avoid_positional_boolean_parameters: true
    cancel_subscriptions: true
    control_flow_in_finally: true
    hash_and_equals: true
    empty_statements: true
    valid_regexps: true
    use_key_in_widget_constructors: true
    use_build_context_synchronously: true
    unsafe_html: true
    unrelated_type_equality_checks: true
    throw_in_finally: true
    avoid_bool_literals_in_conditional_expressions: true
    use_string_buffers: true
    always_declare_return_types: true
    sort_unnamed_constructors_first: true
    prefer_const_constructors: true
    prefer_const_constructors_in_immutables: true
    prefer_const_literals_to_create_immutables: true
    prefer_constructors_over_static_methods: true
    prefer_contains: true
    prefer_equal_for_default_values: true
    avoid_dynamic_calls: true
    avoid_catches_without_on_clauses: true
    avoid_empty_else: true
    avoid_returning_null: true
    annotate_overrides: true
    avoid_unnecessary_containers: true
    use_to_and_as_if_applicable: true
    use_rethrow_when_possible: true
    use_named_constants: true
    use_is_even_rather_than_modulo: true
    unnecessary_this: true
    unnecessary_string_interpolations: true
    unnecessary_string_escapes: true
    unnecessary_raw_strings: true
    unnecessary_parenthesis: true
    unnecessary_overrides: true
    unnecessary_lambdas: true
    unnecessary_new: true
    unnecessary_null_checks: true
    unnecessary_null_aware_assignments: true
    unnecessary_getters_setters: true
    unnecessary_const: true
    prefer_final_in_for_each: true
    prefer_final_fields: true
    file_names: true
    no_runtimeType_toString: true
    lines_longer_than_80_chars: true
    unawaited_futures: true
    one_member_abstracts: true
    only_throw_errors: true
    prefer_collection_literals: true
    prefer_conditional_assignment: true
    noop_primitive_operations: true
    type_init_formals: true
    type_annotate_public_apis: true
    sort_child_properties_last: true
    sized_box_for_whitespace: true
    require_trailing_commas: true
    recursive_getters: true
    prefer_typing_uninitialized_variables: true
    prefer_spread_collections: true
    prefer_null_aware_operators: true
    prefer_null_aware_method_calls: true
    prefer_mixin: true
    prefer_iterable_whereType: true
    prefer_is_not_operator: true
    prefer_is_not_empty: true
    prefer_is_empty: true
    prefer_interpolation_to_compose_strings: true
    prefer_int_literals: true
    prefer_inlined_adds: true
    prefer_initializing_formals: true
    prefer_if_null_operators: true
    prefer_if_elements_to_conditional_expressions: true
    prefer_generic_function_type_aliases: true
    prefer_function_declarations_over_variables: true
    prefer_foreach: true
    prefer_final_locals: true
    avoid_returning_null_for_future: true
    avoid_returning_null_for_void: true
    avoid_returning_this: true
    prefer_single_quotes: true
''';

//</editor-fold>

  static String fileContent(CustomAnalysisOptions customAnalysisOptions) =>
      '''$linterFileContent${customAnalysisOptions.toAnalysisOptionsFormat}$analyzerFileContent
  ''';
}
