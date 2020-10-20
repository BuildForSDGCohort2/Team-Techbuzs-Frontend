import 'package:flutter/material.dart';

class SDG15 extends StatelessWidget {
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
                          'assets/SDGs/sdg15.png',
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
                              "Sustainably manage forests, combat desertification, halt and reverse land degradation, halt biodiversity loss",
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
  
    The UN explains: Forests cover 30 per cent of the Earth’s surface and in addition to providing food security and shelter, forests are key to combating climate change, protecting biodiversity and the homes of the indigenous population. Thirteen million hectares of forests are being lost every year while the persistent degradation of drylands has led to the desertification of 3.6 billion hectares.
     The UN has defined 12 Targets and 14 Indicators for SDG 15. Targets specify the goals and Indicators represent the metrics by which the world aims to track whether these Targets are achieved. Below we quote the original text of all Targets and show the data on the agreed Indicators.
    """,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: MaterialButton(
                color: Colors.lightGreen,
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
