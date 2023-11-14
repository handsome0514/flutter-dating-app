import 'package:bematched/config.dart';
import 'package:bematched/screens/navbar_screen/navbar_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_button.dart';
import 'location_screen_controller.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final _controller = Get.put(LocationScreenController());

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
                value: 1,
                borderRadius: BorderRadius.circular(20),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Where are you located?',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Obx(
                () => (_controller.isNotPermision.value == false)
                    ? SizedBox(
                        height: 219,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: _controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GoogleMap(
                                  zoomControlsEnabled: false,
                                  myLocationEnabled: true,
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        _controller
                                            .currentLocation!.latitude!,
                                        _controller
                                            .currentLocation!.longitude!),
                                    zoom: 14.4746,
                                  ),
                                ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Location is not Provided.',
                          style: GoogleFonts.playfairDisplay(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 25),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '8 / 8',
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
                          buttonLabel: 'Start',
                          onTap: _controller.setLocation,
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
