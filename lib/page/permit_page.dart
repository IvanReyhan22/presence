import 'package:flutter/material.dart';
import 'package:presence/button/circular_image_button.dart';
import 'package:presence/button/main_button.dart';
import 'package:presence/input/date_picker.dart';
import 'package:presence/input/rounded_input.dart';
import 'package:presence/page/main_app.dart';
import 'package:presence/page/permit_confirmation.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';

class PermitPage extends StatelessWidget {
  const PermitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: GlobalData.spacing * 5,
            horizontal: GlobalData.spacing * 3,
          ),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  // Head
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          CustomIcons.arrowleft,
                          size: GlobalData.spacing * 4,
                          color: GlobalData.neutral_900,
                        ),
                      ),
                      const Paragraph(
                        title: 'Permit',
                        size: 1,
                        color: GlobalData.neutral_500,
                        weight: FontWeight.w500,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const MainApp();
                          }));
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
                  Row(
                    children: const <Widget>[
                      CircularImageButton(
                        icon: CustomIcons.camera,
                        size: GlobalData.spacing * 6,
                      ),
                      SizedBox(width: GlobalData.spacing * 2),
                      Paragraph(
                        title: 'Document / image',
                        size: 2,
                        color: GlobalData.neutral_500,
                      )
                    ],
                  ),
                  const SizedBox(height: GlobalData.spacing * 3),
                  DatePicker(
                    icon: CustomIcons.calendar,
                    label: 'Date',
                    hintText: '15 January 2022',
                    color: GlobalData.neutral_500,
                    onChanged: (val) {},
                    controller: _controller,
                  ),
                  const SizedBox(height: GlobalData.spacing * 3),
                  RoundedInput(
                    label: 'Reason',
                    color: GlobalData.neutral_500,
                    onChanged: (val) {},
                    controller: _controller,
                    maxLines: 8,
                  ),
                  const Expanded(
                      child: SizedBox(height: GlobalData.spacing * 3)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: MainButton(
                          title: 'Cancel',
                          type: 'secondary',
                          onPressed: (int val) {},
                        ),
                      ),
                      const SizedBox(width: (GlobalData.spacing * 2) + 4),
                      Expanded(
                        child: MainButton(
                          title: 'Submit',
                          type: 'primary',
                          onPressed: (int val) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PermitConfirmation();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
