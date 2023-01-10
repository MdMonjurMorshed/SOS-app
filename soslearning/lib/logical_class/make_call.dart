import 'package:url_launcher/url_launcher.dart';

class MakeCall {
  MakeCall({required this.number});
  String number;
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
