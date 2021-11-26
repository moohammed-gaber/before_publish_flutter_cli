import 'dart:io';

import 'package:before_publish_cli/src/cli_questions.dart';
import 'package:before_publish_cli/src/configration.dart';
import 'package:before_publish_cli/src/failures.dart';
import 'package:before_publish_cli/src/files_handler.dart';
import 'package:before_publish_cli/src/pubspec.dart';
import 'package:before_publish_cli/src/shell.dart';

class Mediator {
  final ShellRunner shellRunner = ShellRunner();
  final FilesHandler filesHandler = FilesHandler();
  final CliQuestions cliQuestions = CliQuestions();

  Future<void> beforePublish() async {
    final readConfiguration = await filesHandler.readConfiguration();
    await readConfiguration.fold((l) async {
      await filesHandler.writeConfiguration(Configuration.defaultConfig());
      cliQuestions.continueWithDefaultConfig();
    }, (r) async {
      final Pubspec pubspec = Pubspec(r);
      final Configuration configuration = pubspec.configuration;
      await pubspec.updateFile();
      await shellRunner.runAllScripts(configuration.package);
    });
    final newConfiguration = await filesHandler.readConfiguration();
    final Pubspec pubspec = Pubspec(newConfiguration.getOrElse(() {return Configuration.defaultConfig();}));
    final Configuration configuration = pubspec.configuration;
    await pubspec.updateFile();
    await shellRunner.runAllScripts(configuration.package);
  }
}
