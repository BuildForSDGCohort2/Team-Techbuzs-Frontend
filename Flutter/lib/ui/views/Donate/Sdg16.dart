import 'package:flutter/material.dart';

class SDG16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 180,
                        child: Image.asset(
                          'assets/SDGs/sdg16.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Promote just, peaceful and inclusive societies",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                """
  
   The UN explains: Goal 16 of the Sustainable Development Goals is dedicated to the promotion of peaceful and inclusive societies for sustainable development, the provision of access to justice for all, and building effective, accountable institutions at all levels.

This aims to promote peaceful societies at national levels, as well as the role of cooperation at the international level.

You can find further details on the topics aligned to peace, cooperation and justice in the Our World in Data entries on War and Peace, Terrorism, Military Spending, Nuclear Weapons, Homicides, Human Rights, Corruption and Violence Against & Rights for Children.

The UN has defined 12 Targets and 23 Indicators for SDG 16. Targets specify the goals and Indicators represent the metrics by which the world aims to track whether these Targets are achieved. Below we quote the original text of all Targets and show the data on the agreed Indicators.
    """,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: MaterialButton(
                color: Colors.blueAccent,
                child: Text(
                  "Donate",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
