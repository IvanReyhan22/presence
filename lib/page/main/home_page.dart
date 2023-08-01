import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presence/controller/main/home_page_controller.dart';
import 'package:presence/page/checkIn/check_in_page.dart';
import 'package:presence/widgets/card/absence_card.dart';
import 'package:presence/widgets/card/summary_card.dart';
import 'package:presence/common/app_constants.dart';
import 'package:presence/widgets/text/page_heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // final pageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    // return GetX<HomePageController>(
    //   init: HomePageController(),
    //   builder: (controller) => Scaffold(
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.spacing * 5,
            horizontal: AppConstants.spacing * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(controller.personalData.name),
              const Text("Fortune Cookie"),
              PageHeading(
                greet: true,
                type: 'name',
                name: 'dummy_name'.tr,
                image:
                    'https://i.pinimg.com/564x/06/63/f5/0663f52b4e6775adcd134a27853004b3.jpg',
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              AbsenceCard(
                title: 'Its Holyday',
                desc: 'Enjoy your holiday with your family at home',
                date: '16 January 2022',
                type: 'info',
                onPressed: (val) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CheckInPage();
                  }));
                },
              ),
              const SizedBox(height: AppConstants.spacing * 3),
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppConstants.neutral_900,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppConstants.spacing * 3),
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
                          height: AppConstants.spacing * 3,
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
                    width: (AppConstants.spacing * 2) + 4,
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
                          height: AppConstants.spacing * 3,
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
    )
        //   ),
        );
  }
}
