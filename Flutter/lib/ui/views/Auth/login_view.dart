import 'package:Greeneva/ui/shared/app_colors.dart';
import 'package:Greeneva/ui/shared/ui_helper.dart';
import 'package:Greeneva/ui/widgets/busy_button.dart';
import 'package:Greeneva/ui/widgets/input_field.dart';
import 'package:Greeneva/ui/widgets/text_link.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:websafe_svg/websafe_svg.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                      child: WebsafeSvg.asset(
                        'assets/svgs/Login_Background.svg',
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Log In',
                          style: TextStyle(fontSize: 38, color: mainPrimary),
                        ),
                        verticalSpaceLarge,
                        InputField(
                          placeholder: 'Email',
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        InputField(
                          placeholder: 'Password',
                          password: true,
                          controller: passwordController,
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BusyButton(
                              title: 'Login',
                              busy: model.busy,
                              onPressed: () {
                                model.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                            )
                          ],
                        ),
                        verticalSpaceMedium,
                        BusyButton(
                          busy: model.busy,
                          title: 'Google Sign in',
                          onPressed: () {
                            model.googlelogin();
                          },
                        ),
                        verticalSpaceMedium,
                        Center(
                          child: TextLink(
                            'Create an Account if you\'re new.',
                            onPressed: () {
                              model.navigateToSignUp();
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
