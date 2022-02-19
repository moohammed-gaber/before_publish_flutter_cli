import 'package:pub_api_client/pub_api_client.dart';

//
class FlutterPubClient {
  final client = PubClient();

  FlutterPubClient();

  Future<String> getLatestStableVersion(String packageName) async {
    final documentation = await client.documentation(packageName);
    final latestStableVersion = documentation.latestStableVersion;
    return latestStableVersion;
  }
}
