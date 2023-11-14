import 'package:bematched/config.dart';
import 'package:bematched/widgets/gender_selection.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/custom_button.dart';
import '../flow5_birth_screen/birth_screen.dart';
import 'gender_screen_controller.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final _controller = Get.put(GenderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              LinearProgressIndicator(
                backgroundColor: const Color(0xFFD9D9D9),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.black,
                ),
                value: 0.375,
                borderRadius: BorderRadius.circular(20),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What is your Gender?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 35),
              Obx(
                () => Column(
                  children: List.generate(
                    _controller.gender.length,
                    (index) => GenderSelection(
                      onTap: () => _controller.selectedGender.value = index,
                      isSelected: _controller.selectedGender.value == index,
                      label: _controller.gender[index],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '3 / 8',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(50),
                          buttonLabel: 'Back',
                          onTap: Get.back,
                          borderColor: AppColors.themeColor,
                          buttonColor: AppColors.whiteColor,
                          textColor: AppColors.themeColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(50),
                          buttonLabel: 'Next',
                          onTap: _controller.setGender,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
