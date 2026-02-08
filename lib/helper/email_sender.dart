import 'package:dio/dio.dart';

class EmailSender {
  static Future<void> sendEmail(Map<String, dynamic> data) async {
    // print(dotenv.env);
    // final emailSeriveId = dotenv.env['EMAIL_SERVICE_ID']!;
    // final emailTemplateId = dotenv.env['EMAIL_TEMPLATE_ID']!;
    const emailSeriveId = String.fromEnvironment(
      'EMAIL_SERVICE_ID',
      defaultValue: 'test',
    );
    const emailTemplateId = String.fromEnvironment(
      'EMAIL_TEMPLATE_ID',
      defaultValue: 'test_temp',
    );
    const publicKey = String.fromEnvironment('EMAIL_PUBLIC_KEY');
    const privateKey = String.fromEnvironment('EMAIL_PRIVATE_KEY');
    final dio = Dio();
    final Map<String, dynamic> req = {
      "service_id": emailSeriveId,
      "template_id": emailTemplateId,
      "user_id": publicKey,
      "template_params": data,
      "accessToken": privateKey,
    };
    await dio.post('https://api.emailjs.com/api/v1.0/email/send', data: req);
  }
}
