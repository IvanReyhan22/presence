import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/widgets/card/record_card.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/page_heading.dart';
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
      backgroundColor: AppConstants.purple_400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: AppConstants.spacing * 5,
                bottom: AppConstants.spacing * 1,
                left: AppConstants.spacing * 3,
                right: AppConstants.spacing * 3,
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
                  horizontal: AppConstants.spacing * 2),
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
                    color: AppConstants.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: AppConstants.white,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppConstants.white,
                    size: 15,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppConstants.white,
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultRadius * 5),
                  ),
                  todayTextStyle:
                      const TextStyle(color: AppConstants.purple_400),
                  weekendTextStyle: const TextStyle(
                    color: AppConstants.white,
                  ),
                  defaultTextStyle: const TextStyle(color: AppConstants.white),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: AppConstants.white),
                  weekendStyle: TextStyle(color: AppConstants.secondary_200),
                ),
              ),
            ),
            const SizedBox(
              height: AppConstants.spacing * 3,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppConstants.spacing * 3),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppConstants.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppConstants.defaultRadius),
                    topRight: Radius.circular(AppConstants.defaultRadius),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Record January 22',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppConstants.neutral_900,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacing * 3),
                      const RecordCard(
                        type: 0,
                      ),
                      const SizedBox(height: AppConstants.spacing * 3),
                      const RecordCard(
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
