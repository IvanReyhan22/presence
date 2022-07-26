import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/card/record_card.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/heading.dart';
import 'package:presence/text/page_heading.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalData.purple_400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: GlobalData.spacing * 5,
                bottom: GlobalData.spacing * 1,
                left: GlobalData.spacing * 3,
                right: GlobalData.spacing * 3,
              ),
              child: PageHeading(
                greet: false,
                isDark: true,
                type: 'heading',
                name: 'record'.tr,
                image:
                    'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalData.spacing * 2),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2022, 12, 30),
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: GlobalData.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: GlobalData.white,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: GlobalData.white,
                    size: 15,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: GlobalData.white,
                    borderRadius:
                        BorderRadius.circular(GlobalData.defaultRadius * 5),
                  ),
                  todayTextStyle: const TextStyle(color: GlobalData.purple_400),
                  weekendTextStyle: const TextStyle(
                    color: GlobalData.white,
                  ),
                  defaultTextStyle: const TextStyle(color: GlobalData.white),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: GlobalData.white),
                  weekendStyle: TextStyle(color: GlobalData.secondary_200),
                ),
              ),
            ),
            const SizedBox(
              height: GlobalData.spacing * 3,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(GlobalData.spacing * 3),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: GlobalData.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(GlobalData.defaultRadius),
                    topRight: Radius.circular(GlobalData.defaultRadius),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Heading(
                        title: 'Record January 22',
                        size: 6,
                        color: GlobalData.neutral_900,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: GlobalData.spacing * 3),
                      RecordCard(
                        type: 0,
                      ),
                      SizedBox(height: GlobalData.spacing * 3),
                      RecordCard(
                        type: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
