#! /usr/bin/env dcli

// ignore: prefer_relative_imports
import 'package:analysis_options_cli_generator/src/pubspec.dart';

import 'package:analysis_options_cli_generator/src/analysis_options.dart';
import 'package:analysis_options_cli_generator/src/custom_analysis_options.dart';
import 'package:dcli/dcli.dart';

//Avoid defining a class that contains only static members
void main(List<String> args) async {
  const custom = 'Custom "Choose y/n for only 4 rules"';
  final result = menu(
    prompt: 'Select Mode',
    options: ['Basic "Use default rules"', custom],
  );
  final bool isAvoidPrintEnabled,
      isSortPubEnabled,
      isSortConstructorsFirstEnabled,
      isPreferExpressionBodiesEnabled;
  final isCustomSelected = result == custom;
  if (isCustomSelected) {
    isAvoidPrintEnabled = confirm('Avoid print', defaultValue: false);
    isSortPubEnabled = confirm('Sort pub dependencies', defaultValue: false);
    isSortConstructorsFirstEnabled =
        confirm('Sort constructors first', defaultValue: false);
    isPreferExpressionBodiesEnabled =
        confirm('Prefer expression function bodies', defaultValue: false);
  } else {
    isAvoidPrintEnabled = false;
    isSortPubEnabled = false;
    isSortConstructorsFirstEnabled = false;
    isPreferExpressionBodiesEnabled = false;
  }

  AnalysisOptions.fileName.write(
    AnalysisOptions.fileContent(
      CustomAnalysisOptions(
        isAvoidPrintEnabled: isAvoidPrintEnabled,
        isSortPubEnabled: isSortPubEnabled,
        isSortConstructorsFirstEnabled: isSortConstructorsFirstEnabled,
        isPreferExpressionBodiesEnabled: isPreferExpressionBodiesEnabled,
      ),
    ),
  );

  await Pubspec.updateFile();
}
/*
  final loadedYaml = loadYaml(readYamlFile);
  final YamlMap devDependencies = loadedYaml['dev_dependencies'];

  devDependencies.addAll(
      {'flutter_lints': Dependency.fromHosted('flutter_lints', '^1.0.0')});
  if (!devDependencies.containsKey('flutter_lints')) {
    print('heloo');
  }

 */
