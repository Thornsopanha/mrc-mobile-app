import 'package:flutter/material.dart';
import 'package:mrc_mobile_app/Funtions/messege_card.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 163, 7, 7),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Message"),
              Spacer(),
              Icon(
                Icons.notifications_outlined,
                size: 24.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          ),
        ),
        body: ListView(
          children: const [
            MessageCard(
              location: "Lake Michigan",
              waterLevel: "33.4ft",
              timestamp: "02/05/2023 10:30 AM",
              floodAlert: "No Flood Alert",
              trend: "Rising",
              historicalData: "30.5ft (02/01/2023)",
              predictiveInfo: "Expected to rise to 34.2ft by 02/06/2023",
            ),
            SizedBox(
              height: 10,
            ),
            MessageCard(
              location: "Lake Michigan",
              waterLevel: "33.4ft",
              timestamp: "02/05/2023 10:30 AM",
              floodAlert: "No Flood Alert",
              trend: "Rising",
              historicalData: "30.5ft (02/01/2023)",
              predictiveInfo: "Expected to rise to 34.2ft by 02/06/2023",
            ),
            SizedBox(
              height: 10,
            ),
            MessageCard(
              location: "Lake Michigan",
              waterLevel: "33.4ft",
              timestamp: "02/05/2023 10:30 AM",
              floodAlert: "No Flood Alert",
              trend: "Rising",
              historicalData: "30.5ft (02/01/2023)",
              predictiveInfo: "Expected to rise to 34.2ft by 02/06/2023",
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
