class PackageNames {
  static const launcherIcon = 'flutter_launcher_icons';
  static const changeAppPackageName = 'change_app_package_name';
  static const splash = 'flutter_native_splash';
  static const name = 'flutter_app_name';
  static const packages = [launcherIcon, changeAppPackageName, splash, name];
}

class PackageConfiguration {}

class Package {
  final String packageName;

  final Map? packageConfiguration;

  Package(this.packageName, this.packageConfiguration);
}
