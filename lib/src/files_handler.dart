import 'dart:convert';
import 'dart:io';

import 'package:before_publish_cli/src/configration.dart';
import 'package:before_publish_cli/src/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';

class FilesHandler {
  final defaultConfig = Configuration.defaultConfig();

  Future<Either<NotFoundFile, Configuration>> readConfiguration() async {
    try {
      final file = File('./assets/before_publish.json').readAsStringSync();
      return right(configurationFromJson(file));
    } /*on FileSystemException catch (e) {
    }*/
    catch (e) {
      return left(NotFoundFile());
    }
  }

  PubspecYaml readPubspecYaml() {
    return File('./pubspec.yaml').readAsStringSync().toPubspecYaml();
  }

  Future<void> writeConfiguration(Configuration configuration) async {
    final file =
        await File('./assets/before_publish.json').create(recursive: true);

    file.writeAsStringSync(jsonEncode(configuration.toJson()));
  }

  Future<void> writePubspecYaml(String content) async {
    File('./pubspec.yaml').writeAsStringSync(content);
  }
}
