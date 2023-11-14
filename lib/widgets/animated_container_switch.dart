import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';


class AnimatedContainerSwitch extends StatefulWidget {
    AnimatedContainerSwitch(
      {Key? key, required this.ison, required this.onChanged, this.onClick})
      : super(key: key);

  bool ison;
  final ValueChanged<bool> onChanged;
  final Function()? onClick;

  Future<void> ontaphandle() async {

  }

  @override
  State<AnimatedContainerSwitch> createState() =>
      _AnimatedContainerSwitchState();
}

class _AnimatedContainerSwitchState extends State<AnimatedContainerSwitch> {
  Color _backgroundcolor = AppColors.GREY.withOpacity(.5);
  Color _ballColor = AppColors.GREY;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        //widget. ison =!widget.ison;
       widget. onChanged(!(widget.ison));
        setState(() {});
      },
      child: AnimatedContainer(
        alignment: widget.ison ? Alignment.topRight : Alignment.topLeft,
        height: 26.4,
        width: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.8),
            color: widget.ison
                ? AppColors.themeColor.withOpacity(.5)
                : AppColors.GREY.withOpacity(.5)),
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.all(4.8),
          child: AnimatedContainer(
            height: 16.8,
            width: 16.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(100.8),
              color: widget.ison ? AppColors.themeColor : AppColors.GREY,
            ),
            duration: const Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
