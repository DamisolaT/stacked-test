import 'package:flutter/material.dart';
import 'package:stack_app/ui/shared/ui_helpers.dart';
import 'package:stack_app/ui/shared/ui_helpers.dart';

class AuthLayout extends StatelessWidget {
  
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final Function onMainButtonTapped;
  final Function onCreateAccountTapped;
  final Function onForgotPassword;
  final Function onBackPressed;
  final Function onSignInWithApple;
  final Function onSignInWithGoogle;
  final String validationMessage;
  final bool busy;

  const AuthLayout({
    Key? key, 
    required this.title, 
    required this.subtitle, 
    required this.mainButtonTitle, 
    required this.form, 
    required this.showTermsText, 
    required this.onMainButtonTapped, 
    required this.onCreateAccountTapped, 
    required this.onForgotPassword, 
    required this.onBackPressed, 
    required this.onSignInWithApple, 
    required this.onSignInWithGoogle, 
    required this.validationMessage, 
    required this.busy,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed:  onBackPressed(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 34),
              
            )
          // Other widgets can be added here
        ],
      ),
    );
  }
}
