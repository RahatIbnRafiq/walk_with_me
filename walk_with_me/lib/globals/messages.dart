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
          'sign_out': 'Sign Out',
          'account_already': 'Already have an account?',
          'no_account_yet': 'Don\'t have an account yet?',
          'welcome': 'Welcome!',
          'fill_in_login': "Please enter your login informaion",
          'password_cant_be_empty': "Password cannot be empty",
          'login_failed': "Login Failed",
          'login_error': "The login credentials did not match",
          'signup_failed': "Registration Attempt Failed",
          'signup_error':
              "Something bad happened when we tried to sign youup. Can you try again?",
          'browse_cities': "Browse Cities",
          'discover': "Discover!",
          'search_for_anything':
              "Search for a city, museum, painting, anything!",
          'map_view': "Map View",
          'contact_us': "Contact us",
          'explore': "Explore",
          'start_feedback': "Start Feedback",
          'feedback_data': "# How does it work? \n"
              "1. Just press the `Start Feedback` button.\n"
              "2. The feedback view opens. "
              "You can choose between draw and navigation mode. "
              "When in navigate mode, you can freely navigate in the "
              "app. Try it by opening the navigation drawer or by "
              "tapping the `Open scaffold` button. To switch to the "
              "drawing mode just press the `Draw` button on the right "
              "side. Now you can draw on the screen.\n"
              "3. To finish your feedback just write a message "
              "below and send it by pressing the `Submit` button.",
          'explore_entities': "Explore Entities",
        },
      };
}
