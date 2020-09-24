import 'package:flutter/cupertino.dart';

class IPLTeamData {
  IPLTeamData(
      {Image teamOneLogo,
      Image teamTwoLogo,
      String teamNameOne,
      String teamNameTwo,
      String time,
      String date,
      String day,
      String venue})
      : teamOneLogo = teamOneLogo,
        teamTwoLogo = teamTwoLogo,
        teamNameOne = teamNameOne,
        teamNameTwo = teamNameTwo,
        time = time,
        date = date,
        day = day,
        venue = venue;

  Image teamOneLogo;
  Image teamTwoLogo;
  String teamNameOne;
  String teamNameTwo;
  String date;
  String day;
  String venue;
  String time;
}
