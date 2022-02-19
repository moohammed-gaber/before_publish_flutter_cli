import 'package:before_publish_cli/src/configration.dart';
import 'package:before_publish_cli/src/flutter_lints_pub_client.dart';
import 'package:before_publish_cli/src/package_names.dart';
import 'package:plain_optional/plain_optional.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';

import 'files_handler.dart';

class Pubspec {
  final flutterLintsPubClient = FlutterPubClient();
  final filesHandler = FilesHandler();

  final Configuration configuration;

  Pubspec(this.configuration);

  Future<void> updateFile() async {
    final updatedFile = await _getUpdatedFile();
    await filesHandler.writePubspecYaml(updatedFile.toYamlString());
  }

  Future<PackageDependencySpec> getPackageDependencySpec(
      String packageName) async {
    return PackageDependencySpec.hosted(HostedPackageDependencySpec(
      package: packageName,
      version: Optional(
          '^${await flutterLintsPubClient.getLatestStableVersion(packageName)}'),
    ));
  }

  Future<PubspecYaml> _getUpdatedFile() async {
    List<Future<PackageDependencySpec>> dependecies = [];
    final packages = PackageNames.packages;
    for (int i = 0; i < packages.length; i++) {
      dependecies.add(getPackageDependencySpec(packages[i]));
    }
    final newDevDependecies = await Future.wait(dependecies);
    var oldYamlFile = filesHandler.readPubspecYaml();

    final newYamlFile = oldYamlFile.copyWith(devDependencies: [
      ...oldYamlFile.devDependencies,
      ...newDevDependecies.cast<PackageDependencySpec>()
    ], customFields: {
      ...oldYamlFile.customFields,
      'flutter_icons': {
        'android': true,
        'remove_alpha_ios': true,
        'ios': true,
        'image_path': configuration.icon
      },
      'flutter_native_splash': {'background_image': configuration.splash},
      'flutter_app_name': {'name': configuration.name}
    });

    return newYamlFile;
  }
}
