import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/inbox_widget.dart';
import '../../widgets/online_user_box.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Online Users',
                  style: TextStyle(
                    fontSize: 15.94,
                    fontFamily: AppFonts.INTER_BOLD,
                    color: AppColors.BLACK,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.81),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  ...List.generate(10, (index) => const OnlineUserBox()),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              height: 7,
              width: double.infinity,
              color: AppColors.whiteColor,
            ),
            const SizedBox(height: 32),
            ...List.generate(10, (index) => const InboxWidget())
          ],
        ),
      ),
    );
  }
}
