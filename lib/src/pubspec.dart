import 'dart:io';
import 'package:process_run/shell.dart';

import 'package:analysis_options_cli_generator/src/flutter_lints_pub_client.dart';
import 'package:plain_optional/plain_optional.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';

class Pubspec {
  static String flutterLintsPackageName = 'flutter_lints';

  static PubspecYaml _readFile() {
    return File('./pubspec.yaml').readAsStringSync().toPubspecYaml();
  }

  static bool get haveAnalysisOptionDependency => _readFile()
      .devDependencies
      .any((element) => element.package() == flutterLintsPackageName);

  static Future<void> _writeNewFile() async {
    final updatedFile = await _getUpdatedFile();

    File('./pubspec.yaml').writeAsStringSync(updatedFile.toYamlString());
  }

  static Future<void> updateFile() async {
    // if (!haveAnalysisOptionDependency) {
    await _writeNewFile();
    await _runPupGet();
    // }
  }

  static Future<void> _runPupGet() async {
    final shell = Shell();

    await shell.run(
      'flutter pub get',
    );
  }

  static Future<PubspecYaml> _getUpdatedFile() async {
    final newDevDependencies = _readFile().devDependencies.toList();
    newDevDependencies.add(
      PackageDependencySpec.hosted(
        HostedPackageDependencySpec(
          package: flutterLintsPackageName,
          version:
              Optional('^${await FlutterLintsPubClient.latestStableVersion}'),
        ),
      ),
    );
    final newYamlFile =
        _readFile().copyWith(devDependencies: newDevDependencies);
    return newYamlFile;
  }
}
