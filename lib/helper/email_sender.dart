import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailSender {
  static Future<void> sendEmail(Map<String, dynamic> data) async {
    print(dotenv.env);
    final emailSeriveId = dotenv.env['EMAIL_SERVICE_ID']!;
    final emailTemplateId = dotenv.env['EMAIL_TEMPLATE_ID']!;
    await emailjs.send(emailSeriveId, emailTemplateId, data);
  }
}
