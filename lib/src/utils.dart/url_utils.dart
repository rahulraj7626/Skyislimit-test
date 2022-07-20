import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static Future<void> webLaunch(url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) throw 'Could not launch $uri';
  }
}
