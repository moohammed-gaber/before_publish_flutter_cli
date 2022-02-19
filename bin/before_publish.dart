#! /usr/bin/env dcli

import 'package:before_publish_cli/src/cli_questions.dart';
import 'package:before_publish_cli/src/files_handler.dart';
import 'package:before_publish_cli/src/mediator.dart';
import 'package:before_publish_cli/src/pubspec.dart';

import 'package:before_publish_cli/src/shell.dart';
import 'package:dcli/dcli.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:yaml/yaml.dart';
/*
  CliQuestions cliQuestions = CliQuestions();
  cliQuestions.continueWithDefaultConfig();
  return ;
*/

void main(List<String> args) async {
  final Mediator mediator = Mediator();
  await mediator.beforePublish();

/*  final x = 'hello world';
  x.write('test');
  x.append(',,,');

  print(x);*/
}
