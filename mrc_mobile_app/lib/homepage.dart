import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mrc_mobile_app/Funtions/button.dart';
import 'package:mrc_mobile_app/mrc_bar_chart.dart';
import 'package:mrc_mobile_app/message_page.dart';
import 'package:mrc_mobile_app/services/api_service.dart';
import 'package:mrc_mobile_app/services/realtime_db_service.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'Funtions/message_card1.dart';
import 'providers/water_data_provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<WaterDataPoint> _data = [];
  bool _isLineChart = true;
  bool loadFromCsv = false;

  @override
  void initState() {
    loadDataPoints();
    super.initState();
  }

  Future<void> loadDataPoints() async {
    final loader =
        loadFromCsv ? ApiService.fetchAll() : RealtimeDbService().fetch();
    return loader.then((value) {
      setState(() {
        _data = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.table_chart_outlined,
              color: loadFromCsv
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              setState(() {
                loadFromCsv = !loadFromCsv;
              });
            },
          ),
        ],
        title: Center(
          child: Text(
            'Water Monitoring',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 39, 62),
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () => loadDataPoints(),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Text(
              'Water Level Trend',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
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
            if (_data.isNotEmpty) buildInfos(),
            if (_data.isNotEmpty)
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
            case 2:
              launchUrlString('tel:010252624');
              break;
            // ... handle navigation for other pages ...
          }
        },
      ),
      // ... other widgets ...
    );
  }

  Row buildInfos() {
    return Row(
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
                textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromARGB(255, 209, 10, 10),
            ))),
      ],
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
