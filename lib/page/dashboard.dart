import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/card/absence_card.dart';
import 'package:presence/card/summary_card.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/page_heading.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: GlobalData.spacing * 5,
              horizontal: GlobalData.spacing * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageHeading(
                  greet: true,
                  type: 'name',
                  name: 'dummy_name'.tr,
                  image:
                      'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
                ),
                const SizedBox(height: GlobalData.spacing * 3),
                const AbsenceCard(
                  title: 'Its Holyday',
                  desc: 'Enjoy your holiday with your family at home',
                  date: '16 January 2022',
                  type: 'info',
                ),
                const SizedBox(height: GlobalData.spacing * 3),
                const Heading(
                  title: 'Summary',
                  size: 6,
                  color: GlobalData.neutral_900,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: GlobalData.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: const <Widget>[
                          SummaryCard(
                            theme: 'primary',
                            isChart: true,
                            chartVal: 0.5,
                            header: 'Absence',
                            contentTitle: '50%',
                            date: 'Januaru 2022',
                          ),
                          SizedBox(
                            height: GlobalData.spacing * 3,
                          ),
                          SummaryCard(
                            theme: 'secondary',
                            isChart: false,
                            header: 'Permit',
                            contentTitle: '2',
                            contentDesc: 'Accepted Permit',
                            date: 'Januaru 2022',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: (GlobalData.spacing * 2) + 4,
                    ),
                    Expanded(
                      child: Column(
                        children: const <Widget>[
                          SummaryCard(
                            theme: 'secondary',
                            isChart: false,
                            header: 'Shift',
                            contentTitle: 'Night Shift',
                            contentDesc: '12:00PM - 08:00AM',
                            date: 'Januaru 2022',
                          ),
                          SizedBox(
                            height: GlobalData.spacing * 3,
                          ),
                          SummaryCard(
                            theme: 'secondary',
                            isChart: true,
                            chartVal: 0.2,
                            header: 'Late Entry',
                            contentTitle: '20%',
                            date: 'Januaru 2022',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
