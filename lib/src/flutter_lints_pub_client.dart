import 'package:pub_api_client/pub_api_client.dart';

//
class FlutterLintsPubClient {
  final client = PubClient();

  FlutterLintsPubClient();

  Future<String> latestStableVersion(String packageName) async {
    final documentation = await client.documentation(packageName);
    final latestStableVersion = documentation.latestStableVersion;
    return latestStableVersion;
  }
}
