import 'package:Greeneva/models/org.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrgDetail extends StatefulWidget {
  final OperationModel model;
  OrgDetail({this.model});
  @override
  _OrgDetailState createState() => _OrgDetailState();
}

class _OrgDetailState extends State<OrgDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organizations"),
        centerTitle: true,
        elevation: 1.5,
        // c
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.model.name,
                  style: GoogleFonts.inter(
                    fontSize: 23,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset(widget.model.selectedIcon),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: Text(widget.model.info),
              ),
              SizedBox(
                height: 20,
              ),
              Text("UN Sustainable Development Goals"),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: Image.asset(
                  "assets/SDGs/" + "sdg" + widget.model.goals + ".png",
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
