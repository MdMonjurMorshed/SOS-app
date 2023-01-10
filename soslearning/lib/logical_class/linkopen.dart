import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({required String url}) => _launchUrl(url);

  static _launchUrl(String url) async {
    var uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await canLaunchUrl(uri);
    } else {
      throw 'not found $url';
    }
  }
}
