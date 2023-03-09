import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mrc_mobile_app/Funtions/button.dart';
import 'package:mrc_mobile_app/mrc_bar_chart.dart';
import 'package:mrc_mobile_app/message_page.dart';
import 'Funtions/message_card1.dart';
import 'providers/water_data_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() => runApp(const Homepage());


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    WaterDataPoint(0, 0, 'Kandal'),
    WaterDataPoint(1, 20, 'Kandal'),
    WaterDataPoint(2, 10, 'Kandal'),
    WaterDataPoint(3, 40, 'kandal'),
    WaterDataPoint(4, 10, 'Kandal'),
    WaterDataPoint(5, 10, 'Kandal'),
    WaterDataPoint(6, 80, 'kandal'),
    WaterDataPoint(7, 100, 'Kandal'),
  ];
  bool _isLineChart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Water Monitoring',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 39, 62),
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Water Level Trend',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color.fromARGB(174, 255, 2, 2),
                  fontSize: 14,
                ),
              ),
            ),
            buildChart(),
            const SizedBox(height: 20),
            Button(
              onPressed: () {
                setState(() {
                  _isLineChart = !_isLineChart;
                });
              },
              label: 'Bar Chart',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Province: ${_data.last.province}',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 9, 14, 54),
                      fontSize: 14,
                    ),
                  ),
                ),
                const Text('/'),
                Text('Water Height: ${_data.last.level} M',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                      color: Color.fromARGB(255, 209, 10, 10),
                    ))),
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

  Widget buildVisibility({
    required bool visible,
    required Widget child,
  }) {
    return Visibility(
      visible: visible,
      child: TweenAnimationBuilder<int>(
        duration: const Duration(milliseconds: 250),
        tween: IntTween(begin: 0, end: 1),
        child: child,
        builder: (context, value, child) {
          return AnimatedOpacity(
            opacity: value == 1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 250),
            child: child,
          );
        },
      ),
    );
  }

  Widget buildChart() {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          buildVisibility(
            visible: !_isLineChart,
            child: MrcBarChart(data: _data),
          ),
          buildVisibility(
            visible: _isLineChart,
            child: charts.LineChart(
              [
                charts.Series<WaterDataPoint, int>(
                  id: 'Water Level',
                  colorFn: (_, __) => charts.MaterialPalette.black,
                  data: _data,
                  domainFn: (WaterDataPoint dataPoint, _) => dataPoint.time,
                  measureFn: (WaterDataPoint dataPoint, _) => dataPoint.level,
                ),
              ],
              animate: true,
              defaultRenderer: charts.LineRendererConfig(includeArea: true),
            ),
          ),
        ],
      ),
    );
  }
}
