import 'package:flutter/material.dart';
import 'package:stack_app/ui/shared/ui_helpers.dart';
import 'package:stack_app/ui/shared/styles.dart';
//import 'package:stack_app/ui/shared/ui_helpers.dart';
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
    required this.onMainButtonTapped, 
    required this.onCreateAccountTapped, 
    required this.onForgotPassword, 
    required this.onBackPressed, 
    required this.onSignInWithApple, 
    required this.onSignInWithGoogle, 
    required this.validationMessage, 
    this.showTermsText = false,
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
              ),
              verticalSpaceSmall,
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: screenWidthPercentage(context, percentage:0.7),
                  child: Text(
                    subtitle,
                    style: ktsMediumGreyBodyText,
                  ),
                ),
              ),
              verticalSpaceRegular,
              form,
              verticalSpaceRegular,
              if(onForgotPassword != null)
               Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onForgotPassword(),
                  child: Text(
                    "Forgot Password",
                    style: ktsMediumGreyBodyText.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),

                ),
               ),
               verticalSpaceRegular,
               if(validationMessage != null)
               Text(
                validationMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: kBodyTextSize
                ),
               ),
               if(validationMessage != null) verticalSpaceRegular,
               GestureDetector(
                onTap: onMainButtonTapped(),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: busy
                  ?CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
                  : Text(
                    mainButtonTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),)
                ),
               ),
               verticalSpaceRegular,
               if(onCreateAccountTapped != null)
               GestureDetector(
                onTap: onCreateAccountTapped(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account"),
                    horizontalSpaceTiny,
                    Text(
                      "Create an account",
                      style: TextStyle(
                        color: kcPrimaryColor
                      ),
                    )
                  ],),
               ),
               if(showTermsText)
               Text("By signing up you agree to our term, conditions and privacy policy.",
               style: ktsMediumGreyBodyText,
               textAlign: TextAlign.center,)



          // Other widgets can be added here
        ],
      ),
    );
  }
}
