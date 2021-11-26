#! /usr/bin/env dcli

import 'package:before_publish_cli/src/cli_questions.dart';
import 'package:before_publish_cli/src/mediator.dart';
import 'package:before_publish_cli/src/pubspec.dart';

import 'package:before_publish_cli/src/shell.dart';
import 'package:dcli/dcli.dart';
/*
  CliQuestions cliQuestions = CliQuestions();
  cliQuestions.continueWithDefaultConfig();
  return ;
*/

void main(List<String> args) async {
  final Mediator mediator = Mediator();
  await mediator.beforePublish();
}
