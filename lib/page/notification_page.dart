import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/card/notification_card.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/page_heading.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalData.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: GlobalData.spacing * 5,
              horizontal: GlobalData.spacing * 3,
            ),
            child: Column(
              children: <Widget>[
                PageHeading(
                  greet: false,
                  type: 'heading',
                  name: 'notification'.tr,
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                ),
                const SizedBox(height: GlobalData.spacing * 3),
                const NotificationCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
