import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//**************************************************
class BaseController //**************************************************
{
  final BuildContext? _context;
  BuildContext? _dialogContext;
  Function? onStateChange;
  static bool isAlreadyShow = false;

  //**************************************************
  BaseController(this._context, this.onStateChange);

  //**************************************************

  //**************************************************
  void dismissKeyBoard()
  //**************************************************
  {
    // FocusScope.of(_context).requestFocus(FocusNode());
  }

  //**************************************************
  void showProgress()
  //**************************************************
  {
    if (isAlreadyShow) {
      return;
    }
    isAlreadyShow = true;
    showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (_context) {
          _dialogContext = _context;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: AlertDialog(
                contentPadding: EdgeInsets.zero,
                titlePadding: const EdgeInsets.symmetric(vertical: 15),
                insetPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      NativeProgress(),
                      SizedBox(width: 20),
                      Text("Loading....")
                    ],
                  ),
                )),
          );
        });
  }

  //**************************************************
  void hideProgress()
  //**************************************************
  {
    try {
      if (BaseController.isAlreadyShow) {
        BaseController.isAlreadyShow = false;
        Navigator.pop(Get.context!);
      }
      //if (_dialogContext != null) Navigator.pop(_dialogContext!);
    } catch (E) {}
  }
}

class NativeProgress extends StatelessWidget {
  const NativeProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator()))
        : Center(
            child: Theme(
                data: ThemeData(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                        brightness: Brightness.light,
                        primaryColor: Colors.white,
                        barBackgroundColor: Colors.white)),
                child: const CupertinoActivityIndicator()),
          );
  }
}
