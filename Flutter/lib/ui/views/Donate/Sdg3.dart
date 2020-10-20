import 'package:flutter/material.dart';

class SDG3 extends StatelessWidget {
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
                          'assets/SDGs/sdg3.png',
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
                              "Ensure healthy lives and promote well-being for all at all ages",
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
  The UN explains: "Significant strides have been made in increasing life expectancy and reducing some of the common killers responsible for child and maternal mortality.

Major progress has also been made on increasing access to clean water and sanitation, reducing malaria, tuberculosis, polio and the spread of HIV/AIDS.

However, many more efforts are needed to control a wide range of diseases and address many different persistent and emerging health issues."

In-depth analysis across a range of health-related topics can be found at the Our World in Data entries on:\n

- Global Health,
- Polio,
- Life Expectancy,
- Maternal Mortality,
- Child Mortality,
- Malaria,
- HIV/AIDS,
- Suicide,
- Burden of Disease,
- Eradication of Diseases,
- Causes of Death,
- Financing Healthcare,
-  Smoking.\n
The UN has defined 13 Targets and 28 Indicators for SDG 3. Targets specify the goals and Indicators represent the metrics by which the world aims to track whether these Targets are achieved. Below we quote the original text of all Targets and show the data on the agreed Indicators.
   
    """,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: MaterialButton(
                color: Colors.green,
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
