import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_login/flutter_login.dart';
import '../../global.dart';
import 'screens.dart';

const users = {
  'jeniffer@gmail.com': '12345',
  'demo@gmail.com': '12345',
  'demo': '12345',
  'example@email.com': '12345',
  'user': '12345',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    print('---------Auth information ---------------');
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }

      print('---login-----');

      SharedPreferencesStorage.setSharedPreference(
          'string', 'user_email', data.name);
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return "Exits";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: tr('app_name'),
      logo: 'assets/images/dogus-ivf-login-logo.png',
      onLogin: _authUser,
      // onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Colors.pinkAccent,
        titleStyle: TextStyle(
          fontSize: 15,
          letterSpacing: 4,
        ),
      ),
      messages: LoginMessages(
        userHint: tr('app_login_username_placeholder'),
        passwordHint: tr('app_login_password_placeholder'),
        confirmPasswordHint: tr('app_login_confirm_password_placeholder'),
        loginButton: tr('app_login_login_btn'),
        signupButton: tr('app_login_sign_up_btn'),
        forgotPasswordButton: tr('app_login_forgot_password_placeholder'),
        recoverPasswordButton: tr('app_login_recover_password_btn'),
        goBackButton: tr('app_login_go_back_btn'),
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }
}
