import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mrc_mobile_app/Funtions/button.dart';
import 'package:mrc_mobile_app/message_page.dart';
import 'Funtions/message_card1.dart';
import 'Funtions/messege_card.dart';
import 'providers/water_data_provider.dart';

void main() => runApp(const Homepage());

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<WaterDataPoint> _data = [
    WaterDataPoint(0, 10, 'Kandal'),
    WaterDataPoint(1, 20, 'Kandal'),
    WaterDataPoint(2, 10, 'Kandal'),
    WaterDataPoint(3, 40, 'kandal'),
    WaterDataPoint(4, 10, 'Kandal'),
    WaterDataPoint(5, 60, 'Kandal'),
  ];
  bool _isLineChart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Water Monitoring',
          style: TextStyle(
            fontFamily: 'CADTMonoDisplay',
            color: Color.fromARGB(255, 10, 39, 62),
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text('Water Level Trend',
                style: TextStyle(
                    color: Color.fromARGB(174, 255, 2, 2),
                    fontFamily: 'CADTMonoDisplay',
                    fontSize: 14)),
            SizedBox(
                height: 300,
                child: _isLineChart
                    ? charts.LineChart(
                        [
                          charts.Series<WaterDataPoint, int>(
                            id: 'Water Level',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.red.shadeDefault,
                            data: _data,
                            domainFn: (WaterDataPoint dataPoint, _) =>
                                dataPoint.time,
                            measureFn: (WaterDataPoint dataPoint, _) =>
                                dataPoint.level,
                          ),
                        ],
                        animate: true,
                        defaultRenderer:
                            charts.LineRendererConfig(includeArea: true),
                      )
                    : charts.LineChart(
                        [
                          charts.Series<WaterDataPoint, int>(
                            id: 'Water Level',
                            colorFn: (_, __) =>
                                charts.MaterialPalette.red.shadeDefault,
                            data: _data,
                            domainFn: (WaterDataPoint dataPoint, _) =>
                                dataPoint.time,
                            measureFn: (WaterDataPoint dataPoint, _) =>
                                dataPoint.level,
                          ),
                        ],
                        animate: true,
                      )),
            const SizedBox(height: 20),
            Button(
              onPressed: () {
                setState(() {
                  _isLineChart = !_isLineChart;
                });
              },
              label: 'Bar Chart',
              child: const Text('Change to Bar Chart'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Province: ${_data.last.province}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 9, 14, 54),
                      fontFamily: 'CADTMonoDisplay',
                      fontSize: 12),
                ),
                const Text('/'),
                Text('Water Height: ${_data.last.level} M',
                    style: const TextStyle(
                        color: Colors.red,
                        fontFamily: 'CADTMonoDisplay',
                        fontSize: 12)),
              ],
            ),
            MessageCard1(
              title: "Water Level Alert",
              content: "Current water level: ${_data.last.level} M ",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 35,
              color: Color.fromARGB(255, 6, 15, 65),
            ),
            label: 'Dashboard',
            backgroundColor: Color.fromARGB(255, 198, 198, 198),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              size: 35,
              color: Color.fromARGB(255, 6, 15, 65),
            ),
            label: 'Messages',
            backgroundColor: Color.fromARGB(255, 198, 198, 198),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              size: 35,
              color: Color.fromARGB(255, 6, 15, 65),
            ),
            label: 'Call',
            backgroundColor: Color.fromARGB(255, 198, 198, 198),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagePage(),
                ),
              );
              break;
            // ... handle navigation for other pages ...
          }
        },
      ),
      // ... other widgets ...
    );
  }
}
