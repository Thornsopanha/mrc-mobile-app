import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mrc_mobile_app/providers/water_data_provider.dart';

class ApiService {
  static Future<List<WaterDataPoint>?> fetchAll() async {
    final url = Uri.parse("https://mrc.onrender.com/mrc");
    http.Response response = await http.get(url);
    var data = response.body;
    List json = jsonDecode(data);
    List<WaterDataPoint> items = [];

    for (var element in json) {
      if (element is List && element.length == 2) {
        final waterLevel = int.tryParse(element[1]);
        if (waterLevel == null) continue;
        //final date = DateTime.tryParse(element[0]);
        String timestarmp = element[0].toString();
        String time = timestarmp.split(" ")[1];
        //time.split(":")[1];
        int? hour = int.tryParse(time.split(":")[0]);
        int? minute = int.tryParse(time.split(":")[1]);
        int? second = int.tryParse(time.split(":")[2]);
        String? date = timestarmp.split(" ")[0];
        int? day = int.tryParse(date.split("/")[0]);
        int? month = int.tryParse(date.split("/")[1]);
        int? year = int.tryParse(date.split("/")[2]);
        //"2/19/2023 14:46:21"

// element[0].split(" ") => "2/19/2023", "14:46:21"
// element[0].split(" ")[0] => "2/19/2023"
// var date = element[0].split(" ")[0]
// date = "2/19/2023"
// date.split("/") => 2, 19, 2023
// date.split("/")[1] => 19
// int? day = int.tryParse(date.split("/")[1])

        if (minute != null &&
            year != null &&
            month != null &&
            day != null &&
            hour != null &&
            second != null) {
          items.add(WaterDataPoint(items.length + 1, waterLevel, "kandal",
              DateTime(year, month, day, hour, minute, second)));
        }
      }
    }
    print(items);
    return items.take(10).toList();
  }
}
