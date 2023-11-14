import 'package:bematched/utils/constants.dart';
import 'package:intl/intl.dart';

import '../config.dart';

class CustomCalender extends StatefulWidget {
  CustomCalender({super.key, required this.onSelected});

  final Function(DateTime) onSelected;

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  DateTime currentMonth = DateTime.now();

  DateTime? date;
  List<DateTime> dateList = [];

  @override
  void initState() {
    setListOfDate(currentMonth);
    // TODO: implement initState
    super.initState();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    DateTime newDate = DateTime(monthDate.year, monthDate.month, 1);
    while (newDate.month == monthDate.month) {
      dateList.add(newDate);
      newDate = newDate.add(const Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentMonth =
                      DateTime(currentMonth.year, currentMonth.month, 0);
                  setListOfDate(currentMonth);
                });
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 15,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  'Birthday',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.INTER_REGULAR,
                    color: AppColors.BLACK,
                  ),
                ),
                Text(
                  DateFormat('yyyy').format(currentMonth),
                  style: const TextStyle(
                    fontSize: 34,
                    fontFamily: AppFonts.INTER_BOLD,
                    color: AppColors.themeColor,
                  ),
                ),
                Text(
                  DateFormat('MMMM').format(currentMonth),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.INTER_REGULAR,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Transform.flip(
              flipX: true,
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentMonth =
                        DateTime(currentMonth.year, currentMonth.month + 2, 0);
                    print('Date>>$currentMonth');
                    setListOfDate(currentMonth);
                  });
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 27),
        GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7),
            children: List.generate(
                dateList.length,
                (index) => AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 3, bottom: 3),
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, left: 0, right: 0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(32.0)),
                              onTap: () {
                                if (DateTime.now().isBefore(dateList[index]))return;
                                date = dateList[index];
                                setState(() {});
                                if (date != null) {
                                  widget.onSelected(date!);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: date == dateList[index]
                                        ? AppColors.themeColor
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(32.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dateList[index].day.toString(),
                                      style: date == dateList[index]
                                          ? const TextStyle(
                                              fontSize: 14,
                                              fontFamily: AppFonts.INTER_BOLD,
                                              color: AppColors.whiteColor,
                                            )
                                          : const TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppFonts.INTER_REGULAR,
                                              color: AppColors.BLACK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 9,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 6,
                              width: 6,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                    )))
      ],
    );
  }
}
