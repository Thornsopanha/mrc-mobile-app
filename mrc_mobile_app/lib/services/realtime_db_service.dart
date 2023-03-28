import 'package:firebase_database/firebase_database.dart';
import 'package:mrc_mobile_app/providers/water_data_provider.dart';

class RealtimeDbService {
  FirebaseDatabase get database => FirebaseDatabase.instance;
  final String url = 'https://mrcwaterlevel-default-rtdb.firebaseio.com';

  Future<List<WaterDataPoint>?> fetch() async {
    final DatabaseReference reference = database.refFromURL(url);
    final DataSnapshot result = await reference.get();

    Object? value = result.value;
    if (value is! Map) return [];

    final lavels = value['Level'];
    if (lavels is! Map) return [];

    List<WaterDataPoint> waterDatasPoints = [];
    int sampleTime = 0;

    for (Map e in lavels.values) {
      int? level = int.tryParse(e['Level'].toString());
      if (level == null) continue;

      waterDatasPoints.add(WaterDataPoint(
        sampleTime++,
        e['Level'],
        'Phnom Penh',
        DateTime.now().add(Duration(milliseconds: sampleTime)),
      ));
    }

    return waterDatasPoints.take(10).toList();
  }
}
