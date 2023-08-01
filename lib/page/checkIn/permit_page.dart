import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/widgets/button/circular_image_button.dart';
import 'package:presence/widgets/button/main_button.dart';
import 'package:presence/widgets/input/date_picker.dart';
import 'package:presence/widgets/input/rounded_input.dart';
import 'package:presence/page/main_app.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';

class PermitPage extends StatelessWidget {
  const PermitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.spacing * 5,
            horizontal: AppConstants.spacing * 3,
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
                          size: AppConstants.spacing * 4,
                          color: AppConstants.neutral_900,
                        ),
                      ),
                      Text(
                        'Permit',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppConstants.neutral_500,
                            fontWeight: FontWeight.w500),
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
                          size: AppConstants.spacing * 4,
                          color: AppConstants.neutral_900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing * 3),
                  Row(
                    children: <Widget>[
                      const CircularImageButton(
                        icon: CustomIcons.camera,
                        size: AppConstants.spacing * 6,
                      ),
                      const SizedBox(width: AppConstants.spacing * 2),
                      Text(
                        'Document / image',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppConstants.neutral_500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing * 3),
                  DatePicker(
                    icon: CustomIcons.calendar,
                    label: 'Date',
                    hintText: '15 January 2022',
                    color: AppConstants.neutral_500,
                    onChanged: (val) {},
                    controller: _controller,
                  ),
                  const SizedBox(height: AppConstants.spacing * 3),
                  RoundedInput(
                    label: 'Reason',
                    color: AppConstants.neutral_500,
                    onChanged: (val) {},
                    controller: _controller,
                    maxLines: 8,
                  ),
                  const Expanded(
                      child: SizedBox(height: AppConstants.spacing * 3)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: MainButton(
                          title: 'Cancel',
                          type: 'secondary',
                          onPressed: () => Get.back(),
                          isLoading: false,
                        ),
                      ),
                      const SizedBox(width: (AppConstants.spacing * 2) + 4),
                      Expanded(
                        child: MainButton(
                          title: 'Submit',
                          type: 'primary',
                          onPressed: () => Get.offAndToNamed('/permit_confirm'),
                          isLoading: false,
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
