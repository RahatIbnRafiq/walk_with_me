import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'registration_error_message':
              'Something bad happened while you tried to sign up!',
          'create_account': 'Create Your Account',
          'fill_in_info': "Fill in the information below",
          'login_error_message':
              'Something bad happened while you tried to sign in!',
          'apptitle': 'Walk With Me',
          'max_password_length_error':
              'Must have at least 6 characters long password',
          'invalid_email_error': 'Email is not valid',
          'error_text': 'There was an error!',
          'passwords_do_not_match': 'Passwords do not match',
          'email': 'Email',
          'password': 'Password',
          'confirm_password': 'Confirm Password',
          'sign_up': 'Sign Up',
          'sign_in': 'Sign In',
          'account_already': 'Already have an account?',
          'no_account_yet': 'Don\'t have an account yet?',
          'welcome': 'Welcome!',
          'fill_in_login': "Please enter your login informaion",
          'password_cant_be_empty': "Password cannot be empty",
        },
      };
}
