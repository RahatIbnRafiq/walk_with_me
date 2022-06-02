import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'registration_error_message':
              'Something bad happened while you tried to sign up!',
          'login_error_message':
              'Something bad happened while you tried to sign in!',
          'apptitle': 'Walk With Me',
          'max_password_length_error':
              'Must have at least 6 character long password',
          'invalid_email_error': 'Email is not valid',
          'error_text': 'There was an error!',
        },
      };
}
