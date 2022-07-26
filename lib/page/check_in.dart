import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/card/time_card.dart';
import 'package:presence/page/permit_page.dart';
import 'package:presence/page/scan_qrcode.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';
import 'package:presence/text/title_group.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: GlobalData.spacing * 5,
              horizontal: GlobalData.spacing * 3,
            ),
            child: Column(children: <Widget>[
              // Head
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: GlobalData.spacing * 4),
                  const Paragraph(
                    title: 'Check In Alert',
                    size: 1,
                    color: GlobalData.neutral_500,
                    weight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: GlobalData.spacing * 4,
                      color: GlobalData.neutral_900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              const Paragraph(
                title: '11:45 AM',
                size: 2,
                color: GlobalData.secondary_400,
                alignment: TextAlign.center,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              const TitleGroup(
                  title: 'Wakey Wakeyy!!',
                  subTitle:
                      'Hy!! attention you have 15 minutes left before late!!'),
              const SizedBox(height: GlobalData.spacing * 3),
              TimeCircularCountdown(
                strokeWidth: GlobalData.spacing * 2,
                diameter: size.width * 0.6,
                countdownCurrentColor: GlobalData.purple_400,
                countdownRemainingColor: GlobalData.purple_200,
                unit: CountdownUnit.minute,
                gapFactor: GlobalData.spacing,
                countdownTotal: 15,
                textStyle: const TextStyle(
                  color: GlobalData.purple_400,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Expanded(
                    child: TimeCard(
                      icon: CustomIcons.schedule,
                      title: '15 January 2022',
                      type: 'date',
                    ),
                  ),
                  SizedBox(width: (GlobalData.spacing * 2) + 4),
                  Expanded(
                    child: TimeCard(
                      icon: CustomIcons.clock,
                      title: 'Night Shift, 12 : 00 AM',
                      type: 'schedule',
                    ),
                  )
                ],
              ),
              const SizedBox(height: GlobalData.spacing * 3),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MainButton(
                      title: 'Permit',
                      type: 'secondary',
                      onPressed: (int val) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PermitPage();
                        }));
                      },
                    ),
                  ),
                  const SizedBox(width: (GlobalData.spacing * 2) + 4),
                  Expanded(
                    child: MainButton(
                      title: 'Scan Qr Code',
                      type: 'primary',
                      onPressed: (int val) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ScanQrCode();
                        }));
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
