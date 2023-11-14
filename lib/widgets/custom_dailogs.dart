
import 'dart:io';

import 'package:bematched/config.dart';

import '../utils/app_utils.dart';



class CustomDailogs {



  static Future<List<File>> photo_picker(BuildContext context,
      {int? maxPhoto}) async {
    List<File> pathList = [];
    pathList = (await showModalBottomSheet<List<File>>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.89,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 115,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                var images = await AppUtils.PickImages(
                                    source: Sources.Camera,
                                    pickItems: (maxPhoto ?? 1));
                                if (images.isNotEmpty) {
                                  Get.back(result: images);
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 22.2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //  SvgPicture.asset(AppAsset.),
                                    SizedBox(width: 21),
                                    Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                var images = await AppUtils.PickImages(
                                    source: Sources.Gallery,
                                    pickItems: (maxPhoto ?? 1));
                                if (images.isNotEmpty) {
                                  Get.back(result: images);
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 22.2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //    SvgPicture.asset(AppAssets.IMAGE_ICON),
                                    SizedBox(width: 21),
                                    Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13.37),
                  GestureDetector(
                    onTap: () {
                      Get.back(result: <File>[]);
                    },
                    child: Container(
                      height: 57.21,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13.37),
                ],
              ),
            ),
          );
        })) ??
        [];
    return pathList;
  }





}