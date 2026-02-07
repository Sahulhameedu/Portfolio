import 'package:url_launcher/url_launcher.dart';

class UrlOpenHelper {
  Future<void> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'luhas046@gmail.com',
      query: Uri.encodeFull(
        'subject=Portfolio Contact from $name'
        '&body=Name: $name\nEmail: $email\nMessage:\n$message',
      ),
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> phoneCall({required String phoneNumber}) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
