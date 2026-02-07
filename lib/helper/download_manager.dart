import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

class DownloadManager {
  static Future downloadCV() async {
    final byteData = await rootBundle.load('assets/cv/Sahulhameed_Resume.pdf');

    // Convert to blob
    final blob = html.Blob([byteData.buffer.asUint8List()], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Trigger download
    final anchor = html.AnchorElement(href: url)
      ..download = 'Sahulhameed_Resume.pdf'
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  }
}
