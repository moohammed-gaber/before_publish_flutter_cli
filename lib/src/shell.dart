import 'package:process_run/shell.dart';

class ShellRunner {
  final shell = Shell();

  Future<void> runAllScripts(String packageName) {
    return shell.run(
      'flutter pub get &&'
      'flutter pub run flutter_native_splash:create &&'
      'flutter pub run flutter_launcher_icons:main &&'
      'flutter pub run flutter_app_name &&'
      'flutter pub run change_app_package_name:main $packageName',
    );
  }
}

/*
  Future<void> pubGet() => shell.run(
        'flutter pub get',
      );

  Future<void> changePackageName(String packageName) => shell.run(
        'flutter pub run change_app_package_name:main $packageName',
      );

  Future<void> changeAppIcon() => shell.run(
        'flutter pub run change_app_package_name:main',
      );

  Future<void> changeAppSplash() => shell.run(
        'flutter pub run flutter_launcher_icons:main',
      );

  Future<void> changeAppName() => shell.run(
        'flutter pub run flutter_launcher_name:main',
      );

 */
