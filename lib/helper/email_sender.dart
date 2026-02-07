import 'package:emailjs/emailjs.dart' as emailjs;

class EmailSender {
  static Future<void> sendEmail(Map<String, dynamic> data) async {
    // print(dotenv.env);
    // final emailSeriveId = dotenv.env['EMAIL_SERVICE_ID']!;
    // final emailTemplateId = dotenv.env['EMAIL_TEMPLATE_ID']!;
    const emailSeriveId = String.fromEnvironment('EMAIL_SERVICE_ID');
    const emailTemplateId = String.fromEnvironment('EMAIL_TEMPLATE_ID');
    await emailjs.send(emailSeriveId, emailTemplateId, data);
  }
}
