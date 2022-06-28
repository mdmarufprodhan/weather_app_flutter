import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infont  = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInformation(String wind,String pressure, String humudity ,String feels_like){

  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
             mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("wind",
                  style:titleFont,
                ),
                SizedBox(height: 10,),
                Text("Pressure",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$wind",
                  style:infont,
                ),
                SizedBox(height: 10,),
                Text("$pressure",
                  style: infont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity",
                  style:titleFont,
                ),
                SizedBox(height: 10,),
                Text("Feels Like",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humudity",
                  style:infont,
                ),
                SizedBox(height: 10,),
                Text("$feels_like",
                  style: infont,
                ),
              ],
            ),
          ],
        ),

      ],
    ),
  );
}