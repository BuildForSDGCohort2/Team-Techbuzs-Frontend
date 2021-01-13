import 'package:Greeneva/ui/Auth/signup_view.dart';

import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    final emailController = TextEditingController();

    final passwordController = TextEditingController();

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 40),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'Cardo',
                          fontSize: 35,
                          color: Color(0xff0C2551),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      //
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 5),
                      child: Text(
                        'Sign In with',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  //
                  SizedBox(
                    height: 30,
                  ),
                  //
                  Container(
                    margin: EdgeInsets.only(left: 38),
                    child: Row(
                      children: [
                        Newbutton(
                          onP: () => LoginViewModel().googlelogin(),
                          char: 'https://techbuzs.github.io/I/Google.png',
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Newbutton(
                          onP: () => LoginViewModel().facebooklogin(),
                          char: 'https://techbuzs.github.io/I/FB.png',
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Newbutton(
                          onP: () => model.twitterlogin(),
                          char: 'https://techbuzs.github.io/I/Twitter-Logo.png',
                        )
                      ],
                    ),
                  ),
                  //

                  //
                  SizedBox(
                    height: 30,
                  ),
                  //
                  MyCustomInputBox(
                    label: 'Email',
                    inputHint: 'juwonr@greeneva.com',
                    kTextEditingController: emailController,
                  ),
                  //
                  SizedBox(
                    height: 30,
                  ),
                  //
                  MyCustomInputBox(
                    label: 'Password',
                    kTextEditingController: passwordController,
                    inputHint: '',
                  ),
                  //
                  SizedBox(
                    height: 30,
                  ),
                  //

                  model.busy == true
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: scrWidth * 0.35,
                          height: 53,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            // widthFactor: 2,
                            child: CircularProgressIndicator(),
                          ))
                      : GestureDetector(
                          onTap: () async {
                            model.login(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: scrWidth * 0.85,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Color(0xff0962ff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8f9db5).withOpacity(0.45),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff90b7ff),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ClipPath(
                clipper: OuterClippedPart(),
                child: Container(
                  color: Color(0xff0962ff),
                  width: scrWidth,
                  height: scrHeight,
                ),
              ),
              //
              ClipPath(
                clipper: InnerClippedPart(),
                child: Container(
                  color: Color(0xff0c2551),
                  width: scrWidth,
                  height: scrHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
