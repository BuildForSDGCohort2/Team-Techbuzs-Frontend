import 'dart:js';

import 'package:Greeneva/Services/Location_web/api.dart';
import 'package:Greeneva/Services/Location_web/helpers.dart';
import 'package:Greeneva/ui/shared/ui_helper.dart';
import 'package:Greeneva/ui/widgets/busy_button.dart';
import 'package:Greeneva/ui/widgets/input_field.dart';
import 'package:Greeneva/viewmodels/signup_view_model.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
// import 'package:js/js.dart';
import 'package:stacked/stacked.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  void initState() {
    super.initState();
  }

  final emailController = TextEditingController();
  var kGoogleApiKey = "AIzaSyCNcGh71dCLlDQ_SHisGQOdIUzcpePepeM";

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final localityController = TextEditingController();
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _city = '';

  @override
  Widget build(BuildContext context) {
    // GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                ),
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
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Locality',
                password: false,
                controller: localityController,
                // additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              BusyButton(
                title: 'Get Locality',
                onPressed: () async {
                  // ignore: missing_return
                  getCurrentPosition(allowInterop((pos) {
                    setState(() {
                      _latitude = pos.coords.latitude.toDouble();
                      _longitude = pos.coords.longitude.toDouble();
                    });
                  }));
                  print(
                      'This is' + _latitude.toString() + _longitude.toString());
                  final _val = await LocationAPI().fetchData();
                  setState(() => _city = _val);
                },
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
      ),
    );
  }

  // Future<Null> displayPrediction(Prediction p) async {
  //   GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  //   if (p != null) {
  //     PlacesDetailsResponse detail =
  //         await _places.getDetailsByPlaceId(p.placeId);

  //     var placeId = p.placeId;
  //     double lat = detail.result.geometry.location.lat;
  //     double lng = detail.result.geometry.location.lng;

  //     var address = await Geocoder.local.findAddressesFromQuery(p.description);

  //     print(lat);
  //     print(lng);
  //   }
  // }
}
