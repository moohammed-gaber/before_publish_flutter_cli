import 'package:pub_api_client/pub_api_client.dart';

//
class FlutterLintsPubClient {
  static Future<String> get latestStableVersion async {
    final client = PubClient();
    final documentation = await client.documentation('flutter_lints');
    final latestStableVersion = documentation.latestStableVersion;
    return latestStableVersion;
  }
}

