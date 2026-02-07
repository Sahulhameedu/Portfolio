import 'package:url_launcher/url_launcher.dart';

class DownloadManager {
  static Future<void> downloadCV() async {
    final url = Uri.parse('/assets/cv/Sahulhameed_Resume.pdf');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    ).catchError((error) {});
  }
}
