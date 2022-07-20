import 'package:url_launcher/url_launcher.dart';

///Urllauncher class
class LauncherUtils {
  ///open link with external browser
  static Future<void> webLaunch(url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) throw 'Could not launch $uri';
  }
}
