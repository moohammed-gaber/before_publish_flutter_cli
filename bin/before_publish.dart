#! /usr/bin/env dcli

import 'package:before_publish_cli/src/cli_questions.dart';
import 'package:before_publish_cli/src/mediator.dart';
import 'package:before_publish_cli/src/pubspec.dart';

import 'package:before_publish_cli/src/shell.dart';
import 'package:dcli/dcli.dart';

void main(List<String> args) async {
  CliQuestions cliQuestions = CliQuestions();
  cliQuestions.continueWithDefaultConfig();
  return ;
  final Mediator mediator = Mediator();
  await mediator.beforePublish();
}
