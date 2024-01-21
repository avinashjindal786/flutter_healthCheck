import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:flutter_assignment/core/helpers/constants.dart';
import 'package:flutter_assignment/core/utils/fonts_and_sizes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/widgets/AppBar/appbar_with_icon.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime _focusday = DateTime.now();
  DateTime? _selectedday;
  int day = 0;
  int? month;
  int? year;
  bool flag = false;
  bool afterOneWeek = false;

  String? selectTime;

  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService = NavigationService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: CommonAppBar(
            name: "Book Appointment",
            backButton: true,
            action: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Icons.more_vert,
                color: FontColors.skyBlueColor,
              ),
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: InkWell(
          onTap: () {
            navigationService.back(result: [_selectedday, selectTime]);
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 55,
            decoration: BoxDecoration(color: selectTime != null && _selectedday != null ? FontColors.primaryColor : Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              selectTime != null && _selectedday != null ? "Confirm" : "Next",
              style: TextStyles.urbanistBold.white.f14,
            )),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Date",
              style: TextStyles.urbanistBold.black.f12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: TableCalendar(
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusday,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekHeight: 25,
                headerStyle: const HeaderStyle(titleCentered: true, formatButtonVisible: false, titleTextStyle: TextStyle(fontSize: 20), leftChevronIcon: Icon(Icons.arrow_left_rounded, color: Colors.grey, size: 50), rightChevronIcon: Icon(Icons.arrow_right_rounded, color: Colors.grey, size: 50)),
                calendarBuilders: CalendarBuilders(
                  outsideBuilder: (context, day, focusedDay) => Container(),
                ),
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(shape: BoxShape.circle, color: FontColors.lightBlueColor, border: Border.all(color: Colors.blue)),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: FontColors.primaryColor,
                    )),
                onDaySelected: (selectedDay, focusedDay) => {
                  log("selected"),
                  if (!isSameDay(_selectedday, selectedDay))
                    {
                      setState(() {
                        afterOneWeek = false;
                        _focusday = focusedDay;
                        _selectedday = selectedDay;
                        day = selectedDay.day;
                        month = selectedDay.month;
                        year = selectedDay.year;
                        _focusday = selectedDay;
                        flag = true;
                      })
                    }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedday, day);
                },
              ),
            ),
            Text(
              "Select Date",
              style: TextStyles.urbanistBold.black.f12,
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
                spacing: 18,
                runSpacing: 12,
                children: List.generate(
                  timeList.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectTime = timeList[index];
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 36,
                      decoration: ShapeDecoration(
                        color: selectTime == timeList[index] ? FontColors.primaryColor : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2, color: Color(0xFF10217D)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          timeList[index],
                          style: selectTime == timeList[index] ? TextStyles.urbanistRegular.white.f12 : TextStyles.urbanistRegular.greyDark.f12,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
