import 'package:Greeneva/ui/shared/app_colors.dart';
import 'package:Greeneva/ui/shared/ui_helper.dart';
import 'package:Greeneva/ui/widgets/busy_button.dart';
import 'package:Greeneva/ui/widgets/input_field.dart';
import 'package:Greeneva/viewmodels/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var lat;
  var long;

  @override
  void initState() {
    super.initState();
  }

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final localityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 38, color: mainPrimary),
                ),
                verticalSpaceLarge,
                InputField(
                  placeholder: 'Full Name',
                  controller: fullNameController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Locality',
                  password: false,
                  controller: localityController,
                ),
                verticalSpaceSmall,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Sign Up',
                      busy: model.busy,
                      onPressed: () {
                        model.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            fullName: fullNameController.text,
                            location: localityController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
